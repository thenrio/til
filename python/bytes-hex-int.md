```python
>>> int.from_bytes(bytes.fromhex('12'), 'big')
18
>>> int.from_bytes(bytes.fromhex('12ac'), 'big')
4780
>>> bytes.fromhex('12ac')
b'\x12\xac'
```

> see the bytes litteral b'\x12'
