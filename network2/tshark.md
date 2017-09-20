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

columns
-------

see syntax and available formats

```sh
tshark -G column-formats
```

see current format in preferences

```sh
tshark -G currentprefs
```

change on cli

```sh
tshark -n -Y smb -r cifs.pcap -o gui.column.format:No.,%m,Time,%Yt,Source,%s,sport,%rS,Destination,%d,dport,%rD,Protocol,%p,Length,%L,flags,%Cus:tcp.flags.str:0:R,data,%i | grep Bad | head -1
 3305 2017-09-12 06:25:02.897054    10.36.7.1 445 10.35.50.70  55470 SMB 105 ·······AP··· Trans2 Response, QUERY_PATH_INFO, Error: Bad userid
```
