capture uses libpcap filter syntax

```bash
tshark -n -i lo dst port 9080
```

> man pcap-filter

read uses display filter

```bash
tshark -r 437l1.pcap ip.dst==192.168.6.65 and http
```

> dunno yet where display filter documentation is on my host...
> ...

capture MAY also use display filter


```bash
tshark -n -Y http -i lo dst port 9080
```

at this time useful display filters

* http
* tcp.flags.push==1
