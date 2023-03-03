```sql
# select * from (select 1, 2.5, 'is a test') v cross join unnest(array[0, 2, 4]) r;
 ?column? | ?column? | ?column?  | r
----------+----------+-----------+----
        1 |      2.5 | is a test |  0
        1 |      2.5 | is a test |  2
        1 |      2.5 | is a test |  4
```
