from image to sdcard
====================
[official documentation](https://www.raspberrypi.org/documentation/installation/installing-images/linux.md)

image is big, approx 5 mins over http

2016-05-10-raspbian-jessie-lite.zip 314970590
2019-07-10-raspbian-buster-lite.zip 426250971

lsblk showed card on sdb, with two partitions

```sh
$ unzip -p raspbian/2019-07-10-raspbian-buster-lite.zip | time sudo dd bs=4M of=/dev/sdb status=progress
2069889024 bytes (2.1 GB, 1.9 GiB) copied, 13 s, 159 MB/s
0+33509 records in
0+33509 records out
2197815296 bytes (2.2 GB, 2.0 GiB) copied, 309.363 s, 7.1 MB/s
$ sync
```

> official adds conv=fsync to dd, better have the sync as a separate command?
>

> the progress is not linear... there is a freeze time (2min?) before end.
> depends on the sdcard...

> 4M unit in dd is 4MiB in parted, is 4*2**20 bytes.

from sdcard to image
====================
unit!
-----
M in dd is MiB in parted, is 2**20.

Take End of

```
$ sudo parted /dev/sdb unit MiB print
```

Using gparted, you can see _used_ and _unused_ space on a partition.
Does not know how to see it in parted...

eg: 

/dev/sdb2: 29.47 GiB, used: 2.18 GiB, unused: 27.29 GiB.

> I resized the sdb2 partition using gparted, that is not useful.
> Now it has the side effect of __unmounting__ sdb1 and sdb2.

```sh
$ sudo umount /dev/sdb{1,2}
```

We are going to skip write unused to image, using a 4MiB buffer size:

2696MiB, divide by 4, is 674.
2.18GiB, plus _some margin_ is 2304 (2**11 + 2**8), is 576.

```sh
$ time sudo dd bs=4M count=576 if=/dev/sdb status=progress | gzip > test.gz
```

> around 1m44.313s
> rate is around 20MB/s

size on disk is 780Mo.

gparted
=======
resize sdcard partition using gparted?
--------------------------------------
> assume sdcard is /dev/sdb there.

resize require umount first.
