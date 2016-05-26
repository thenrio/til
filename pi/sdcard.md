[official documentation](https://www.raspberrypi.org/documentation/installation/installing-images/linux.md)

image is big, approx 5 mins over http

		~/tmp/raspbian $ ll
		total 1661340
		drwxr-xr-x 2 thenrio       4096 May 25 12:47 ./
		drwxr-xr-x 9 thenrio       4096 May 25 12:47 ../
		-rw-r--r-- 1 thenrio 1386217472 May 11 00:36 2016-05-10-raspbian-jessie-lite.img
		-rw-r--r-- 1 thenrio  314970590 May 25 12:39 2016-05-10-raspbian-jessie-lite.zip

lsblk showed card on sdb, with two partitions

    sudo umount /dev/sdb{1,2}
    sudo dcfldd bs=4M if=2016-05-10-raspbian-jessie-lite.img of=/dev/sdb
    sync
