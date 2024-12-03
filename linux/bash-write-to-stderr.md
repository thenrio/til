goal : write to stderr only, leaving stdout unchanged
=====================================================

test is 

* wc is 0
* wc of stderr is not 0 (using console eyes)

failing test

```bash
echo bar 1>&2 > /dev/null | wc -l
0
```

order of redirection is IMPORTANT.
here with a subprocess.

```bash
$ (echo bar 1>&2) > /dev/null | wc -l
bar
0
```

here with correct order.

```bash
$ echo bar > /dev/null 1>&2 | wc -l
bar
0
```

and the final form

```bash
echo bar >&2 | wc -l
bar
0
```
