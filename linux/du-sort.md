~ $ du --max-depth=1 . > /tmp/disk-usage-home

~ $ cat /tmp/disk-usage-home | sort -n -k1 | tail
280644  ./.virtualenvs
423856  ./.m2
455520  ./.config
867572  ./.local
1049916 ./.rbenv
1422488 ./.rustup
1583732 ./tmp
2824752 ./.cache
13613512        ./src
23775420        .
