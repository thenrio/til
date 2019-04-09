what the hell?

https://wiki.debian.org/NetworkManager

happens can GET google.fr in browser (firefox|chromium), but not anymore in terminal.
corporate proxy and firewall is back and with it, system start to collapse.

```
$ cat interfaces
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback
```

```
cat ../NetworkManager/NetworkManager.conf
[main]
plugins=ifupdown,keyfile

# https://wiki.debian.org/NetworkManager
[ifupdown]
managed=true
```

see also https://wiki.gnome.org/Projects/NetworkManager/Proxies,
which looks old and unmaintained ... a plan without a planning?

so looks like an option is

cntlm
=====
http_proxy -> cntlm (localhost:3128)
cntlm -> proxy

without
=======
looks like network manager is not enough for cli...
http_proxy -> proxy

??
