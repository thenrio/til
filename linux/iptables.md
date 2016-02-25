goal is to block access from this host to a container
ports are the following

    docker port rabbitmq
    15672/tcp -> 0.0.0.0:15672
    5672/tcp -> 0.0.0.0:5672


Given

    sudo iptables --list --line-numbers
    Chain INPUT (policy ACCEPT)
    num  target     prot opt source               destination

    Chain FORWARD (policy ACCEPT)
    num  target     prot opt source               destination
    1    DOCKER     all  --  anywhere             anywhere
    2    ACCEPT     all  --  anywhere             anywhere             ctstate RELATED,ESTABLISHED
    3    ACCEPT     all  --  anywhere             anywhere
    4    ACCEPT     all  --  anywhere             anywhere

    Chain OUTPUT (policy ACCEPT)
    num  target     prot opt source               destination

    Chain DOCKER (1 references)
    num  target     prot opt source               destination
    1    ACCEPT     tcp  --  anywhere             172.17.0.1           tcp dpt:15672
    2    ACCEPT     tcp  --  anywhere             172.17.0.1           tcp dpt:amqp

Then we have

    curl http://localhost:5672 && echo
    AMQP


block
=====

input on docker0
----------------

    sudo iptables -N FENCE
    sudo iptables -A FENCE -i docker0 -j DROP

activated like so

    sudo iptables -I INPUT -j FENCE
    curl http://localhost:5672 && echo
    ^C

indeed

    localhost:5672 => lo => FORWARD to docker0 => DROP

back to pristine state

    sudo iptables -D INPUT 1

### precise??
failed to combine

    sudo iptables -A FENCE -i docker0 -p tcp --dport 5672 -j DROP

does not drop

    curl http://localhost:5672 && echo
    AMQP

output on docker0
-----------------

    sudo iptables -N FENCE
    sudo iptables -A FENCE -o docker0 -j DROP
    sudo iptables -I OUTPUT -j FENCE
    curl http://localhost:5672 && echo

indeed

    localhost:5672 => lo => FORWARD to docker0 => rabbitmq => docker0 => DROP
