Test a single query to output a _shape_ like so?

```json
[{"action":"RETAIL_SELLING","id":367784,"date":"2019-09-24T12:02:00.000Z","items":[{"id":"303960C9001A84C00000F74C"},{"id":"303960C9002679400000999D"},{"id":"303960C940E3390000000C8C"},{"id":"303960C940D68FC000002DF4"}]}]
```

> curl "localhost:9080/events?items.product.fts.fts.match=jean&limit=1&fields=id,action,date,items(id)&include=items"

This is what hasura does from a graphql query: query -> sql -> (postgres -> json) -> socket.
There is a json extension in source code...

```sh
gcc -fPIC -shared -g json1.c -o json1.so
```

Then load in sqlite3 (require path to .so).

1- a single event

```sql
with e as (
  select id, action, date from events where id=367784
)
select
  json_object(
    'id', e.id,
    'action', action,
    'date', date
  );

{"id":367784,"action":16,"date":1569326520000}
Run Time: real 0.001 user 0.000248 sys 0.000021
```

fast.

2- a single events with tags

Option a) poor join: slow.

```sql
with e as (
  select id, action, date from events where id=367784
)
select
  json_object(
    'id', e.id,
    'action', action,
    'date', date
  , 'items', gg.items
  )
from e
 left join (
   select
     event_id as id
   , group_concat(i.event_id) as items
   from event_items i
   where exists (select 1 from e where e.id=i.id)
   group by id
 ) gg on gg.id=e.id
;

{"id":367784,"action":16,"date":1569326520000,"items":null}
Run Time: real 0.200 user 0.172297 sys 0.028025
```

Option b) better join

```sql
with e as (
  select id, action, date from events where id=367784
)
select
  json_object(
    'id', e.id
  , 'action', action
  , 'date', date
  , 'items', json(gg.items)
  )
from e
left join (
   select
     event_id as id
   , json_group_array(json_object('id', i.item_id)) as items
   from event_items i
   where i.event_id in (select id from e)
   group by event_id
 ) gg on gg.id=e.id
;
```

> naming can be improved: e, gg.

result:

```
{"id":367784,"action":16,"date":1569326520000,"items":[{"id":"303960C9001A84C00000F74C"},{"id":"303960C9002679400000999D"},{"id":"303960C940E3390000000C8C"},{"id":"303960C940D68FC000002DF4"}]}
Run Time: real 0.001 user 0.000553 sys 0.000052
```

notes:

* the json(gg.items) looks like unnecessary? is not.
* the inner subquery left join is NOT that alien compared to postgres lateral: `where i.event_id=e.id` in postgres, here with a subquery.
* previous query is pure s..t! slow!
    > this makes me wonder on _slow_ queries I wrote using exists (select 1...).

> something to improve in subquery?

3) have product in tags?

easy, while we preserve 1 cardinality.

```sql
with e as (
  select id, action, date from events where action=6 order by id desc limit 1
)
select
  json_object(
    'id', e.id,
    'action', action,
    'date', date,
    'items', json(ei.items)
  )
from e
left join (
  select
    event_id as id,
    json_group_array(json_object(
      'id', ei.item_id,
      'product', json_object(															-- added
        'ean', i.ean,																			-- added
        'label', p.label																	-- added
      )
    )
  ) as items
  from event_items ei
  left join items i on i.id=ei.item_id										-- added
  left join products p on p.ean=i.ean and p.brand=i.brand -- added
  where ei.event_id in (select id from e)
  group by event_id
  ) ei on ei.id=e.id
;
```

4) have an array of events?

```sql
select json_group_array(e.json)   -- added
from (														-- added
  with e as (
    select id from events where action=13 order by id desc limit 2
  )
  select
    json_object(
      'id', e.id,
      'items', json(ei.items)
    ) as json
  from e
  left join (
    select
      event_id as id,
      json_group_array(json_object(
        'id', ei.item_id
      )
    ) as items
    from event_items ei
    where ei.event_id in (select id from e)
    group by event_id
  ) ei on ei.id=e.id
) e																-- added
```

Compare with server approach many queries?
==========================================

```sh
curl "localhost:9080/events?action=RECEIVING&sort=id-&include=items&fields=id,items(id)" -s -o ~/tmp/server.json -w '%{stderr}%{time_total},%{size_download}\n'
0.104735,811591
```

```sh
/usr/bin/time -f%e sqlite3 production.sqlite3 <t >~/tmp/sqlite.json
0.03
```

> sqlite3 output has 1 byte more (trailing \n).

So it makes a * 3-4 improvement.
