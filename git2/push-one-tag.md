```sh
git push origin refs/tags/sandbox
```

https://stackoverflow.com/questions/23212452/how-to-only-push-a-specific-tag-to-remote

* `push origin --tags` pushes ALL tags
* lightweight tags are not pushed even with --follow-tags (push.followtags in config).
