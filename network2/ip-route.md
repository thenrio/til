
```sh
$ ip route get 172.17.0.22
172.17.0.22 dev docker0 src 172.17.0.1 uid 1000
    cache
$ nc -zv 172.17.0.22 80
nc: connect to 172.17.0.22 port 80 (tcp) failed: No route to host
```

```sh
$ sudo ip route add 172.17.0.22 via 172.16.0.254 dev eth0 src 172.16.11.72
$
$ nc -zv 172.17.0.22 80
Connection to 172.17.0.22 80 port [tcp/http] succeeded!
```
