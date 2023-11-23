installations has one user, one shop.
I want to embed them, only a few fields.


```sql
select row_to_json(i)
from (
  select i.uuid as id, i.installation_date, i.status, u.user, s.shop
  from player_installations i
  join lateral (
    select row_to_json(u) as user
    from (
      select u.email
      from users u
      where u.id=i.technician_user_id
    ) u
  ) u on true
  join lateral (
    select row_to_json(s) as shop
    from (
      select s.gotham_id as id
      from shops s
      where s.id=i.shop_id
    ) s
  ) s on true
  where i.uuid='b0fb3f56-e1f5-4578-8615-15a873350b66' 
) i
```

See also ../postgrest/postgrest.md, where we have use json_agg to output lists (or embed).
