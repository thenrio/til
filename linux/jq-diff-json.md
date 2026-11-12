```sh
diff <(jq -S <left) <(jq -S <right)
```

One key here is the `--sort-keys / -S` which MAY prune a large false positive.
