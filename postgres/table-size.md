On partitioned table:

```
select pg_size_pretty(sum(pg_relation_size(c.oid))) as size, pg_size_pretty(sum(pg_total_relation_size(c.oid))) as total
from pg_class c join pg_namespace n on n.oid=c.relnamespace
where nspname='log_partitions' and relkind<>'i' and relname ~ '^campaign_display_logs';
  size   | total
---------+--------
 7696 kB | 134 MB
(1 row)
```

Clever, adapted from https://stackoverflow.com/questions/54920864/get-table-size-of-partitioned-table-postgres-10

```
SELECT
   i.inhparent::regclass AS parent_table_name, 
   pg_size_pretty(sum(pg_total_relation_size(c.oid))) AS total,
   pg_size_pretty(sum(pg_relation_size(c.oid))) AS internal,
   pg_size_pretty(sum(pg_table_size(c.oid) - pg_relation_size(c.oid))) AS external, -- toast
   pg_size_pretty(sum(pg_indexes_size(c.oid))) AS indexes
FROM pg_class c
JOIN pg_inherits i ON i.inhrelid=c.oid and c.relkind in ('r')
GROUP BY i.inhparent
ORDER BY sum(pg_total_relation_size(c.oid)) DESC;
```

> This works for one level of partition...

```
        parent_table_name        |  total  | internal | external | indexes
---------------------------------+---------+----------+----------+---------
 campaign_display_logs           | 28 GB   | 4081 MB  | 2760 kB  | 24 GB
 story_display_logs              | 27 GB   | 3950 MB  | 2584 kB  | 23 GB
 livescreen_display_logs         | 2400 kB | 0 bytes  | 0 bytes  | 2400 kB
 network_campaign_display_logs   | 2400 kB | 0 bytes  | 0 bytes  | 2400 kB
 shop_area_campaign_display_logs | 2400 kB | 0 bytes  | 0 bytes  | 2400 kB
```
