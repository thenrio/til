Source?
=======

```sql
\df+ check_display_timeslots_overlap
```

Volatility?
===========
Default volatility is VOLATILE, which prevents planner to optimize sql of function (when it is sql...).

```sql
create or replace function shop_opening_times() returns table(id int, name text, day int, start time, stop time)
as $$
select id, name, day::int, (value -> 0 ->> 0)::time as start, (value -> 0 ->> 1)::time as stop from (
  select s.id, s.name, j.* from shops s cross join jsonb_each(s.opening_times) as j(day, value)
) t
$$ language sql
```

Let (A) be `select id, name from shop_opening_times() where id=1307`.

The plan for statement (A) with default volatility is:

```
 Function Scan on expand_shop_opening_times  (cost=0.25..12.75 rows=5 width=36) (actual time=15.950..16.418 rows=7 loops=1)
   Filter: (id = 1307)
   Rows Removed by Filter: 10540
 Planning Time: 0.082 ms
 Execution Time: 16.584 ms
```

With STABLE volatility, it becomes:

```
 Nested Loop  (cost=0.28..10.80 rows=100 width=8) (actual time=0.306..0.310 rows=7 loops=1)
   ->  Index Scan using shops_pkey on shops s  (cost=0.28..8.29 rows=1 width=324) (actual time=0.285..0.285 rows=1 loops=1)
         Index Cond: (id = 2399)
   ->  Function Scan on jsonb_each j  (cost=0.00..1.00 rows=100 width=32) (actual time=0.017..0.018 rows=7 loops=1)
 Planning Time: 0.970 ms
 Execution Time: 0.377 ms
```
