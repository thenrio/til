-lname
======
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

order matter
============
See https://stackoverflow.com/questions/1517138/trying-to-include-a-library-but-keep-getting-undefined-reference-to-messages.

> The trick here is to put the library AFTER the module you are compiling. The problem is a reference thing. The linker resolves references in order, so when the library is BEFORE the module being compiled, the linker gets confused and does not think that any of the functions in the library are needed. By putting the library AFTER the module, the references to the library in the module are resolved by the linker.
