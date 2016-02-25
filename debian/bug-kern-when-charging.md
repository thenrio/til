when charging, lots of messages like this

```
Jun  5 00:34:54 pokayoke kernel: [  922.859037] ata1: exception Emask 0x10 SAct 0x0 SErr 0x10000 action 0xe frozen
Jun  5 00:34:54 pokayoke kernel: [  922.859040] ata1: irq_stat 0x00400000, PHY RDY changed
Jun  5 00:34:54 pokayoke kernel: [  922.859042] ata1: SError: { PHYRdyChg }
Jun  5 00:34:54 pokayoke kernel: [  922.859045] ata1: hard resetting link
Jun  5 00:34:55 pokayoke kernel: [  923.583209] ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
Jun  5 00:34:55 pokayoke kernel: [  923.583729] ata1.00: unexpected _GTF length (8)
Jun  5 00:34:55 pokayoke kernel: [  923.584329] ata1.00: unexpected _GTF length (8)
Jun  5 00:34:55 pokayoke kernel: [  923.584336] ata1.00: configured for UDMA/33
Jun  5 00:34:55 pokayoke kernel: [  923.584450] ata1: EH complete
```

related are [this](https://wiki.debian.org/InstallingDebianOn/Apple/MacBookAir/6-1)

and we have

```
/var/log $ cat /sys/class/scsi_host/host0/link_power_management_policy 
max_performance
```

whereas, when not charging, then

```
/var/log $ cat /sys/class/scsi_host/host0/link_power_management_policy 
min_power
```

and no messages...

