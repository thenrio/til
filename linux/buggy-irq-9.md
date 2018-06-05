irq 9: nobody cared (as in journalctl).

https://bbs.archlinux.org/viewtopic.php?id=133327

lspci -vv
  does not show any device mapped to irq 9.

/sys/firmware/acpi/interrupts/
  https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-acpi

could it be related to disabled events? 

```
cat gpe4E gpe66
     364  EN     disabled     unmasked
   47047     STS disabled     unmasked
```

364 is o(47047)... not sure it was wise to disable it...
