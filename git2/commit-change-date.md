Before

```sh
commit 051cb581e62ebebd67963580aa351656b759935d (HEAD -> main)
Author: thenrio <thierry.henrio@gmail.com>
Date:   Tue May 31 12:19:25 2022 +0000

    Remove .prettierrc
```

Change date?

```sh
$ d=2022-05-31T12:19:35Z
$ git commit --amend --no-edit --date=$d
```

```sh
$ git log -1
commit 0c025307ed0093583108fd2fb5d2a4a1ccfa9f0f (HEAD -> main)
Author: thenrio <thierry.henrio@gmail.com>
Date:   Tue May 31 16:19:35 2022 +0000

    Remove .prettierrc
$ git lg -1
* 0c02530 - 2022-06-07 09:24:16 +0200 - (HEAD -> main) Remove .prettierrc <thenrio>
```

There are two dates in a commit, author and commiter!

> See https://git-scm.com/docs/git-commit-tree/2.11.4#_commit_information
> See also `man git log`


```sh
$ d=2022-05-31T16:42:35Z
$ GIT_COMMITTER_DATE=$d git commit --amend --no-edit
[main 25a6931] Remove .prettierrc
 Date: Tue May 31 16:19:35 2022 +0000
 1 file changed, 1 deletion(-)
 delete mode 100644 .prettierrc.json
$ git lg -1
* 25a6931 - 2022-05-31 16:42:35 +0000 - (HEAD -> main) Remove .prettierrc <thenrio>
```
