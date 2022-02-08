can I write a trigger function in sql?
======================================
No.
see [sql-createtrigger](https://www.postgresql.org/docs/current/static/sql-createtrigger.html).

> function_name
> A user-supplied function that is declared as taking no arguments and returning type trigger, which is executed when the trigger fires.

then, we can not use a sql function...

> ERROR:  SQL functions cannot return type trigger

Doc: 

* /usr/share/doc/postgresql-doc-14/html/sql-createtrigger.html
