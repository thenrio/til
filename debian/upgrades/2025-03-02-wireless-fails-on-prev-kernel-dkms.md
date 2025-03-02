
~ $ sudo dpkg --configure -a
[sudo] password for thenrio:
Setting up broadcom-sta-dkms (6.30.223.271-25) ...
Removing old broadcom-sta/6.30.223.271 DKMS files...
Loading new broadcom-sta/6.30.223.271 DKMS files...

Error! DKMS tree already contains: broadcom-sta/6.30.223.271
You cannot add the same module/version combo more than once.
dpkg: error processing package broadcom-sta-dkms (--configure):
 installed broadcom-sta-dkms package post-installation script subprocess returned error exit status 3
Processing triggers for initramfs-tools (0.145) ...
update-initramfs: Generating /boot/initrd.img-6.12.17-amd64
Errors were encountered while processing:
 broadcom-sta-dkms


I have two kernels:

* 6.11.10: has no wifi
* 6.12.17: has wifi

As new kernel 6.12.17 has wifi, I do not plan to fix the modules of 6.11.10, yet...
