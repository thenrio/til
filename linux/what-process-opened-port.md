TL;DR ss, netstat, lsof require process ownership to show it.

```sh
~/til [master]$ sudo ss -ltp | grep 4444
LISTEN     0      128        *:4444                     *:*                     users:(("nginx",pid=608,fd=8),("nginx",pid=607,fd=8),("nginx",pid=606,fd=8),("nginx",pid=605,fd=8),("nginx",pid=604,fd=8))
```

> compare that to
> 
> ```sh
> ~/til [master]$ ss -ltp | grep 4444
> LISTEN     0      128        *:4444                     *:*
> ```

```sh
sudo lsof -i :4444
COMMAND PID     USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
nginx   604     root    8u  IPv4  16165      0t0  TCP *:4444 (LISTEN)
nginx   605 www-data    8u  IPv4  16165      0t0  TCP *:4444 (LISTEN)
nginx   606 www-data    8u  IPv4  16165      0t0  TCP *:4444 (LISTEN)
nginx   607 www-data    8u  IPv4  16165      0t0  TCP *:4444 (LISTEN)
nginx   608 www-data    8u  IPv4  16165      0t0  TCP *:4444 (LISTEN)
```

```sh
sudo fuser 4444/tcp
4444/tcp:              604   605   606   607   608
```
