man tc
https://www.lartc.org/lartc.html

shape outgoing

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
