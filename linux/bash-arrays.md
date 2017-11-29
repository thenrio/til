append 1

```sh
a=()
a+=(1)
a+=(2)
```

> note the parens to the right!

length

```sh
echo ${#a[*]}
# 2
```

the same with initial values

```sh
a=(1 2)
echo ${#a[*]}
# 2
```
