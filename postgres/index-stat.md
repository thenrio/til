On a table:

```
SELECT i.indexrelid::regclass AS index, s.index_size, s.avg_leaf_density
FROM pg_index i CROSS JOIN LATERAL pgstatindex(i.indexrelid) s
WHERE indrelid = 'campaigns'::regclass;
```

> See also https://www.cybertec-postgresql.com/en/index-bloat-reduced-in-postgresql-v14/

On a partitioned table, it is a bit harder...?

```
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
