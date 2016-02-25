
  * If initramfs-tools is configured to use busybox but it is not
    installed, mkinitramfs will now fail.  Previously it would quietly use
    klibc instead, sometimes producing a broken initramfs.  You may need
    to modify /etc/initramfs-tools/initramfs.conf or install busybox when
    upgrading.


