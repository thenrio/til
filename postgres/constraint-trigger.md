constraint

```sh
select c.conname, k.relname, n.nspname
from pg_constraint c
join pg_class k on k.oid=conrelid
join pg_namespace n on n.oid=connamespace
where c.conname='media_id_fkey' and relname ~ '^story' limit 10;
    conname    |          relname          |  oid  |    nspname     
---------------+---------------------------+-------+----------------
 media_id_fkey | story_display_logs        |  2200 | public         
 media_id_fkey | story_display_logs_part_1 | 30739 | log_partitions 
 media_id_fkey | story_display_logs_part_2 | 30739 | log_partitions 
 media_id_fkey | story_display_logs_part_3 | 30739 | log_partitions 
 media_id_fkey | story_display_logs_part_4 | 30739 | log_partitions 
 media_id_fkey | story_display_logs_part_5 | 30739 | log_partitions 
 media_id_fkey | story_display_logs_part_6 | 30739 | log_partitions 
 media_id_fkey | story_display_logs_part_7 | 30739 | log_partitions 
 media_id_fkey | story_display_logs_part_8 | 30739 | log_partitions 
 media_id_fkey | story_display_logs_part_9 | 30739 | log_partitions 
(10 rows)
```

constraint trigger

```sh
select t.tgname, c.conname, k.relname, n.nspname
from pg_trigger t
join pg_constraint c on c.oid=t.tgconstraint
join pg_class k on k.oid=conrelid
join pg_namespace n on n.oid=connamespace
where tgname in ('RI_ConstraintTrigger_a_63214');
            tgname            |            conname            |     relname     | nspname
------------------------------+-------------------------------+-----------------+---------
 RI_ConstraintTrigger_a_63214 | medias_displays_media_id_fkey | medias_displays | public
(1 row)
```

