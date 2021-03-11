Does not pair with selected device.

A containment is to use command line:

```sh
$ bluetoothctl devices
Device 04:CB:88:FD:76:1D JBL TUNE560BT
Device B8:F6:53:E6:3D:46 JBL Flip 5
Device 2C:41:A1:0E:FC:08 Bose Color II SoundLink
$ bluetoothctl pair 04:CB:88:FD:76:1D
Attempting to pair with 04:CB:88:FD:76:1D
[CHG] Device 04:CB:88:FD:76:1D Connected: yes
[CHG] Device 04:CB:88:FD:76:1D UUIDs: 00001108-0000-1000-8000-00805f9b34fb
[CHG] Device 04:CB:88:FD:76:1D UUIDs: 0000110b-0000-1000-8000-00805f9b34fb
[CHG] Device 04:CB:88:FD:76:1D UUIDs: 0000110c-0000-1000-8000-00805f9b34fb
[CHG] Device 04:CB:88:FD:76:1D UUIDs: 0000110e-0000-1000-8000-00805f9b34fb
[CHG] Device 04:CB:88:FD:76:1D UUIDs: 0000111e-0000-1000-8000-00805f9b34fb
[CHG] Device 04:CB:88:FD:76:1D ServicesResolved: yes
[CHG] Device 04:CB:88:FD:76:1D Paired: yes
Pairing successful
```

Then shows up.
