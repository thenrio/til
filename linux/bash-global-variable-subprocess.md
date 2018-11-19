here is a pitfall!

```sh
mute() {
  value=$1
  echo $value 1>&2
}

value=0

t() {
  echo $value
}
```

function may change global of process

```sh
$ mute 2
2
$ t
2
```

but subprocess will not

```sh
$ mute 3 | tee
3
$ t
2
```

> (mute 3) is in a child subprocess.
