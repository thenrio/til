```sh
Setting up shop (2.41.0-2) ...
/var/lib/dpkg/info/shop.postinst: line 28: syntax error near unexpected token `$cmd'
dpkg: error processing package shop (--install):
 installed shop package post-installation script subprocess returned error exit status 2
```

lenses?

```sh
root@90f8341d5996:/home/deploy# dpkg --install --debug=2 shop_2.41.0-2_all.deb
(Reading database ... 40367 files and directories currently installed.)
...
D000002: fork/exec /var/lib/dpkg/info/shop.postinst ( configure 2.38.1-2 )
/var/lib/dpkg/info/shop.postinst: line 28: syntax error near unexpected token `$cmd'
...
```

edit, test can be made:

```sh
/var/lib/dpkg/info/shop.postinst configure 2.38.1-2
```
