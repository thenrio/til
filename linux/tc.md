TL;DR not able to shape that precisely

the plan
========
network


      host    lo?      docker0                    container
    +--------+            +-------------------------------------------------------------+
    |        |            | +-----------------+                                         |
    |        |            | | vsftpd          |=> /var/lib/sirl/ECHANGES/IN/LECRFID -+  |
    |   2121 |------------> | 21              |                                      |  |
    |  12121 |------------> | 12121 ( pasv )  |                    inotify           |  |
    |        |            | +-----------------+   +------pickle <--------------------+  |
    |        |            |                       |                                     |
    |        |            |                       |                                     |
    |   7080 |<-----------------------------------+                                     |
    +--------+            +-------------------------------------------------------------+


Given a ~4ko file

    wc -c spec/files/tunnel/T6894513.TXT
    4690 spec/files/tunnel/T6894513.TXT

rate limit so that ftp put is __SLOW__

want to slow down tcp from host to container port 12121

> port on lo doing that is an ephemeral port...

how to do that?
===============

* man tc
* man tc-u32

do it and fail :)
=================

    #!/usr/bin/env bash
    set -e
    on() {
      device=$1
      ip6tables -t mangle -I PREROUTING -p tcp --dport 12121 -j MARK --set-mark 404

      # shape
      tc qdisc add dev $device root handle 1: htb default 1

      tc class add dev $device parent 1:0 classid 1:1   htb rate   1mbps ceil   1mbps
      tc class add dev $device parent 1:1 classid 1:404 htb rate  512bps ceil  512bps

      tc filter add dev $device parent 1: protocol ipv6 prio 1 handle 404 fw flowid 1:404
    }

    off() {
      device=$1
      ip6tables -t mangle -F PREROUTING 
      tc qdisc del dev $device root
    }

    command=$1
    device=${2:-"lo"}
    case "$command" in
      on)
        on $device
        ;;
      off)
      off $device
      ;;
    esac

next plan
=========
read the source code!

documentation
=============
* rate limit http://lartc.org/howto/lartc.ratelimit.single.html
* also see http://wiki.linuxwall.info/doku.php/en:ressources:dossiers:networking:traffic_control
* and also http://www.linuxfoundation.org/collaborate/workgroups/networking/netem
* and https://wiki.archlinux.org/index.php/Advanced_traffic_control
