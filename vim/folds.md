Enable indentation-based folds for JSON:

```
:setlocal foldmethod=indent foldlevel=99
```

Then place the cursor on an object’s opening { and use zc / zo / za.

To make it permanent in init.lua:

```
vim.api.nvim_create_autocmd("FileType", {
pattern = "json",
callback = function()
  vim.opt_local.foldmethod = "indent"
  vim.opt_local.foldlevel = 99
end,
})
```

foldlevel=99 starts the file unfolded; foldmethod=manual was why the fold commands had nothing to act on.
