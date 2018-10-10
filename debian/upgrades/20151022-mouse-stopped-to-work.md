took me 2 hours :\

* xorg log was not that helpful
* did not capture it :)


what was bad is user cound not read input

```
root@pokayoke:/home/thenrio# ll /dev/input/
total 0
drwxr-xr-x  4 root root     400 Oct 22 12:26 ./
drwxr-xr-x 18 root root    3340 Oct 22 12:26 ../
drwxr-xr-x  2 root root     100 Oct 22 12:26 by-id/
drwxr-xr-x  2 root root     120 Oct 22 12:26 by-path/
crw-rw----  1 root input 13, 64 Oct 22 12:26 event0
crw-rw----  1 root input 13, 65 Oct 22 12:26 event1
crw-rw----  1 root input 13, 74 Oct 22 12:26 event10
crw-rw----  1 root input 13, 75 Oct 22 12:26 event11
crw-rw----  1 root input 13, 76 Oct 22 12:26 event12
crw-rw----  1 root input 13, 77 Oct 22 12:26 event13
crw-rw----  1 root input 13, 66 Oct 22 12:26 event2
crw-rw----  1 root input 13, 67 Oct 22 12:26 event3
crw-rw----  1 root input 13, 68 Oct 22 12:26 event4
crw-rw----  1 root input 13, 69 Oct 22 12:26 event5
crw-rw----  1 root input 13, 70 Oct 22 12:26 event6
crw-rw----  1 root input 13, 71 Oct 22 12:26 event7
crw-rw----  1 root input 13, 72 Oct 22 12:26 event8
crw-rw----  1 root input 13, 73 Oct 22 12:26 event9
crw-rw----  1 root input 13, 63 Oct 22 12:26 mice
crw-rw----  1 root input 13, 32 Oct 22 12:26 mouse0
```

https://bbs.archlinux.org/viewtopic.php?id=185746

    gpasswd -a thenrio input
