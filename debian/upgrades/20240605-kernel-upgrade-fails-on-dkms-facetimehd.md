Resolution
==========
See also 20240306-facetimehd.md 

A) update source code

```sh
cd ~/src/patjak/bcwc_pcie
git pull
```

B) remove dkms??

```sh
sudo dkms remove facetimehd/0.6.8
```

C) update source code

```sh
sudo rm -rf /usr/src/facetimehd-0.6.8/
sudo mkdir /usr/src/facetimehd-0.6.8
sudo cp -r * /usr/src/facetimehd-0.6.8/
```

D) build

```sh
sudo dkms build facetimehd/0.6.8
sudo dkms install facetimehd/0.6.8
```

> If it was to redo, I would have skip step B, because add again is an error?
>
> ```
> sudo dkms add facetimehd/0.6.8
> Error! DKMS tree already contains: facetimehd-0.6.8
> You cannot add the same module/version combo more than once.
> ```

Diagnostic?
===========

```
Deprecated feature: MODULES_CONF (/etc/dkms/framework.conf)
Sign command: /lib/modules/6.8.12-amd64/build/scripts/sign-file
Signing key: /var/lib/dkms/mok.key
Public certificate (MOK): /var/lib/dkms/mok.pub
Deprecated feature: MODULES_CONF (/var/lib/dkms/facetimehd/0.6.8/source/dkms.conf)

Building module:
Cleaning build area...
Building module(s)....(bad exit status: 2)
Failed command:
make -j4 KERNELRELEASE=6.8.12-amd64 -C /lib/modules/6.8.12-amd64/build M=/var/lib/dkms/facetimehd/0.6.8/build
Error! Bad return status for module build on kernel: 6.8.12-amd64 (x86_64)
Consult /var/lib/dkms/facetimehd/0.6.8/build/make.log for more information.
dkms autoinstall on 6.8.12-amd64/x86_64 succeeded for broadcom-sta
dkms autoinstall on 6.8.12-amd64/x86_64 failed for facetimehd(10)
Error! One or more modules failed to install during autoinstall.
Refer to previous errors for more information.
dkms: autoinstall for kernel: 6.8.12-amd64 failed!
run-parts: /etc/kernel/postinst.d/dkms exited with return code 11
dpkg: error processing package linux-image-6.8.12-amd64 (--configure):
```
