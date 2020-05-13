postgres=# select ARRAY['one', 'two'];
   array
-----------
 {one,two}
(1 row)

postgres=# select unnest(ARRAY['one', 'two']);
 unnest
--------
 one
 two
(2 rows)

Array litteral require explicit cast.
Array type is `T[]`, where T is element type.

postgres=# select unnest('{"one", "two"}'::text[]);
 unnest
--------
 one
 two
(2 rows)
