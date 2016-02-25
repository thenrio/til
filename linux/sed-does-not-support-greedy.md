
see [sof](http://stackoverflow.com/questions/1103149/non-greedy-regex-matching-in-sed)

sed does not support that ...

a trick is to look for separator
this can be a slippery slope... still it should work :)

eg: replace the device in this json, with `"name":"bar"`

```
cat test.json
{"action":"SHIPPING","id":69768,"state":"IN_TRANSIT","date":"2015-06-15T05:44:06.000Z","device":{"id":16},"items":[{"id":"303960C90020FB8000000C30"}],"box":{"id":"54896354001"},"sender":{"id":"0639338"}}
```

```
cat test.json | sed 's/"device":{[^}]*}/"device":{"name":"bar"}/'
{"action":"SHIPPING","id":69768,"state":"IN_TRANSIT","date":"2015-06-15T05:44:06.000Z","device":{"name":"bar"},"items":[{"id":"303960C90020FB8000000C30"}],"box":{"id":"54896354001"},"sender":{"id":"0639338"}}
```

that's it
