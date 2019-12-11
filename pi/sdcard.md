[official documentation](https://www.raspberrypi.org/documentation/installation/installing-images/linux.md)

image is big, approx 5 mins over http

2016-05-10-raspbian-jessie-lite.zip 314970590
2019-07-10-raspbian-buster-lite.zip 426250971

lsblk showed card on sdb, with two partitions

```sh
sudo umount /dev/sdb{1,2}
unzip -p 2016-05-10-raspbian-jessie-lite.zip | sudo dcfldd bs=4M of=/dev/sdb
sync
```

```sh
unzip -p raspbian/2019-07-10-raspbian-buster-lite.zip | sudo dd bs=4M of=/dev/sdb status=progress conv=fsync
2069889024 bytes (2.1 GB, 1.9 GiB) copied, 13 s, 159 MB/s
0+33509 records in
0+33509 records out
2197815296 bytes (2.2 GB, 2.0 GiB) copied, 309.363 s, 7.1 MB/s
```

> the progress is not linear... there is a freeze time (2min?) before end.
> depends on the sdcard...
