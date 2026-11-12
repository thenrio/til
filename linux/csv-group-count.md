

```sh
$ tail -n +2 ecrans_2026-11-12_14-13-59.csv | mlr --csv --implicit-csv-header count -g 5
5,count
Connecté,900
Jamais Connecté,150
Déconnecté,410
```



```sh
$ tail -n +2 ecrans_2026-11-12_14-13-59.csv | mlr --csv --implicit-csv-header count -g 5 | iconv -f utf-8 -t ascii//TRANSLIT
5,count
Connecte,900
Jamais Connecte,150
Deconnecte,410
```
