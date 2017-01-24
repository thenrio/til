on 192.168.6.65, capture traffic on port 9080 AND host in 192.168.6.0/24

> this is a cidr net filter, so that we select only _bad_ clients


```bash
tcpdump -nS -s 1024 -w 9080.pcap -C 100 -i eth0 net 192.168.6.0/24 and port 9080
```

see also `man pcap-filter`
