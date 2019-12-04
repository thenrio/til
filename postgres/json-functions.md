```
hive=# select row_to_json(row) from (select id, action, date from events e limit 1) row;
                       row_to_json
----------------------------------------------------------
 {"id":2011,"action":13,"date":"2019-07-30T12:11:16.472"}
(1 row)

hive=# select json_agg((select row_to_json(row) from (select id, action, date from events e limit 1) row));
                          json_agg
------------------------------------------------------------
 [{"id":2011,"action":13,"date":"2019-07-30T12:11:16.472"}]
(1 row)
```

This is the approach of hasura, see https://blog.hasura.io/architecture-of-a-high-performance-graphql-to-sql-server-58d9944b8a87/.

> We discovered that most of the time in handling a request is spent in the transformation function (which converts the SQL result to JSON response).
> After trying few approaches to optimise the transformation function, we’ve decided to remove this function by pushing the transformation into Postgres.
> ...
> The result of this query would have one column and one row and this value is sent to the client without any further transformation.


Note that both query have same plan!

    explain select row_to_json(e)
    from  (select id, action, date from events e limit 1) e

And

    explain select row_to_json(e)
    from (
      select e.id, e.action, e.date
      from
      (select id, action, date from events e limit 1) e
    ) e

That is:

    Subquery Scan on e  (cost=0.00..0.07 rows=1 width=32)
      ->  Limit  (cost=0.00..0.06 rows=1 width=16)
            ->  Seq Scan on events e_1  (cost=0.00..8.41 rows=141 width=16)

hand written:

```sql
select row_to_json(root)
from (
  select
    events.id as id,
    events.action as action,
    events.date as date,
    items.items as items
  from (
    select id, action, date from events e limit 1
  ) events
  left join lateral (
    select json_agg(items) as items
    from (
      select item_id as id
      from event_items ei
      where ei.event_id=events.id
    ) items
  ) items on true
) root
```

output

```json
{"id":2011,"action":13,"date":"2019-07-30T12:11:16.472","items":[{"id":"303960C94069DB4000000000"}]}
```

plan

```
 Nested Loop Left Join  (cost=6.56..6.66 rows=1 width=32)
   ->  Limit  (cost=0.00..0.06 rows=1 width=16)
         ->  Seq Scan on events e  (cost=0.00..8.41 rows=141 width=16)
   ->  Aggregate  (cost=6.56..6.57 rows=1 width=32)
         ->  Seq Scan on event_items ei  (cost=0.00..6.55 rows=1 width=25)
               Filter: (event_id = e.id)
```

hasura:

```
Aggregate  (cost=941.14..941.15 rows=1 width=32)
  ->  Limit  (cost=941.12..941.13 rows=1 width=44)
        ->  Sort  (cost=941.12..941.48 rows=141 width=44)
              Sort Key: events.date DESC, events.id DESC
              ->  Nested Loop Left Join  (cost=6.57..940.42 rows=141 width=44)
                    ->  Seq Scan on events  (cost=0.00..8.41 rows=141 width=16)
                    ->  Aggregate  (cost=6.57..6.58 rows=1 width=32)
                          ->  Seq Scan on event_items  (cost=0.00..6.55 rows=1 width=25)
                                Filter: (events.id = event_id)
                          SubPlan 2
                            ->  Result  (cost=0.00..0.01 rows=1 width=32)
                    SubPlan 1
                      ->  Result  (cost=0.00..0.01 rows=1 width=32)
```

so it looks like there MAY be improvement on hasura sql?
got to test it with more data!
