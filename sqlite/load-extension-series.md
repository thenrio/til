here is one
https://sqlite.org/series.html

https://sqlite.org/cli.html#loading_extensions
locate series.c

/home/thenrio/src/c/sqlite3/ext/misc
gcc -g -fPIC -shared series.c -o series.so

```
sqlite> .load /home/thenrio/src/c/sqlite3/ext/misc/series
sqlite> select * from generate_series(0, 9);
0
1
2
3
4
5
6
7
8
9
```

> this will work on my laptop...
