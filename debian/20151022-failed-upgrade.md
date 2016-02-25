
huge fail :)

Error: Sub-process /usr/bin/dpkg returned an error code (1)
End-Date: 2015-10-21  23:48:59

resolution

    dpkg --configure -a

was not enough
add to remove conflicting package

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=802471

```
Unpacking libopenraw1v5:i386 (0.0.9-3.6) ...
dpkg: error processing archive /var/cache/apt/archives/libopenraw1v5_0.0.9-3.6_i386.deb (--unpack):
 trying to overwrite '/usr/lib/i386-linux-gnu/libopenraw.so.1.6.0', which is also in package libopenraw1:i386 0.0.9-3.5+b2
dpkg-deb: error: subprocess paste was killed by signal (Broken pipe)
Processing triggers for libc-bin (2.19-22) ...
Errors were encountered while processing:
 /var/cache/apt/archives/libopenraw1v5_0.0.9-3.6_i386.deb
```

resolution was to remove the old, and its dependencies
by sheer luck, I did not needed them _now_

    apt-get remove gimp libgegl* libopenraw1
