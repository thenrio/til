is _common_ knowledge :)

see [faq](https://www.debian.org/doc/manuals/debian-faq/ch-kernel.en.html)

    sudo -E dpkg --purge linux-image-$VERSION

what works better for me is also remove the headers

    export VERSION=4.4.0-1; sudo -E dpkg --purge linux-headers-$VERSION-amd64 linux-headers-$VERSION-common linux-image-$VERSION-amd64
