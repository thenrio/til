spike
=====

	docker run -d --name=postgrex --publish=5432:5432 --env=POSTGRES_PASSWORD=secret postgres

then can connect using local psql to it

	psql -U postgres --host=localhost
	Password for user postgres:
	psql (9.5.1)
	Type "help" for help.

	postgres=#

> --host is required otherwise will use unix socket on localhost
> we want to use tcp/5432 there
>

with data
=========

	docker create --volume=/var/lib/postgresql --name=data-postgrex debian:jessie /bin/true


