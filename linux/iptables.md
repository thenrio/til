goal is to block access from this host to a container
ports are the following

    docker port rabbitmq
    15672/tcp -> 0.0.0.0:15672
    5672/tcp -> 0.0.0.0:5672

this is useful to create network partition
commands
========

    man iptables

    sudo iptables-save
    sudo iptables -nvL

block
=====

output on lo
------------

    sudo iptables -I OUTPUT -p tcp --dport 5672 -j DROP

precise output interface

    sudo iptables -I OUTPUT -o docker0 -p tcp --dport 5672 -j DROP

with named chain

    sudo iptables -N FENCE
    sudo iptables -A FENCE -p tcp --dport 5672 -j DROP
    sudo iptables -I OUTPUT -j FENCE

any works and voila there it is :)

> using REJECT makes
>
> curl: (56) Recv failure: Connection reset by peer

remove

    sudo iptables -D OUTPUT 1
or

    sudo iptables -F OUTPUT

input on docker0
----------------

    sudo iptables -N FENCE

activated like so

    sudo iptables -A FENCE -i docker0 -j DROP
    sudo iptables -I INPUT -j FENCE
    curl http://localhost:5672 && echo
    ^C

indeed

    localhost:5672 => lo => FORWARD to docker0 => DROP

back to pristine state

    sudo iptables -D INPUT 1

### drop input only on port 5672?

    sudo iptables -A FENCE -i docker0 -p tcp --dport 5672 -j DROP

does not drop

    curl http://localhost:5672 && echo
    AMQP

...
the diff is _only_ `-p tcp --dport 5672`

> docker messes up iptables
> as shorewall does :)
> http://serverfault.com/questions/579726/docker-shorewall

output on docker0
-----------------

    sudo iptables -N FENCE
    sudo iptables -A FENCE -o docker0 -j DROP
    sudo iptables -I OUTPUT -j FENCE
    curl http://localhost:5672 && echo

indeed

    localhost:5672 => lo => FORWARD to docker0 => rabbitmq => docker0 => DROP

documentation
=============
http://linux-ip.net/html/index.html
https://fralef.me/docker-and-iptables.html
https://www.frozentux.net/iptables-tutorial/iptables-tutorial.html
http://www.iptables.info/en/structure-of-iptables.html
https://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg


and this one, mostly awesome
https://www.digitalocean.com/community/tutorials/a-deep-dive-into-iptables-and-netfilter-architecture
