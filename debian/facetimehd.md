source code https://github.com/patjak/bcwc_pcie

manual is https://github.com/patjak/bcwc_pcie/wiki/Get-Started

TL;DR

```bash
cd ../facetimehd-firmware
make
sudo make install
```

See dkms for install kernel driver.


Load
====
then

```bash
sudo depmod
sudo modprobe facetimehd
```

test

```bash
mplayer tv://
```

or run `cheese` (best choice IHMO).

> running two program (mplayer, cheese) crash the driver!
>

dkms
====

```sh
~/src/patjak/bcwc_pcie [dkms]$ sudo cp -R . /usr/src/facetimehd-0.1
~/src/patjak/bcwc_pcie [dkms]$ sudo dkms add -m facetimehd -v 0.1
Deprecated feature: MODULES_CONF (/usr/src/facetimehd-0.1/dkms.conf)
Creating symlink /var/lib/dkms/facetimehd/0.1/source -> /usr/src/facetimehd-0.1
~/src/patjak/bcwc_pcie [dkms]$ nvim dkms.conf
~/src/patjak/bcwc_pcie [dkms*]$ sudo dkms add -m facetimehd -v 0.1
Error! DKMS tree already contains: facetimehd-0.1
You cannot add the same module/version combo more than once.
~/src/patjak/bcwc_pcie [dkms*]$ sudo dkms build facetimehd/0.1
Sign command: /lib/modules/6.6.9-amd64/build/scripts/sign-file
Signing key: /var/lib/dkms/mok.key
Public certificate (MOK): /var/lib/dkms/mok.pub
Deprecated feature: MODULES_CONF (/var/lib/dkms/facetimehd/0.1/source/dkms.conf)

Building module:
Cleaning build area...
make -j4 KERNELRELEASE=6.6.9-amd64 -C /lib/modules/6.6.9-amd64/build M=/var/lib/dkms/facetimehd/0.1/build....
Signing module /var/lib/dkms/facetimehd/0.1/build/./facetimehd.ko
Cleaning build area...
~/src/patjak/bcwc_pcie [dkms*]$ sudo dkms install facetimehd/0.1
Deprecated feature: MODULES_CONF (/var/lib/dkms/facetimehd/0.1/source/dkms.conf)

facetimehd.ko.xz:
Running module version sanity check.
 - Original module
   - No original module exists within this kernel
 - Installation
   - Installing to /lib/modules/6.6.9-amd64/updates/dkms/
depmod.....
```


Legacy install
==============


```bash
cd -
make clean
make
sudo checkinstall
```

this INSTALL package bcwc-pcie

