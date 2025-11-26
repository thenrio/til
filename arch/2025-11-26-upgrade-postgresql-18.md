postgresql did not restart because database was in 17...
See https://wiki.archlinux.org/title/PostgreSQL#Upgrading_PostgreSQL.

As postgres, I moved the old database and created a new one, changed the configuration files with manual diff:

```sh
mv data 17
initdb --locale=en_US.UTF-8 --encoding=UTF8 -D /var/lib/postgres/data
diff 17/pg_hba.conf data/pg_hba.conf
diff 17/postgresql.conf data/postgresql.conf
```
