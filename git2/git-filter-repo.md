```sh
$ git lg
* 55248ef - 2020-01-07 14:08:54 +0100 - (HEAD -> master) content <thenrio>
* 6e152e7 - 2020-01-07 14:08:19 +0100 - hidden file <thenrio>
* 503c756 - 2020-01-07 14:07:32 +0100 - a <thenrio>
* 8018044 - 2020-01-07 14:06:51 +0100 - initial commit <thenrio>

$ git ls-files
a
secret
```

 
Goal remove `secret` file and its commits.

 
```sh
$ git filter-repo --invert-paths --path secret
Parsed 4 commits
New history written in 0.02 seconds; now repacking/cleaning...
Repacking your repo and cleaning out old unneeded objects
HEAD is now at d3fff0b content
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 4 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (8/8), done.
Total 8 (delta 0), reused 6 (delta 0)
Completely finished after 0.08 seconds.
```

After
 
```sh
$ git lg
* d3fff0b - 2020-01-07 14:08:54 +0100 - (HEAD -> master) content <thenrio>
* 503c756 - 2020-01-07 14:07:32 +0100 - a <thenrio>
* 8018044 - 2020-01-07 14:06:51 +0100 - initial commit <thenrio>

$ git ls-files
a
```

cf

* man git-filter-branch
* https://github.com/newren/git-filter-repo/blob/master/INSTALL.md
