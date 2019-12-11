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

a) head

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

b) head and children?

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

broken, slow.

c) head and children!

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
   where i.event_id=(select id from e)
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
