This may be useful to reverse a server?

https://wiki.debian.org/DebianRepository/Format

```
deb http://linux.teamviewer.com/deb stable main 
```

ARCHIVE_ROOT=http://linux.teamviewer.com/deb

> To download packages from a repository apt would download a InRelease or Release file from the $ARCHIVE_ROOT/dists/$DISTRIBUTION directory. 

```
curl http://linux.teamviewer.com/deb/dists/stable/InRelease
curl http://linux.teamviewer.com/deb/dists/stable/main/binary-amd64/Release
curl http://linux.teamviewer.com/deb/dists/stable/main/binary-amd64/Packages
```

Another 
https://www.erlang-solutions.com/downloads

```
deb https://packages.erlang-solutions.com/debian wheezy contrib
```

http://packages.erlang-solutions.com/debian/dists/

Newer debian release is buster (old stable), newer elixir package is 1.13.0...

```sh
curl http://packages.erlang-solutions.com/debian/dists/buster/contrib/binary-amd64/Packages -s | grep "^Filename:.*elixir.*1.13.*" | sort
Filename: pool/elixir_1.13.0-1~debian~buster_all.deb
```
