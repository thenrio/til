a [gem|perl](http://stackoverflow.com/questions/18215389/how-do-i-measure-request-and-response-times-at-once-using-curl)

a file `format.txt`

```
    time_namelookup:  %{time_namelookup}\n
       time_connect:  %{time_connect}\n
    time_appconnect:  %{time_appconnect}\n
   time_pretransfer:  %{time_pretransfer}\n
      time_redirect:  %{time_redirect}\n
 time_starttransfer:  %{time_starttransfer}\n
                    ----------\n
         time_total:  %{time_total}\n
```

then

```
curl -w @format.txt -o /dev/null -s http://localhost:8080/version
```

awesome format

