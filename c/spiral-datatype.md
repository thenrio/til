awesome

http://c-faq.com/decl/spiral.anderson.html
from https://blog.golang.org/gos-declaration-syntax

Example #1: Simple declaration

                     +-------+
                     | +-+   |
                     | ^ |   |
                char *str[10];
                 ^   ^   |   |
                 |   +---+   |
                 +-----------+

Question we ask ourselves: What is str?

> str is an...

We move in a spiral clockwise direction starting with `str' and the first character we see is a `[` so, that means we have an array, so...

> str is an array 10 of...

Continue in a spiral clockwise direction, and the next thing we encounter is the `*' so, that means we have pointers, so...

> str is an array 10 of pointers to...

Continue in a spiral direction and we see the end of the line (the `;`), so keep going and we get to the type `char`, so...

> str is an array 10 of pointers to char''

We have now _visited_ every token; therefore we are done!
