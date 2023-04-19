Goal is to remove history from previous postgres install.

Does not see how to do it from UI!

```sh
$ sqlite3 ~/.mozilla/firefox/31y6quyf.nightly/places.sqlite
```

```sh
sqlite> begin;
sqlite> delete from moz_places where url like 'file:///usr/share/doc/postgresql-doc-12%';
sqlite> select changes();
100
sqlite> delete from moz_places where url like 'file:///usr/share/doc/postgresql-doc-11%';
sqlite> select changes();
93
sqlite> delete from moz_historyvisits where not exists (select 1 from moz_places where id=place_id);
sqlite> select changes();
465
sqlite> end;
```

Other heuristic is replace?

```sql
update moz_places set url=replace(url, '0.18.3', '0.18.18') where url like '%/hexpm/phoenix_live_view/0.18.3/%';
update moz_places set url=replace(url, 'python3.9', 'python3.10') where url like 'file:///usr/share/doc/python3.9%';
```
