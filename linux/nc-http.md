
```sh
while true; do echo -e "HTTP/1.1 200 OK\r\nContent-Length: 11\r\n\r\n[{\"id\":42}]" | nc -l 9080; done
```

related

* https://www.w3.org/Protocols/rfc2616/rfc2616-sec4.html#sec4.4
* http://www.commandlinefu.com/commands/view/9164/one-command-line-web-server-on-port-80-using-nc-netcat
