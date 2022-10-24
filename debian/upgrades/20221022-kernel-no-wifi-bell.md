

```sh
...
Setting up linux-image-6.0.0-1-amd64 (6.0.2-1) ...
I: /vmlinuz is now a symlink to boot/vmlinuz-6.0.0-1-amd64
I: /initrd.img is now a symlink to boot/initrd.img-6.0.0-1-amd64
/etc/kernel/postinst.d/dkms:
dkms: running auto installation service for kernel 6.0.0-1-amd64:Deprecated feature: REMAKE_INITRD (/var/lib/dkms/broadcom-sta/6.30.2
23.271/source/dkms.conf)
Deprecated feature: REMAKE_INITRD (/var/lib/dkms/broadcom-sta/6.30.223.271/source/dkms.conf)
Sign command: /usr/lib/linux-kbuild-6.0/scripts/sign-file
Binary /usr/lib/linux-kbuild-6.0/scripts/sign-file not found, modules won't be signed
Deprecated feature: REMAKE_INITRD (/var/lib/dkms/broadcom-sta/6.30.223.271/source/dkms.conf)
Error! Your kernel headers for kernel 6.0.0-1-amd64 cannot be found at /lib/modules/6.0.0-1-amd64/build or /lib/modules/6.0.0-1-amd64
/source.
Please install the linux-headers-6.0.0-1-amd64 package or use the --kernelsourcedir option to tell DKMS where it's located.
.
/etc/kernel/postinst.d/initramfs-tools:
update-initramfs: Generating /boot/initrd.img-6.0.0-1-amd64
```

a cause is linux-headers held back to 5, because openvpn was pinned to 2.4.9-3 :(

```sh
git show 74c67d5:apt/preferences.d/openvpn
Package: openvpn
Pin: version 2.4.9-3
Pin-Priority: 1001
```

Remove upgrade:

Reboot?

```sh
sudo apt install --reinstall broadcom-sta-dkms

Building initial module for 6.0.0-1-amd64
Deprecated feature: REMAKE_INITRD (/var/lib/dkms/broadcom-sta/6.30.223.271/source/dkms.conf)
Error! Bad return status for module build on kernel: 6.0.0-1-amd64 (x86_64)
Consult /var/lib/dkms/broadcom-sta/6.30.223.271/build/make.log for more information.
dpkg: error processing package broadcom-sta-dkms (--configure):
 installed broadcom-sta-dkms package post-installation script subprocess returned error exit status 10
 Errors were encountered while processing:
  broadcom-sta-dkms
  E: Sub-process /usr/bin/dpkg returned an error code (1)
```

Go and see bugs?

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1021912


> There is a patch available in the Arch community:
> https://github.com/archlinux/svntogit-community/blob/master/broadcom-wl-dkms/repos/community-x86_64/015-linux600.patch
> 
> 
> Quick and dirty solution until the patch is included in Debian (use at
> own risk):
> 1. Download 015-linux600.patch (raw file)
> 2. # cd /usr/src/broadcom-.../src/wl/sys/
> 3. # patch wl_cfg80211_hybrid.c < /path/to/015-linux600.patch
> 4. # dpkg-reconfigure broadcom-sta-dkms
> 
> Regards

:)

```sh
$ curl -OL https://raw.githubusercontent.com/archlinux/svntogit-community/master/broadcom-wl-dkms/repos/community-x86_64/015-linux600.patch
root@pokayoke:/usr/src/broadcom-sta-6.30.223.271/src/wl/sys# patch wl_cfg80211_hybrid.c </home/thenrio/tmp/015-linux600.patch
patching file wl_cfg80211_hybrid.c
Hunk #1 succeeded at 2380 (offset -32 lines).
```

```sh
dpkg-reconfigure broadcom-sta-dkms --force
```

---

less makes bell (beep).

```sh
gsettings set org.gnome.desktop.wm.preferences audible-bell false
```

> https://superuser.com/questions/1457608/how-to-disable-the-bell-in-urxvt
