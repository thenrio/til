input

    {"date":1,"brand":"BNB","contents":[{"q":1,"product":{"ean":"A"}},{"q":1,"product":{"ean":"B"}}]}

goal is to change the q of product B to 2

    jq '(.contents[] | select(.product.ean=="B")).q = 2'

alternate, longer, with merge

    jq '. + {contents: [.contents[] | select(.product.ean=="B") |= . * {q:2}]}'

> this MAY be handy when number of change << list size.

see "Complex assignments" in the man.
(also https://stedolan.github.io/jq/manual/#Assignment)
