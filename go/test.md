table driven
============
https://github.com/golang/go/wiki/TableDrivenTests

> is akin to test generator in erlang, or a test loop.

assertions
==========
bytes.Equal
reflection.DeepEqual

tcp
===
simpler is memory pipe

/usr/share/go-1.10/src/net/pipe.go
/usr/share/go-1.10/src/net/pipe_test.go


articles:
* https://www.reddit.com/r/golang/comments/4asvak/unit_testing_tcp_connections_in_golang/?st=jfrzxmaj&sh=c16ecef4

* https://speakerdeck.com/mitchellh/advanced-testing-with-go
    uses a full fledge server.
