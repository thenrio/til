irq 9: nobody cared (as in journalctl).

https://bbs.archlinux.org/viewtopic.php?id=133327

lspci -vv
  does not show any device mapped to irq 9.

/sys/firmware/acpi/interrupts/
  https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-acpi

could it be related to disabled events? 

```sh
cat gpe4E gpe66
     364  EN     disabled     unmasked
   47047     STS disabled     unmasked
```

364 is o(47047)... not sure it was wise to disable it...

A) enable gpe4E?
================

```sh
systemctl disable disable-gpe4E.service
reboot
```

* no irq 9
* gpe4E : high, raising 
* gpe66 : low 
* noise

```sh
/sys/firmware/acpi/interrupts $ cat gpe4E gpe66
    1790  EN     disabled     unmasked
      58     STS disabled     unmasked
```

is NOT ok.

B) disable gpe4E
================
see 1271d087e in dotfiles.

```sh
/sys/firmware/acpi/interrupts $ cat gpe4E gpe66
     364  EN     disabled     unmasked
     707     STS disabled     unmasked
```

strange

* gpe66 is lower than _initial_ state.

AAND irq 9 happened late (254.014165 after boot).

> not sure I waited 5 mins in A)
