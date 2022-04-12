select json_agg(d)
from (
  select d.id, name, price, acc.clients
  from deals d
  left join lateral (
    select json_agg(c) as clients from (
      select c.id
      from deal_clients dc left join clients c on c.id=dc.client_id
      where dc.deal_id=d.id
    ) c
  ) acc on true
  where id=3
) d
