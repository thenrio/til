```sql
select * from (values ('/foo/'), ('/bar/a1/')) v(path);
   path
----------
 /foo/
 /bar/a1/
(2 rows)
```

file:///usr/share/doc/postgresql-doc-16/html/queries-values.html

> VALUES provides a way to generate a “constant table”
