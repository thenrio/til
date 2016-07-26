goal: generate a list of string, each formated as "%13d"

    ["0000000000001","0000000000002","0000000000003","0000000000004"]

simple

    echo 5 | jq -Mc '[ range(1; .) ] | map(("0"*13 + (.|tostring))[-13:])'

with external variable

    echo 5 | jq -Mc --arg pad $(printf "%013d" 0) '[ range(1; .) ] | map(($pad + (.|tostring))[-13:])'

with internal variable

    echo 5 | jq -Mc '("0"*13) as $pad | [ range(1; .) ] | map(($pad + (.|tostring))[-13:])'

keys: Variables parentheses 
