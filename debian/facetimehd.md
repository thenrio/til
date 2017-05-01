source code https://github.com/patjak/bcwc_pcie.git

manual is https://github.com/patjak/bcwc_pcie.wiki.git/Get-Started.md

TL;DR

```bash
cd firmware
sudo make install
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
