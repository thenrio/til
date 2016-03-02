
using information_schema

    psql -At hive2 -c "select column_name from information_schema.columns where table_name='products'"

alternate on sof ( http://dba.stackexchange.com/questions/22362/how-do-i-list-all-columns-for-a-specified-table )

    SELECT attrelid::regclass, attnum, attname
    FROM   pg_attribute
    WHERE  attrelid = 'public.products'::regclass
    AND    attnum > 0
    AND    NOT attisdropped
    ORDER  BY attnum;
