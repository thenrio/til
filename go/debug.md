gdb
https://golang.org/doc/gdb

debug test

```
go test -c
gdb ptq.test
```

break

```
(gdb) b main.go:147
Breakpoint 1 at 0x52cb6b: file /home/thenrio/src/go/src/github.com/thenrio/ptq/main.go, line 147.
```

but actual location and printing is confusing at this time.

```
(gdb) p err
$2 = {tab = 0x27, data = 0x2d2}
(gdb) p err.data
$3 = (void *) 0x2d2
```
