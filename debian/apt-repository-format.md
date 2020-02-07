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
