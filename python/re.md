sed like?

```ruby
irb(main):005:0> "a\nb".gsub(/^(.*)$/, '# \1')
=> "# a\n# b"
```

```python
>>> re.sub('^(.*)$', '# \\1', 'a\nb', 0, re.MULTILINE)
'# a\n# b'
```
