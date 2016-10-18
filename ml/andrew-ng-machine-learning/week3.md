classification, aka logistic regresssion
========================================
binary class  : value is 1 or 0 (spam, begnin, ...)
multi class   : value is in discrete set

can we use linear regression ?
------------------------------

eg

    h (tumor -> size) -> begnin/malign

plot may show : may be malign after a threshold size


    malign=1 ^           X  XX XX            X
             |
             |
             |
    begnin=0 +- XX X  X ----------> size

if `y > 0.5` then malign, else not??!
but the data to the left flatten the steep, making errors with `left( maligns )`

properties of logistic regression
---------------------------------

(I) `0 <= h(Θ) <= 1`

and rather than linear

    h(Θ) = Θ' * x

we want

    h(Θ) = g( Θ' * x )

with

    g( z ) = 1/( 1+e^-z )

> sigmoid, or logistic function

g is continuous, monotonic,

    lim( g, z->-∞ ) = 0
               g(0) = 0.5
    lim( g, z->+∞ ) = 1

interpretation
--------------
`h(Θ)` is the probability for `y=1`
so value of 0.7, is 70% chance of being `y` (malignant, ...)

    h(Θ) = P( y=1 | x; Θ )

> conditional probability of y=1, given x; parameterized by Θ

and we have 

    P( y=1 | x; Θ ) + P( y=0 | x; Θ ) = 1

decision boundary
-----------------
can we predict y = 1 when h(Θ) >= 0.5?
that is

    Θ' * x >= 0


