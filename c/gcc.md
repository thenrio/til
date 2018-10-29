
```sh
gcc -I /usr/include/postgresql -l libpq -g -fPIE copy.c -o copy
/usr/bin/ld: cannot find -llibpq
collect2: error: ld returned 1 exit status
```

a good manual is https://www.postgresql.org/docs/current/static/libpq-build.html.
because
https://www3.ntu.edu.sg/home/ehchua/programming/cpp/gcc_make.html

> In Unixes, the library libxxx.a is specified via -lxxx option (lowercase letter 'l', without the prefix "lib" and ".a" extension).

```sh
gcc -I /usr/include/postgresql -l pq -g -fPIE copy.c -o copy
```
