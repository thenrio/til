Extract fa-.* patterns in source code?

```sh
git grep 'fa-.*' | sed -E 's/^.*(fa-[a-z0-9-]*).*$/\1/g' | sort | uniq
```
