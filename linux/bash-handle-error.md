problem is want

* errexit as a general behavior
* loop command continue on error

eg:

```bash
set -e
set -o pipefail

ping() {
  local url=$1
  curl $url -sS -o /dev/null -w "$url -> %{http_code} %{time_total}\n"
}

for url in http://localhost:8080 http://localhost:1334; do
  ping $url
done
```

if
==

```bash
ping() {
  local url=$1
  if curl $url -sS -o /dev/null -w "$url -> %{http_code} %{time_total}\n"; then true; fi
}
```

trap?
=====
failed to have it working???!

```bash
ping() {
  local url=$1
  trap "echo bar" ERR
  curl $url -sS -o /dev/null -w "$url -> %{http_code} %{time_total}\n"
}
```

ditch errexit
=============
that is, explicit error handling.
`errexit` is difficult to handle and even predict.

without `errexit` it is as simple as

    f || die

now, there is the pipe thing...

related
=======

http://mywiki.wooledge.org/BashFAQ/105
http://stackoverflow.com/questions/9629710/proper-way-to-detect-shell-exit-code-when-errexit-option-set
