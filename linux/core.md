
./copy
row number 0 is out of range 0..-1
Segmentation fault (core dumped)

sudo coredumpctl list
TIME                            PID   UID   GID SIG COREFILE  EXE
Mon 2018-10-29 12:43:04 CET   21344  1000  1000  11 present   /home/thenrio/src/thenrio/postgres-copy/copy

see

* https://wiki.archlinux.org/index.php/Core_dump
* https://jvns.ca/blog/2018/04/28/debugging-a-segfault-on-linux/

files go to /var/lib/systemd/coredump/ (as in man coredumpctl).
