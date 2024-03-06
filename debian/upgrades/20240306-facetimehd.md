Did not compile :(, cause bad header, a containment was 

A) pull the code.

B) remove old dkms

```sh
sudo dkms remove facetimehd/0.1
```

C) add new dkms

```sh
~/src/patjak/bcwc_pcie [master]$ sudo cp -r * /usr/src/facetimehd-0.6.8/
~/src/patjak/bcwc_pcie [master]$ sudo dkms add facetimehd/0.6.8
Deprecated feature: MODULES_CONF (/usr/src/facetimehd-0.6.8/dkms.conf)
Creating symlink /var/lib/dkms/facetimehd/0.6.8/source -> /usr/src/facetimehd-0.6.8
```

Then 

```sh
sudo dkms build facetimehd/0.6.8
sudo dkms install facetimehd/0.6.8
```
