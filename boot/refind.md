find it cumbersome ...
does not like it a lot :(

main reason is because I installed refind using osx and does not know ( yet ) how to update it :(

TL;DR
=====

edit file refind.conf

    sudo mount /dev/sda1 /boot/efi
    sudo cp refind.conf /boot/efi/EFI/BOOT/refind.conf
    sync
    sudo reboot

state before
============

blkid
-----

    /boot/efi/EFI/BOOT $ sudo blkid
    /dev/sda5: UUID="e690eef2-0a69-4804-a218-49e7b1e36379" TYPE="ext4" PARTUUID="69299029-0f85-4ae3-a0a9-abef50070757"
    /dev/sda1: LABEL="EFI" UUID="67E3-17ED" TYPE="vfat" PARTLABEL="EFI System Partition" PARTUUID="d5622f52-5ecc-4f97-abc3-cded89e96221"
    /dev/sda2: UUID="a43d243e-3e1f-32b5-8dc2-8018f013c038" LABEL="Macintosh HD" TYPE="hfsplus" PARTLABEL="Customer" PARTUUID="0ee14c38-d93c-48ed-ad6a-f40cfee32110"
    /dev/sda3: UUID="cae7d872-ce32-3f80-aaf8-1e54d485211e" LABEL="Recovery HD" TYPE="hfsplus" PARTLABEL="Recovery HD" PARTUUID="69b884e3-8fc9-4642-a847-d8852773ba4e"
    /dev/sda4: UUID="9e62798f-9468-4c5d-941c-05eee0a603cc" TYPE="swap" PARTUUID="7a86d0c4-c1e9-454d-92de-b6471a32b58f"

current cmdline
---------------

    \boot\vmlinuz-4.0.0-1-amd64 ro root=UUID=e690eef2-0a69-4804-a218-49e7b1e36379 initrd=boot\initrd.img-4.0.0-1-amd64.old-dkms

options
=======

1- add a menuentry in refind configuration
------------------------------------------
this is what is described on https://wiki.archlinux.org/index.php/MacBookPro11,x#Direct_EFI_booting_.28rEFInd.29

mount the efi partition

    mount /dev/sda1 /boot/efi

then, have an hurdle : /dev/sda5 has no label ( !!!? )

see [there](https://bbs.archlinux.org/viewtopic.php?id=162438):

then change label of /dev/sda5

    root@pokayoke:/boot# e2label /dev/sda5 debian

and check is ok

    root@pokayoke:/boot# blkid
    /dev/sda5: LABEL="debian" UUID="e690eef2-0a69-4804-a218-49e7b1e36379" TYPE="ext4" PARTUUID="69299029-0f85-4ae3-a0a9-abef50070757"
    /dev/sda1: LABEL="EFI" UUID="67E3-17ED" TYPE="vfat" PARTLABEL="EFI System Partition" PARTUUID="d5622f52-5ecc-4f97-abc3-cded89e96221"
    /dev/sda2: UUID="a43d243e-3e1f-32b5-8dc2-8018f013c038" LABEL="Macintosh HD" TYPE="hfsplus" PARTLABEL="Customer" PARTUUID="0ee14c38-d93c-48ed-ad6a-f40cfee32110"
    /dev/sda3: UUID="cae7d872-ce32-3f80-aaf8-1e54d485211e" LABEL="Recovery HD" TYPE="hfsplus" PARTLABEL="Recovery HD" PARTUUID="69b884e3-8fc9-4642-a847-d8852773ba4e"
    /dev/sda4: UUID="9e62798f-9468-4c5d-941c-05eee0a603cc" TYPE="swap" PARTUUID="7a86d0c4-c1e9-454d-92de-b6471a32b58f"

here is the added menuentry in `/boot/efi/EFI/BOOT/refind.conf`


    menuentry zzZzz {
      icon EFI/BOOT/icons/os_debian.png
      volume debian
      loader /boot/vmlinuz-4.0.0-1-amd64
      initrd /boot/initrd.img-4.0.0-1-amd64
      options "rw root=UUID=e690eef2-0a69-4804-a218-49e7b1e36379 libata.force=noncq"
    }

and ok

    ~/craft/boot $ cat /proc/cmdline
    \boot\vmlinuz-4.0.0-1-amd64 rw root=UUID=e690eef2-0a69-4804-a218-49e7b1e36379 libata.force=noncq initrd=\boot\initrd.img-4.0.0-1-amd64

2- drop a configuration file near kernel
----------------------------------------
here...
https://wiki.archlinux.org/index.php/Kernel_parameters#rEFInd


did not make it... first option is ok...

