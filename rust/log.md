[log](https://lib.rs/crates/log) is a facade, need an implementation!

> In order to produce log output, executables have to use a logger implementation compatible with the facade.

For env_logger, default level is error.

```sh
RUST_LOG=info ./target/debug/warp
 INFO  warp::server > Server::run; addr=127.0.0.1:3030
 INFO  warp::server > listening on http://127.0.0.1:3030
 INFO  access       > 127.0.0.1:54606 "GET / HTTP/1.1" 404 "-" "curl/7.74.0" 37.406µs
```
