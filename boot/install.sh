#!/usr/bin/env bash
sudo mount /dev/sda1 /boot/efi
sudo cp refind.conf /boot/efi/EFI/BOOT/refind.conf
sync
sudo reboot
