given a file

    psql -At hive -c "select column_name from information_schema.columns where table_name='products'" > ~/tmp/columns

join all lines with comma

    paste -s -d ',' < ~/tmp/columns
    id,ean,brand,date,version,created_at,updated_at,family,subfamily,alias,color,description,label,picture,price,season,size,shelf,storeland_id,theme,model_id

> tr '\n' ',' < ~/tmp/columns has trailing comma
