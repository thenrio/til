```python
>>> a = [1, 8, 10]
>>> list(zip(a, a[1:]))
[(1, 8), (8, 10)]
```

Same output for `Enum.chunk([1, 8, 10], 2, 1)`
