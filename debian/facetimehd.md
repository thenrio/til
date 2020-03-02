source code https://github.com/patjak/bcwc_pcie

manual is https://github.com/patjak/bcwc_pcie/wiki/Get-Started

TL;DR

```bash
cd ../facetimehd-firmware
make
sudo make install
```

```bash
cd -
make clean
make
sudo checkinstall
```

this INSTALL package bcwc-pcie

then

```bash
sudo depmod
sudo modprobe facetimehd
```

test

```bash
mplayer tv://
```

or run `cheese` (best choice IHMO).

> running two program (mplayer, cheese) crash the driver!
>
