Initial setup follows [good practices](https://docs.pytest.org/en/latest/goodpractices.html)?

```sh
pip install -e .
```

Then I do not face

```
ImportError while importing test module '.../py/tests/grid_test.py'.
```

When I run mere `pytest` rather than `python -m pytest`.

Then `tests/__init__.py` is not required 

> pallets/flask does not have an `__init__.py` in `tests`.
