Is `<200b>` in vim?

sed

```sh
sed -i "s/$(echo -ne '\u200b')//g" ree.json
```

vim

```vim
:%s/\%u200b//g
```

https://superuser.com/questions/887161/remove-200b-character-from-text-file
