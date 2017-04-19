read from csv
=============

```bash
head -1 frcchrfid437l1-C641-diff-1.csv
CCH|0000000000022|2|0|2014-12-11T08:09:03.000Z
```

```python
datas=pd.read_csv(open('frcchrfid437l1-C641-diff-1.csv'), sep='|', header=None, names=['brand', 'ean', 'actual', 'expected', 'date'])
```

specifying data type
--------------------
the same with date col (4) parsed as date (not string).

```python
datas=pd.read_csv(open('frcchrfid437l1-C641-diff-1.csv'), sep='|', header=None, names=['brand', 'ean', 'actual', 'expected', 'date'], parse_dates=[4])
```

adapting data type
------------------
suppose

```
datas.date.dtype
dtype('O')
```

then

```
datas.date = datas.date.astype("datetime64")
datas.date.dtype
dtype('<M8[ns]')
```

shape (aka octave size)
=======================

```
f2.shape
(1583, 2)
>>> len(f2.index)
1583
>>> len(f2)
1583
>>> len(f2.columns)
2
```

sort
====
```
d2 = datas.sort_values(by=['date', 'ean'], ascending=False)
```

index condition (boolean vector)

```python
d2.date > '2016-09'
```

slice
=====

### series ~ ndarray

```ipython
In [26]: d2[0:1]
Out[26]:
     brand            ean  actual  expected                      date
     1140   CCH  3612531748152       1         0  2017-03-15T18:29:17.241Z
```

(see http://pandas.pydata.org/pandas-docs/stable/indexing.html)

### frame

see http://pandas.pydata.org/pandas-docs/stable/indexing.html#indexing-advanced

```python
>>> m = f.ix[:, ['filename', 'products']]
>>> m.shape
(1583, 2)

>>> m = f.iloc[:, [1, 4]]
>>> m.shape
(1583, 2)
```


```python
f2=pd.DataFrame(dict(filename=f.filename, products=f.products))
```

> dataframe is not like a 2d ndarray
> mostly, we can not index it like a 2d array

```python
>>> f.columns
Index(['hostname', 'filename', 'brand', 'models', 'products', 'items', 'code'], dtype='object')

>>> f3 = f[:, [1,4]]
		...
TypeError: unhashable type: 'slice'

>>> m = f.values
>>> f3 = m[:, [1,4]]
>>> f.shape
(1583, 7)
>>> f3.shape
(1583, 2)
```

condition
=========

```ipython
In [36]: d2[d2.date > '2016-09'][-1:]
Out[36]:
    brand            ean  actual  expected                      date
    936   CCH  3612531672419       1         0  2016-09-02T08:15:48.000Z
```

grouping
========

```
dates = d2.date
axis = dates.groupby([dates.dt.year, dates.dt.month]).count().plot(type='bar')
```

(see http://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.plot.html)

axis can be changed

(see also http://stackoverflow.com/questions/19584029/plotting-histograms-from-grouped-data-in-a-pandas-dataframe)

time series
===========
see http://stackoverflow.com/questions/27365467/python-pandas-plot-histogram-of-dates
