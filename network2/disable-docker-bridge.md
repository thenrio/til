see

		ip a show docker0
		5: docker0: <BROADCAST,MULTICAST> mtu 1500 qdisc noqueue state DOWN group default
				link/ether 02:42:b5:7e:d3:7c brd ff:ff:ff:ff:ff:ff
				inet 172.17.0.1/16 scope global docker0
					valid_lft forever preferred_lft forever

bridge is 172.17.0.1/16 (that is wide...).

https://docs.docker.com/engine/userguide/networking/
https://docs.docker.com/engine/userguide/networking/default_network/custom-docker0/

the default docker bridge

stop docker

    systemctl stop docker

down the link

    ip link set dev docker0 down

see [change-docker-ip](http://khornberg.github.io/articles/change-docker-ip/)
