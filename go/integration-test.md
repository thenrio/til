see streadway/amqp, which uses [soundcloud practices](http://peter.bourgon.org/go-in-production/#testing-and-validation)

```bash
env AMQP_URL=amqp://guest:guest@127.0.0.1:5672/ go test -v -tags integration -run Types61
=== RUN   TestRoundTripAllFieldValueTypes61
--- FAIL: TestRoundTripAllFieldValueTypes61 (0.01s)
        integration_test.go:1223: Could not publish: table field "include" value [%!t(string=semver)] not supported
        shared_test.go:68: issue61 close
FAIL
exit status 1
FAIL    github.com/streadway/amqp       0.009s
```
