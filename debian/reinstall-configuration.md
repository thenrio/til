remove file, reinstall package

```
rm /etc/dhcp/dhcpd.conf
apt install --reinstall -o Dpkg::Options::=--force-confmiss isc-dhcp-server
```
