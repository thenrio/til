Suited to availability problem:

https://www.crunchydata.com/blog/better-range-types-in-postgres-14-turning-100-lines-of-sql-into-3

```sql
SELECT datemultirange(daterange('2021-06-01', '2021-06-30', '[]')) - range_agg(appointment_dates) AS availability
FROM appointments
WHERE appointment_dates && daterange('2021-06-01', '2021-06-30', '[]');
```

file:///usr/share/doc/postgresql-doc-14/html/functions-range.html
