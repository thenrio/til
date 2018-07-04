Given this state

```
git lg -10
* a6236c3f6 - (HEAD -> master, origin/master, origin/HEAD, gitlab/master) fix inventory no product yields barcode on migration (#3979) (18 hours ago) <thenrio>
* 9de8c1d36 - simplify sql (remove useless alias) (18 hours ago) <thenrio>
* 9e8fb1331 - print bytes of response in case of error (#3976) (19 hours ago) <thenrio>
*   09700d1af - Merged in opening (pull request #34) (23 hours ago) <Anthony Roussel>
|\
| * 042160096 - allow OPENING as valid kind in checks (#3226) (24 hours ago) <Anthony Roussel>
|/
* 7d8a50518 - (tag: v1.125.0) v1.125.0 (5 days ago) <thenrio>
```

that pushed too many commit, want gitlab/master to be at v1.125.0.

This command?!

```sh
git push gitlab v1.125.0:master -f
```

is a fail.
Correct is below:

```sh
git push gitlab 7d8a50518:master -f
```

see man git push, refspec section.
