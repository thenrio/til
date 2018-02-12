there is no dict destructuring:
there is array unpacking


```python
d = {'a':'Apple', 'b':'Banana','c':'Carrot'}
a,b,c = [d[k] for k in ('a', 'b','c')]

a == 'Apple'
b == 'Banana'
c == 'Carrot'
```

(from http://www.seanbehan.com/destructuring-dictionaries-in-python/)
