from https://github.com/bitwalker/distillery-test

```
==> Packaging release..
==> Archiving test-0.1.0
==> Writing archive to /home/thenrio/src/bitwalker/distillery-test/_build/dev/rel/test/releases/0.1.0/test.tar.gz
==> Updating archive..
==> Including system libs from current Erlang installation
==> Saving archive..
==> Failed to archive release: _build/dev/rel/test/erts-10.1/doc: no such file or directory
```

go and see

```
ll _build/dev/rel/test/erts-10.1
total 24
drwxr-xr-x 6 thenrio 4096 Sep 30 17:43 ./
drwxr-xr-x 7 thenrio 4096 Sep 30 17:43 ../
drwxr-xr-x 2 thenrio 4096 Sep 30 17:43 bin/
lrwxrwxrwx 1 thenrio   43 Sep 30 17:43 doc -> ../../../share/doc/erlang-doc/erts-10.1/doc
drwxr-xr-x 3 thenrio 4096 Sep 30 17:43 include/
lrwxrwxrwx 1 thenrio   44 Sep 30 17:43 info -> ../../../share/doc/erlang-doc/erts-10.1/info
drwxr-xr-x 3 thenrio 4096 Sep 30 17:43 lib/
drwxr-xr-x 2 thenrio 4096 Sep 30 17:43 src/
```

looks like a copy of

```
ll /usr/lib/erlang/erts-10.1/
total 24
drwxr-xr-x 6 root 4096 Sep 30 17:43 ./
drwxr-xr-x 7 root 4096 Sep 30 17:43 ../
drwxr-xr-x 2 root 4096 Sep 30 16:54 bin/
lrwxrwxrwx 1 root   43 Sep 27 10:52 doc -> ../../../share/doc/erlang-doc/erts-10.1/doc/
drwxr-xr-x 3 root 4096 Sep 30 16:54 include/
lrwxrwxrwx 1 root   44 Sep 27 10:52 info -> ../../../share/doc/erlang-doc/erts-10.1/info
drwxr-xr-x 3 root 4096 Sep 30 16:54 lib/
drwxr-xr-x 2 root 4096 Sep 30 16:53 src/
```

and the relative link makes command fail.
origin

```sh
for f in /usr/lib/erlang/erts-10.1/*; do echo -n "$f => "; dpkg -S $f; done
/usr/lib/erlang/erts-10.1/bin => erlang-common-test, erlang-base, erlang-dialyzer, erlang-src: /usr/lib/erlang/erts-10.1/bin
/usr/lib/erlang/erts-10.1/doc => erlang-doc: /usr/lib/erlang/erts-10.1/doc
/usr/lib/erlang/erts-10.1/include => erlang-dev: /usr/lib/erlang/erts-10.1/include
/usr/lib/erlang/erts-10.1/info => erlang-doc: /usr/lib/erlang/erts-10.1/info
/usr/lib/erlang/erts-10.1/lib => erlang-dev: /usr/lib/erlang/erts-10.1/lib
/usr/lib/erlang/erts-10.1/src => erlang-src: /usr/lib/erlang/erts-10.1/src
```

remove of erlang-doc is a resolution to archive command...
