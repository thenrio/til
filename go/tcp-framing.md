
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

this is a decent solution

another is to look for frame delimiter, if protocol has one
and prefixed size is better than delimiter, because delimiter require to inspect each byte
