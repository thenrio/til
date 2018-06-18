basics
======
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
# 1 2
```

associative
===========
```sh
declare -A a=([BNB]=35311 [BRE]=17166 [CCH]=58159)
for k in ${!a[*]}; do echo "$k -> ${a[$k]}"; done
```
