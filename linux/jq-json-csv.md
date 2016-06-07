to avoid search it again?

json => csv
===========

for each encoded tag, put a line `ean,tag`

let's say booking 297710
get it as tags

    curl http://localhost:7070/bookings/297710 -H accept:application/vnd.gbm.1.tags+json > 297710.tags+json

make csv

    cat 297710.tag+json | jq --raw-output '.encodings[] | .product.ean as $ean | .tags[] | [ $ean,  . ] | @csv'

> man jq to have clues on the parts
>
> Variables
> Format strings

also see http://stackoverflow.com/questions/32960857/how-to-convert-arbirtrary-simple-json-to-csv-using-jq

csv => json
===========
MAY want array processing

    echo -e "awe\nsome" | jq -csR 'split("\n")[:-1]'
    =>
    ["awe","some"]

MAY be related https://github.com/stedolan/jq/issues/270 for background
