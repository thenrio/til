Then add patch?
Why is it not loaded?
Checked the source tree, patch is still there ...

Boot in prev kernel?

```sh
$ lsmod | grep 802
cfg80211             1118208  1 wl
rfkill                 32768  7 bluetooth,cfg80211

$ lspci | grep 802
03:00.0 Network controller: Broadcom Inc. and subsidiaries BCM4360 802.11ac Wireless Network Adapter (rev 03)
```

New does not have mod...

Reconfigure?

```sh
dpkg-reconfigure broadcom-sta-dkms
Deprecated feature: REMAKE_INITRD (/usr/src/broadcom-sta-6.30.223.271/dkms.conf)
Building for 6.0.0-2-amd64

Module build for kernel 6.0.0-2-amd64 was skipped since the
kernel headers for this kernel do not seem to be installed.
```

:(
