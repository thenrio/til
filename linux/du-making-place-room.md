short

```
~ $ df -h .
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda5        63G   50G  9.8G  84% /
```

go and see du

```
root@pokayoke:/# du -s bin home media mnt opt srv usr var | sort -n -k1
8       mnt
8       srv
20      media
11424   bin
1439692 opt
9449408 var
10398064        usr
28255772        home
```


