```sql
phenix_displays_dev=# select pid, application_name, state, query from pg_stat_activity where backend_type ~ '^client';
 pid  | application_name | state  |                                              query
------+------------------+--------+--------------------------------------------------------------------------------------------------
 4243 | psql             | idle   | select * from pg_stat_activity;
 6003 | psql             | active | select pid, application_name, state, query from pg_stat_activity where backend_type ~ '^client';
(2 rows)
```
