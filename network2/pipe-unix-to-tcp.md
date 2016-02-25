socat
=====

like so

    socat TCP-LISTEN:1234,reuseaddr,fork UNIX-CLIENT:/tmp/foo

and for pg

    socat TCP-LISTEN:5432,reuseaddr,fork UNIX-CLIENT:/var/run/postgresql/.s.PGSQL.5432

path of socket MAY change of course, default dirname is correct though as per postgresql-server install

netcat
======

/!\ openbsd flavor only /!\

    nc -l 1234 | nc -U /tmp/foo

and for the same postgres

    nc -l 5432 | nc -U /var/run/postgresql/.s.PGSQL.5432

see [sof](http://stackoverflow.com/questions/2149564/redirecting-tcp-traffic-to-a-unix-domain-socket-under-linux)
