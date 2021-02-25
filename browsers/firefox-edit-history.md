Goal is to remove history from previous postgres install.

Does not see how to do it from UI!

```sh
sqlite> begin;
sqlite> delete from moz_places where url like 'file:///usr/share/doc/postgresql-doc-12%';
sqlite> select changes();
100
sqlite> delete from moz_places where url like 'file:///usr/share/doc/postgresql-doc-11%';
sqlite> select changes();
93
sqlite> end;
```

```sh
sqlite> begin;
sqlite> delete from moz_historyvisits where not exists (select 1 from moz_places where id=place_id);
sqlite> select changes();
465
sqlite> end;
```
