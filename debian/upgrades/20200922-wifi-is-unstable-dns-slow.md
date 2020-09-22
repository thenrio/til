change /etc/nsswitch.conf?? is not a resolution.
see https://itsfoss.com/speed-up-slow-wifi-connection-ubuntu/ Solution 3.

```
- hosts:          files mdns4_minimal [NOTFOUND=return] dns
+ hosts:          files dns
```

dig?

https://net2.com/how-to-fix-wifi-not-working-on-ubuntu/

```sh
sudo lspci -vnn -d 14e4:43a0
03:00.0 Network controller [0280]: Broadcom Inc. and subsidiaries BCM4360 802.11ac Wireless Network Adapter [14e4:43a0] (rev 03)
        Subsystem: Apple Inc. BCM4360 802.11ac Wireless Network Adapter [106b:0112]
        Flags: bus master, fast devsel, latency 0, IRQ 18, IOMMU group 13
        Memory at b0600000 (64-bit, non-prefetchable) [size=32K]
        Memory at b0400000 (64-bit, non-prefetchable) [size=2M]
        Capabilities: [48] Power Management version 3
        Capabilities: [58] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [68] Vendor Specific Information: Len=44 <?>
        Capabilities: [ac] Express Endpoint, MSI 00
        Capabilities: [100] Advanced Error Reporting
        Capabilities: [13c] Device Serial Number 60-f8-00-ff-ff-00-00-01
        Capabilities: [150] Power Budgeting <?>
        Capabilities: [160] Virtual Channel
        Capabilities: [1b0] Latency Tolerance Reporting
        Capabilities: [220] Physical Resizable BAR
        Kernel driver in use: wl
        Kernel modules: bcma, wl
```

This 802.11ac hints me at looking at router wifi settings.
Disable 802.11n in router wifi settings IS a containement (?!).

Wifi is pretty much abstracted by gnome network manager (as network).

Looks like the real deal is wpa_supplicant, as in https://debian-facile.org/doc:reseau:wpasupplicant.
Think would debug next time using verbose options of actual program?
