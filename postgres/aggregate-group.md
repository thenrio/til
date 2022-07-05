Take this state

```sql
select d.id, name, dp.id from displays d join displays_players dp on dp.display_id=d.id where name ~ '^2 roues';
  id  |      name      |  id
------+----------------+------
 3899 | 2 roues 1 clic | 4382
 3899 | 2 roues 1 clic | 3740
(2 rows)
```

GROUP BY may be use in conjuction with expression that are not aggregate functions and not in group expressions

```sql
select d.id, name from displays d join displays_players dp on dp.display_id=d.id where name ~ '^2 roues' group by d.id;
  id  |      name
------+----------------
 3899 | 2 roues 1 clic
(1 row)
```

BUT

```sql
select d.id, name, dp.id from displays d join displays_players dp on dp.display_id=d.id where name ~ '^2 roues' group by d.id;
ERROR:  column "dp.id" must appear in the GROUP BY clause or be used in an aggregate function
LINE 1: select d.id, name, dp.id from displays d join displays_playe...
```
