ensure system can do it
=======================

```sh
sudo sysctl -w net.ipv4.ip_forward=1
```

see that?

```sh
sudo sysctl -a -r forward
```

configure
=========

```sh
sudo iptables -t nat -A PREROUTING -p tcp --dport 5555 -j REDIRECT --to-port 5432
```

to redirect traffic coming from localhost

```sh
sudo iptables -t nat -I OUTPUT -p tcp -o lo --dport 5555 -j REDIRECT --to-port 5432
```

documentation
=============

[netfilter.org](https://www.netfilter.org/documentation/HOWTO/NAT-HOWTO-6.html#ss6.2)

> did not find local documentation ...

also
[digitalocean](https://www.digitalocean.com/community/tutorials/how-to-forward-ports-through-a-linux-gateway-with-iptables)


trial and error

sudo iptables -t nat -Z
sudo iptables -t nat -I PREROUTING -p tcp --dport 5555 -j LOG


