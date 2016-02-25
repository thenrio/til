
either using a subshell

```
( time cat /dev/null ) &> time.log
```

either with an anonymous function

```
{ time cat /dev/null; } 2> time.log
```

> Note the `;` to end body of function :(
>

see [sof](http://stackoverflow.com/questions/13176611/bash-script-write-executing-time-in-a-file)
