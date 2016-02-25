see this [article](https://docs.docker.com/articles/systemd/)

```
$ sudo systemctl show docker | grep EnvironmentFile
EnvironmentFile=/etc/default/docker (ignore_errors=yes)
```

http proxy in default env
=========================
it has its warts!

http proxy on the command line
==============================
docker uses HTTP[S]_PROXY

