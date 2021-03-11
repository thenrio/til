From apt list change:

```
bridge-utils (1.7-1) unstable; urgency=medium

  Linux kernel has changed bridge MAC address selection.

  In older Linux kernels the MAC of the bridge was the lower mac of the
  devices attached to it, this is no longer the case now at Bullseye. The
  kernel now makes up a completely new MAC address.

  This means that if you rely on your bridge's MAC address for something
  like DHCP leases or similar stuff you'll loose this feature. The only way
  to go back to your old MAC address is to assign it to the bridge
  explicitly using bridge_hw followed by the wanted MAC address on your
  bridge definition.

  To help with the problem caused by the kernel change of address selection
  (see below for more info on this) we have overloaded bridge_hw option so
  that you can specify the address you want or the name of an interface to
  take the MAC address from it.

  In the past setting the bridge hardware address was not considered safe,
  this is no longer a problem, currently it is necessary or recommended in a
  lot of scenarios like IPv6, DHCP reservations, ... the ussage of bridge_hw
  setting if the recommended way of doing this.

  Support for more than one stanza for one interface is now supported, see
  README and examples.
```

