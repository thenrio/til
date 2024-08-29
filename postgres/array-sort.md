Consider intarray extension?

```sql
select sort(array[2,10,14,6]) as xs;
```

Otherwise, it can be done with array_agg?

```sql
select array_agg(x order by x) as xs
from (
  select unnest(array[2,10,14,6]) as x
) g;
```

I dont see this documented at file:///usr/share/doc/postgresql-doc-16/html/functions-aggregate.html??
