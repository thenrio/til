On a table:

```sql
SELECT i.indexrelid::regclass AS index, s.index_size, s.avg_leaf_density
FROM pg_index i CROSS JOIN LATERAL pgstatindex(i.indexrelid) s
WHERE indrelid = 'campaigns'::regclass;
```

> See also https://www.cybertec-postgresql.com/en/index-bloat-reduced-in-postgresql-v14/

On a partitioned table, it is a bit harder...?

```sql
SELECT i.indexrelid::regclass AS index, amname, s.index_size, s.avg_leaf_density
FROM pg_index i JOIN pg_class t on t.oid=i.indrelid
join pg_class c on c.oid=i.indexrelid
join pg_am am on am.oid=c.relam
CROSS JOIN LATERAL pgstatindex(i.indexrelid) s
WHERE t.relname ~ '^campaign_display_logs' and t.relkind='r' 
  and s.avg_leaf_density<>'NaN'::numeric
order by avg_leaf_density limit 10;
```

> This is wip

related:

* https://stackoverflow.com/questions/2204058/list-columns-with-indexes-in-postgresql
* pg_get_indexdef


Find unused index? Those with 0 scan?

```sql
select name, pg_size_pretty(size) from (
select indexrelname as name, pg_relation_size(c.oid) as size
from pg_stat_all_indexes s
join pg_class c on c.relname=s.indexrelname
join pg_namespace n on c.relnamespace=n.oid and nspname='public'
where idx_scan=0
order by pg_relation_size(c.oid) desc, name
limit 10
) s
```

How many, what size?

```sql
select pg_size_pretty(sum(pg_relation_size(c.oid))) as size, count(*)
from pg_stat_all_indexes s
join pg_class c on c.relname=s.indexrelname
join pg_namespace n on c.relnamespace=n.oid and nspname='public'
where idx_scan=0
```

Top bloat?

```sql
select pg_size_pretty(sum(pg_relation_size(c.oid))) as size, count(*)
from pg_stat_all_indexes s
join pg_class c on c.relname=s.indexrelname
join pg_namespace n on c.relnamespace=n.oid and nspname='public'
where idx_scan=0
```

```sql
select indexrelname, pg_size_pretty(pg_relation_size(indexrelid)) as size, idx_scan
from pg_stat_all_indexes
where relid='display_timeslots'::regclass;
```
