genfromtxt >> loadtxt

can infer _correct_ types.

```python
a = numpy.genfromtxt("endofseason.log", dtype=None, names=('host', 'file', 'brand', 'models', 'products', 'items', 'http')
```

still, when faced with non homogenous datatypes, it yields a [structured array](https://docs.scipy.org/doc/numpy/user/basics.rec.html)

```python
a = numpy.genfromtxt("endofseason.log", dtype=None, names=['host', 'file', 'brand', 'models', 'products', 'items', 'http'])

len(a)
767

a[0]
(b'frgbmrfid1217l1', b'end-of-seasons/BNB-redo.csv.gz', b'BNB', 5583, 20820, 557, 201)
```

and we can get the named slice

```python
In [17]: items=a['items']

In [18]: len(items)
Out[18]: 767
```

and we can match on them

```
products=a['products']
plt.hist(products[brands == b'CCH'])
```

> condition MUST use the correct datatype (watch out the b)
>

another example

```
date,BNB,BRE,CCH
2017-02-13,29015,16349,48623
2017-02-14,32226,20462,57377
2017-02-15,32257,20469,57479
2017-02-16,32287,20452,57632
2017-02-17,32325,20464,57775
```

```
np.genfromtxt('catalogs.csv', dtype=None, names=['date','BNB','BRE','CCH'], delimiter=',', skip_header=1)
```
