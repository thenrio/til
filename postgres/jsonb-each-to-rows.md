```sql
select id, name, jsonb_each(opening_times) from shops where name ~* '^histoire';
  id  |        name         |              jsonb_each
------+---------------------+--------------------------------------
 1307 | Histoire de cheveux | (1,"[[""06:00:00"", ""23:59:59""]]")
 1307 | Histoire de cheveux | (2,"[[""06:00:00"", ""23:59:59""]]")
 1307 | Histoire de cheveux | (3,"[[""06:00:00"", ""23:59:59""]]")
 1307 | Histoire de cheveux | (4,"[[""06:00:00"", ""23:59:59""]]")
 1307 | Histoire de cheveux | (5,"[[""06:00:00"", ""23:59:59""]]")
 1307 | Histoire de cheveux | (6,"[[""06:00:00"", ""23:59:59""]]")
 1307 | Histoire de cheveux | (7,"[[""06:00:00"", ""23:59:59""]]")
(7 rows)
```

Each (key, value) pair is packed as a tuple (key, value).

> It is a record actually... see below.


```sql
select s.id, s.name, j.* from shops s cross join jsonb_each(s.opening_times) as j(key, value)
where s.name ~* '^histoire';
  id  |        name         | key |           value
------+---------------------+-----+----------------------------
 1307 | Histoire de cheveux | 1   | [["06:00:00", "23:59:59"]]
 1307 | Histoire de cheveux | 2   | [["06:00:00", "23:59:59"]]
 1307 | Histoire de cheveux | 3   | [["06:00:00", "23:59:59"]]
 1307 | Histoire de cheveux | 4   | [["06:00:00", "23:59:59"]]
 1307 | Histoire de cheveux | 5   | [["06:00:00", "23:59:59"]]
 1307 | Histoire de cheveux | 6   | [["06:00:00", "23:59:59"]]
 1307 | Histoire de cheveux | 7   | [["06:00:00", "23:59:59"]]
(7 rows)
```

Found this result on https://www.postgresql.org/search/?m=1&q=jsonb_each&l=2&d=365&s=r

* https://www.postgresql.org/message-id/flat/054f5de0-6160-bee4-9ed7-ec2f7d0aba23%40gmx.net#105c19f967d007d16a5e09fe5549ca03.

Conversely, we can have hint why first result looks nested, using `pg_typeof` function.

```sql
select id, name, pg_typeof(jsonb_each(opening_times)) from shops where name ~* '^histoire' limit 1;
  id  |        name         | pg_typeof
------+---------------------+-----------
 1307 | Histoire de cheveux | record
(1 row)
```
