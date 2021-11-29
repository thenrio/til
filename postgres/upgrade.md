minor : from 9.5 to 9.6
=======================

```sh
sudo pg_upgradecluster 9.5 main
```

major : from 13 to 14
=====================

```sh
$ sudo pg_upgradecluster 13 main
Error: target cluster 14/main already exists

$ pg_lsclusters
Ver Cluster Port Status Owner    Data directory              Log file
13  main    5432 online postgres /var/lib/postgresql/13/main /var/log/postgresql/postgresql-13-main.log
14  main    5433 online postgres /var/lib/postgresql/14/main /var/log/postgresql/postgresql-14-main.log
```

```sh
$ sudo pg_dropcluster 14 main --stop
$ sudo pg_upgradecluster 13 main
$ sudo pg_dropcluster 13 main
```
