Let r a series, value is 

```python
>>> r
0         11.111111
1        100.000000
2        100.000000
3         35.000000
4        100.000000
            ...
25451    100.000000
25452    100.000000
25453    100.000000
25454      5.555556
25455     27.500000
Length: 25078, dtype: float64
```

Values are r, r as ratio.
There are 25455+1 values (ratios) in this series.

```python
>>> r.value_counts()
100.000000    14511
5.555556        685
10.000000       621
6.666667        505
12.500000       433
              ...
26.530612         1
67.187500         1
26.153846         1
6.428571          1
19.298246         1
Length: 825, dtype: int64
```

counts are correct, but the ratios are not sorted??

A key there is go and see what struct it is:

```python
>>> r.value_counts().__class__
<class 'pandas.core.series.Series'>
```

Struct is a serie, first "column" is the index (r), second are the values of series r.

ratio is the index, values are count.

The first "column" of output is not a column nor data, it is the __index__.
(see [intro/series](https://pandas.pydata.org/pandas-docs/stable/user_guide/dsintro.html#series) for words on the structure).

If we want to sort by ratio asc:

```python
>>> r.value_counts().sort_index()
0.892857          1
1.351351          1
1.428571          2
1.818182          1
1.851852          1
              ...
98.888889         2
98.901099         1
99.000000         1
99.090909         1
100.000000    14511
Length: 825, dtype: int64
```

This is sound, this `value_counts` groups by value (here a float!), and counts values: [r] → {r: count}
The trick is r is the index in a series, series has two sort: `sort_values`, `sort_index`.
