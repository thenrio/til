related projects

https://github.com/lukaszlach/docker-tc
uses 

* predicates `tc` on controller (busybox).
* a controller container, that can pass `tc` commands on any controller

   * listening to docker events and label
   * http request

https://github.com/alexei-led/pumba
from README:

> Pumba uses `tc` Linux tool for network emulation. You have two options:
> 
> 1. Make sure that container, you want to disturb, has `tc` tool available and properly installed (install `iproute2` package)
> 2. Use `--tc-image` option, with any `netem` command, to specify external Docker image with `tc` tool available. Pumba will create a new container from this image, adding `NET_ADMIN` capability to it and reusing target container network stack. You can try to use [gaiadocker/iproute2](https://hub.docker.com/r/gaiadocker/iproute2/) image (it's just Alpine Linux 3.3 with `iproute2` package installed)
> 
> **Note:** For Alpine Linux based image, you need to install `iproute2` package and also to create a symlink pointing to distribution files `ln -s /usr/lib/tc /lib/tc`.

the `tc-image` is interesting...
