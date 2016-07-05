use arg

    echo 1 | jq -Mc --arg now $( date --iso-8601=ns | sed -E 's/,.*$/.000Z/' ) '$now'
    "2016-07-05T12:17:55.000Z"

use builtin

    echo 1 | jq 'now|todate'
    "2016-07-05T10:18:56Z"

    echo 1 | jq 'now|strftime("%Y-%m-%dT%H:%M:%S.000Z")'
    "2016-07-05T10:21:04.000Z"
