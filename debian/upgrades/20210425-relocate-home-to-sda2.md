
~/til [master]$ grep /home /etc/fstab
UUID=bc20c960-6382-4e4a-b47b-ddaf9a1bc609 /home           ext4    errors=remount-ro 0       2

This had the side effect of making excessive cpu usage...
Had a hard time thinking on this until emerged initial setup with excessive acpi interrupt for gpe66.

```sh
Apr 27 14:08:29 pokayoke systemd[1]: disable-gpe4E.service: Failed to open /home/thenrio/src/dotfiles/etc/systemd/system/disable-gpe4E.service: No such file or directory
```

A containment is change file from link to file...
