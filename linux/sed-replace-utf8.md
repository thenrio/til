Given

```sh
od -tc -txC -N 30 affixe/order-1.slack
0000000   {  \n 302 240 302 240 342 200 234   t   y   p   e 342 200 235
         7b  0a  c2  a0  c2  a0  e2  80  9c  74  79  70  65  e2  80  9d
0000020   :     342 200 234   C   o   m   m   a   n   d   e 342
         3a  20  e2  80  9c  43  6f  6d  6d  61  6e  64  65  e2
```

Replace 

```sh
sed 's/\xc2\xa0/ /g; s/\xe2\x80\x9c/"/g; s/\xe2\x80\x9d/"/g'
```

> grouping alternate `s/\xe2\x80[\x9c\x9d]/"/g` is not correct.
