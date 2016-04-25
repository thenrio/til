used to shape traffic sent

* rate limit http://lartc.org/howto/lartc.ratelimit.single.html
* also see http://wiki.linuxwall.info/doku.php/en:ressources:dossiers:networking:traffic_control
* and also http://www.linuxfoundation.org/collaborate/workgroups/networking/netem
* and https://wiki.archlinux.org/index.php/Advanced_traffic_control

Given a ~4ko file

    wc -c spec/files/tunnel/T6894513.TXT
    4690 spec/files/tunnel/T6894513.TXT

rate limit so that ftp put is __SLOW__

the plan
========

* tc require root privilege
* tc shapes OUTGOING traffic

see

      host                                      container
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

how to do that?

		#!/usr/bin/env bash
		on() {
			device=$1
			#
			# tried default to 1:1 and what should be from ftp-data ( 12121 )
			# and it failed :(
			#
			tc qdisc add dev $device root handle 1: htb default 404

			tc class add dev $device parent 1:0 classid 1:1   htb rate 100kbps ceil 100kbps
			tc class add dev $device parent 1:1 classid 1:404 htb rate  512bps ceil  512bps

			tc filter add dev $device parent 1: protocol ip prio 1 u32 match ip sport 2121 0xffff flowid 1:1
		}

		off() {
			device=$1
			tc qdisc del dev $device root
		}

		command=$1
		dev=$2
		case "$command" in
			on)
				on $dev
				;;
			off)
			off $dev
			;;
		esac

