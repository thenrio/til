see https://www.sqlite.org/fileformat.html, for a list of internal objects.
see sqlite_master.

```sh
sqlite> .schema
sqlite> .schema sqlite_master
CREATE TABLE sqlite_master (
  type text,
  name text,
  tbl_name text,
  rootpage integer,
  sql text
);
```

> ??
