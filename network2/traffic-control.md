man tc
https://www.lartc.org/lartc.html

what queue to use?
https://www.lartc.org/lartc.html#LARTC.QDISC.ADVICE

shape outgoing, use htb
=======================

shape all (matchall)
see tc-matchall

```sh
#!/usr/bin/env bash
set -e
DEV=${DEV:-"lo"}
RATE=${RATE:-"1mbps"}

on() {
  tc qdisc add dev $DEV root handle 1: htb default 1
  tc class add dev $DEV parent 1: classid 1:1 htb rate $RATE ceil $RATE
  tc filter add dev $DEV parent 1: protocol ip prio 1 matchall flowid 1:1
}

off() {
  tc qdisc del dev $DEV root
}

command=$1
case "$command" in
  on|off)
    $command
    ;;
esac
```

shape all from port 4000 (https://www.lartc.org/lartc.html#AEN1099)

```sh
on() {
  tc qdisc add dev $DEV root handle 1: htb default 1
  tc class add dev $DEV parent 1: classid 1:1 htb rate $RATE ceil $RATE
  tc filter add dev $DEV parent 1: protocol ip prio 1 u32 match ip sport 4000 0xffff flowid 1:1
}
```

But this does limit also traffic from port 9080?
Then it is not better than matchall...

shape incoming?
===============
such as read from docker?
again see https://www.lartc.org/lartc.html#LARTC.QDISC.TERMINOLOGY

                Userspace programs
                     ^
                     |
     +---------------+-----------------------------------------+
     |               Y                                         |
     |    -------> IP Stack                                    |
     |   |              |                                      |
     |   |              Y                                      |
     |   |              Y                                      |
     |   ^              |                                      |
     |   |  / ----------> Forwarding ->                        |
     |   ^ /                           |                       |
     |   |/                            Y                       |
     |   |                             |                       |
     |   ^                             Y          /-qdisc1-\   |
     |   |                            Egress     /--qdisc2--\  |
  --->->Ingress                       Classifier ---qdisc3---- | ->
     |   Qdisc                                   \__qdisc4__/  |
     |                                            \-qdiscN_/   |
     |                                                         |
     +----------------------------------------------------------+

> Thanks to Jamal Hadi Salim for this ASCII representation.
> 
> The big block represents the kernel. The leftmost arrow represents traffic entering your machine from the network. It is then fed to the Ingress Qdisc which may apply Filters to a packet, and decide to drop it. This is called 'Policing'.

ingress has no queue... it can only drop (?).

therefore, an approach is to forward to another interface and egress on it.
https://serverfault.com/questions/350023/tc-ingress-policing-and-ifb-mirroring.

> The advantage of this approach is that egress rules are much more flexible than ingress filters. Filters only allow you to drop packets

see 

* `man tc-mirred`
* `/sbin/modinfo ifb`

let's do that

```
modprobe ifb numifbs=1
ip link set ifb0 up
```

redirect incoming traffic to `docker0` to an `ifb0`

```
tc qdisc add dev docker0 handle ffff: ingress
tc filter add dev docker0 parent ffff: protocol ip matchall action mirred egress redirect dev ifb0
```

Then can shape egress of ifb0?

```
time PGPASSWORD=chut psql --host=172.17.0.2 postgres postgres -At <1mb.sql >/dev/null
```

Put an htb rate=10kbps on `ifb0`, from 0m0.066s to 1m49.818s.
