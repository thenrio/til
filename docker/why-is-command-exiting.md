fail
====

1- build

    ~/src/docker/docker-library/rabbitmq [master*]$ sudo docker build -t hutch:1 .
    ...
    Step 11 : COPY docker-entrypoint.sh /
    ---> Using cache
    ---> d3b0bfa1fe3a
    Step 12 : ENTRYPOINT /docker-entrypoint.sh
    ---> Using cache
    ---> 9a88c39110e1
    Step 13 : EXPOSE 5672
    ---> Using cache
    ---> 6a31ca31cba3
    Step 14 : CMD rabbitmq-server
    ---> Using cache
    ---> 883293244d5d
    Successfully built 883293244d5d


2- run

    ~/tmp $ sudo docker run -d -e RABBITMQ_NODENAME=hutch --name=bunny -p 15672:15672 hutch:1
    84c65ac78b278013fcaebba62e5a925407b0b6e811cfb53d2356bc0578140133
    ~/tmp $ sudo docker ps -l
    CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS                     PORTS               NAMES
    84c65ac78b27        hutch:1             "/docker-entrypoint.   9 seconds ago       Exited (0) 8 seconds ago                       bunny

awful fail, no luck...

move
====

do not detach container?
------------------------

    ~/tmp $ sudo docker rm bunny
    bunny
    ~/tmp $ sudo docker run -e RABBITMQ_NODENAME=hutch --name=bunny -p 15672:15672 hutch:1
    ~/tmp $ sudo docker ps -al
    CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS                      PORTS               NAMES
    a36666a8c7da        hutch:1             "/docker-entrypoint.   17 seconds ago      Exited (0) 16 seconds ago                       bunny

the same

run command in container
------------------------

    ~/tmp $ sudo docker run -i -t hutch:1 /bin/bash
  
and then 

    ./docker-entrypoint.sh rabbitmq-server

and it does not fail :(

change command I do not understand to use the vanilla one, volume its log, and see it? 
---------------------------------------------------------------------------------------

    sudo docker run -i --volumes-from ee4945969885 debian:latest /bin/bash


go back to something simpler ?
==============================


should try this one :)


    https://github.com/dockerfile/rabbitmq


ohpooe
