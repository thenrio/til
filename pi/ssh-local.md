Either direct rj45 link or local

    ssh pi@raspberrypi.local

Spotted on http://raspberrypi.stackexchange.com/questions/37920/how-do-i-set-up-networking-wifi-static-ip

Requires to disable gnome network setting (dhcp).
Not sure about the steps:)

Select link-local in gnome.

```sh
sudo ip address add 192.168.6.1/24 dev eth0
```

And fallback pi to fallback on an address in 192.168.6.1/24.
