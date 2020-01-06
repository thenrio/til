```sh
dpkg-query -W -f='${binary:Package} ${db:Status-Abbrev}\n' | grep -E "rc $" | wc -l
378
```

purge one?
looks ok

purge others?


```sh
sudo apt purge $(dpkg-query -W -f='${binary:Package},${db:Status-Abbrev}\n' | grep "rc $" | cut -d, -f1)
```
