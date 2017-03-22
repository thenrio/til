base documentation is [arch](https://wiki.archlinux.org/index.php/USB_flash_installation_media#Using_dd)

* find usb device

		lsblk
		NAME                      MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
		sda                         8:0    0   113G  0 disk
		├─sda1                      8:1    0   200M  0 part
		├─sda2                      8:2    0  47.2G  0 part
		├─sda3                      8:3    0 619.9M  0 part
		├─sda4                      8:4    0   1.9G  0 part [SWAP]
		└─sda5                      8:5    0  63.1G  0 part /
		sdc                         8:32   1   1.9G  0 disk
		└─sdc1                      8:33   1   1.9G  0 part /media/thenrio/CLONEZILLA
		loop0                       7:0    0   100G  0 loop
		└─docker-8:5-3810112-pool 254:0    0   100G  0 dm
		loop1                       7:1    0     2G  0 loop
		└─docker-8:5-3810112-pool 254:0    0   100G  0 dm

it is sdc

* umount

		umount /media/thenrio/CLONEZILLA

		lsblk
		NAME                      MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
		sda                         8:0    0   113G  0 disk
		├─sda1                      8:1    0   200M  0 part
		├─sda2                      8:2    0  47.2G  0 part
		├─sda3                      8:3    0 619.9M  0 part
		├─sda4                      8:4    0   1.9G  0 part [SWAP]
		└─sda5                      8:5    0  63.1G  0 part /
		sdc                         8:32   1   1.9G  0 disk
		└─sdc1                      8:33   1   1.9G  0 part
		loop0                       7:0    0   100G  0 loop
		└─docker-8:5-3810112-pool 254:0    0   100G  0 dm
		loop1                       7:1    0     2G  0 loop
		└─docker-8:5-3810112-pool 254:0    0   100G  0 dm

* dump

as root

		dd bs=4M if=tmp/clonezilla-live-2.2.4-12-i486.iso of=/dev/sdc status=progress
		36+1 records in
		36+1 records out
		153092096 bytes (153 MB, 146 MiB) copied, 33.1961 s, 4.6 MB/s

		sync
