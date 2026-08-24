Run like so?

```sh
./run.sh
```

```sh
curl "localhost:3000/displays?id=eq.1440&select=id,name,players(remote_id)" -w "%{stderr}%{size_download},%{time_total}\n" -o /dev/null -s
106,0.001849
```

```sh
curl "localhost:3000/displays?select=id,name,players(remote_id)" -w "%{stderr}%{size_download},%{time_total}\n" -o /dev/null -s
660151,0.017089
```


