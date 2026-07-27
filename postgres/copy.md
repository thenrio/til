`COPY FROM STDIN` reads data just after statement.

We can add a line `\.` to terminate the `COPY FROM STDIN` statement and add other statements. 
See [text format](https://www.postgresql.org/docs/current/sql-copy.html#text-format).


```sh
cat 1-create_player_resolutions.sql 2-copy-player-resolutions.sql <(head ecrans_2026-07-27_08-47-47.csv) <(printf '\\.\n') 3-add-resolution-new.sql | psql phenix_displays_dev postgres
```
