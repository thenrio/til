Have a percent of values in a table: 

```sql
select origin, count, round(count * 100.0 / sum(count) over (), 2) as percent from (
  select origin, count(*) as count from display_timeslots group by origin
) g;

   origin   |  count  | percent
------------+---------+---------
 area       |     609 |    0.01
 campaign   | 1042402 |   11.03
 livescreen | 6923121 |   73.28
 story      | 1481432 |   15.68
(4 rows)
```

the `percent` is made with a window over all the rows...

> Hinted by chatgpt.
