symtom is gdm crashes, go back to login screen!
still process are there...(tmux)...

journalctl?
===========

```
Oct 10 17:19:27 pokayoke gnome-shell[17760]: Connection to xwayland lost
```

related?
========
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=900776

upgrade?
========

```sh
tracker reset --hard
CAUTION: This process may irreversibly delete data.
Although most content indexed by Tracker can be safely reindexed, it can’t be assured that this is the case for all data. Be aware that you may be incurring in a data loss situation, proceed at your own risk.

Are you sure you want to proceed? [y|N]: y
Found 0 PIDs…
Setting database locations
Checking database directories exist
Checking database version
Checking whether database files exist
Removing all database/storage files
  Removing database:'/home/thenrio/.cache/tracker/meta.db'
  Removing db-locale file:'/home/thenrio/.cache/tracker/db-locale.txt'
  Removing journal:'/home/thenrio/.local/share/tracker/data/tracker-store.journal'
  Removing db-version file:'/home/thenrio/.cache/tracker/db-version.txt'
```
