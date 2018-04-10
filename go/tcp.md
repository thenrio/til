short read
==========
see go-challenge-2

and this [comment](http://blog.nella.org/golang-challenge-2-comments/)

> But short reads could some from someplace much simpler… from the tests. Consider how your challenge entry would have behaved if it was reading from an io.Reader that intentionally returned only one byte at a time.
>
> Given the reality of short reads, it is up to the application to handle framing the bytes into messages. The majority of entries did not take this into consideration. The solution is that each message needs to be sent with it’s length. And when SecureReader reads from the underlying io.Reader, it needs to use something like ioutil.ReadAll to make certain all the bytes arrive, no matter how many calls to the underlying io.Reader it takes to get them all. But then that opens up the question of what to do when the connection hangs? Do you timeout? How can you cause ioutil.ReadAll to return early?
>
> In Go, different pieces of the language and the standard library can be composed to make something better than any of them alone.
> A great way to read frames from the network is to prepend the frame with it’s length.
> You read the length using encoding/binary.Read, make an io.LimitedReader which is limited to the length, then give that LimitedReader to ioutil.ReadAll.> You can handle timeouts by checking that if the underlying io.Reader satisfies an interface with SetReadDeadline in it (as the various connection types in package net do), and then using it to set a deadline.
> After the deadline passes, the underlying io.Reader will return a timeout error, which the LimitedReader will return to ioutil.ReadAll, which will cause it to return early, telling you that the read timed out.

this _looks_ a decent solution (did not test it).

DO NOT use `ioutil.ReadAll` that blocks until EOF.
use a buffer of correct size and read expected byte count.

timeout
=======
net.Conn.Set(?Read|Write)Deadline

this is not a timeout, it is a point in time, and its side effect is a least a timeout.
see below for more.

articles
========

* https://sahilm.com/tcp-servers-that-run-like-clockwork/

* https://appliedgo.net/networking/

    has terrible defective understanding of stream.

    > Finally, each connection object has a Close() method to conclude the communication.

    terrible confusion on frame and connection boundaries.

* https://blog.cloudflare.com/the-complete-guide-to-golang-net-http-timeouts/
* https://blog.gopheracademy.com/advent-2016/exposing-go-on-the-internet/

    which is right on the timeout part, still opened issue.
