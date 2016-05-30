
http://linux-ip.net/html/tools-ip-route.html

             +----------------------+
     +------>|router ( 192.168.1.1 )|<---- eth0  ( )
     |       +----------------------+      wlan0 ( 172.16.12.30/16 ) ---> internet
     |

    pi ( 192.168.1.128 )


1. add static ip on eth0

		sudo ip addr add 192.168.1.111/24 dev eth0

2- add route

		sudo ip route add 192.168.1.0/24 dev eth0

