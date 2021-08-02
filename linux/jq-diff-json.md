```sh
diff <(jq -S A) <(jq -S -B)
```

One key here is the `--sort-keys / -S` which MAY prune a large false positive.
