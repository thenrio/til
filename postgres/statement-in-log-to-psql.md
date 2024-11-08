params:

select (V), then command:

put each on one line

```
s/,\? \$/\r$/g
```

to var

```
s/\$\(.*\) = '\(.*\)'/\\set v\1 \2/g
```
