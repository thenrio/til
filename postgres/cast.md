> By default, a cast can be invoked only by an explicit cast request, that is an explicit CAST(x AS typename) or x::typename construct.

https://www.postgresql.org/docs/current/static/sql-createcast.html

eg: approximate number of rows (statistics of pg_class)

```
select reltuples::bigint from pg_class where oid='public.events'::regclass;
```
