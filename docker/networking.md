host access
===========

see man docker-run

    --add-host=hostname:ip

also see, on git, docs branch

    docs/sources/reference/commandline/cli.md:>      $ alias hostip="ip route show 0.0.0.0/0 | grep -Eo 'via \S+' | awk '{ print \$2 }'"
    docs/sources/reference/commandline/cli.md:>      $ docker run  --add-host=docker:$(hostip) --rm -it debian

and was not successful :)

eg: given an sshd container, curl http://localhost:9080/version running on host

    docker run --add-host=docker:172.17.42.1 -p 2222:22 --rm -it sshd:1

then ssh to it

    ssh -p 2222 docker.test

and

    curl http://docker:9080/version

172.17.42.1 is the ip of docker0 interface ... dunno what is the intent of hostip ...

```
ip -4 addr show docker0
4: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
    inet 172.17.42.1/16 scope global docker0
           valid_lft forever preferred_lft forever
```

