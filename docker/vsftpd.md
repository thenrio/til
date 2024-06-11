Server in a container

```sh
docker run -d -p 21:21 -p 21000-21010:21000-21010 -e USERS='one|1234' --name=vsftpd delfer/alpine-ftp-server
```

Client

```sh
lftp localhost:21
lftp localhost:~> user one
Password:
lftp one@localhost:~> ls
lftp one@localhost:~> put /home/thenrio/tmp/text
9966 bytes transferred
lftp one@localhost:~> ls
-rw-r--r--    1 1000     1000         9966 Jun 11 13:33 text
```
