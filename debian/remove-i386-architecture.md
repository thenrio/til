```sh
$ dpkg --get-selections | awk '/i386/{print $1}'
gcc-4.9-base:i386
libc6-i386
```

Can get rid of it.
Then,

```sh
sudo dpkg --remove-architecture i386
```
