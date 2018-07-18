http://inlehmansterms.net/2014/10/31/debugging-vim/.

```
:13verbose GoDef 'fmt.Fprintf'
```

shows

```
vim-go: guru: cannot find package "fmt" in any of:
vim-go:         /usr/lib/go-1.7/src/fmt (from $GOROOT)
vim-go:         /home/thenrio/src/go/src/fmt (from $GOPATH)
vim-go: /home/thenrio/src/go/src/github.com/thenrio/ptq
```

cause is stale binary guru.
GoUpdateBinaries is a resolution

see also http://learnvimscriptthehardway.stevelosh.com/chapters/01.html.
