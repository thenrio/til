given I have to read `m` bytes from `conn`

```go
  bytes := make([]byte, m)
  addr := conn.LocalAddr()
  n, err := bufio.NewReader(conn).Read(bytes)
```

on the short read, see tcp-framing-short-read.md

I rant : read bytes is scattered

bufio
encoding/binary
io
ioutil

io.Reader is present in all the others.
