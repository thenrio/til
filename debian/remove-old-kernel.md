see [faq](https://www.debian.org/doc/manuals/debian-faq/ch-kernel.en.html)
what works better for me is also remove the headers

```sh
version=4.9.0-1; sudo -E dpkg --purge linux-headers-$version-amd64 linux-headers-$version-common linux-image-$version-amd64
```
