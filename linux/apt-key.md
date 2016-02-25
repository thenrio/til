TL;DR add to dedicated keyring
==============================

```
sudo apt-key --keyring /etc/apt/trusted.gpg.d/erlang-solutions.gpg add erlang_solutions.asc
```

default puts to keyring file /etc/apt/trusted.gpg
=================================================

```
~/tmp $ sudo apt-key add erlang_solutions.asc
[sudo] password for thenrio: 
OK
```

```
~/tmp $ sudo apt-key list | grep -B 3 -A 1 erlang
/etc/apt/trusted.gpg
--------------------
pub   4096R/A14F4FCA 2012-02-06
uid                  Erlang Solutions Ltd. <packages@erlang-solutions.com>
sub   4096R/341540CB 2012-02-06
```

prefer isolated file

```
apt-key del A14F4FCA
OK
```

and the key is removed 

and there is a backup file :)

```
root@pokayoke:/etc/apt# git status
On branch erlang-solutions
Untracked files:
  (use "git add <file>..." to include in what will be committed)

        trusted.gpg~
```


