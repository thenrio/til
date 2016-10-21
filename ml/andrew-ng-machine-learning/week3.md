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

this _line_ is called the _decision boundary_

### linear
suppose Θ = [ -3 1 1 ]

then -3 + x1 + x2 >= 0

      x2 = 3 - x1

is a line

### non linear


           x
       xx    x
        x  O x
        x    x
         xx

hypothesis?

    g( Θ₀ + Θ₁x₁ + Θ₂x₂ + Θ₃x₁² + Θ₄x₂² )

and Θ = [ -1 0 0 1 1 ]
circle

    x₁² + x₂² = 1

cost function
=============
how to choose parameters (fit)?

in linear regression, we had

    J(Θ) = 1/2m ∑( hΘ(Xⁱ) - Yⁱ)², for i=1..m

that is

    J(Θ) = 1/m ∑cost( hΘ(Xⁱ), Yⁱ ), for i=1..m

with

    cost( hΘ(X), Y ) = 1/2 ( hΘ(X) - Y)²

> with h(Θ) = 1/ 1 + e^-( Θ' * x ), then J is not convex
> we want a convex function, so that grandient descent can find global optimum

    cost( hΘ(X), y ) = -log( hΘ(X) ) if y=1, -log( 1-hΘ(X) ) if y=0

that is

    cost( hΘ(X), y ) = -y * log( hΘ(X) ) -( 1-y ) * log( 1-hΘ(X) )

and then

    J(Θ) = -1/m ∑yⁱ * log( hΘ(Xⁱ) ) + ( 1-yⁱ ) * log( 1-hΘ(Xⁱ) ), for i=1..m

and we want to minimize this cost function

    Θⱼ = Θⱼ - α ∑( hΘ(Xⁱ) - Yⁱ)Xⁱⱼ, for j in 0..n
    dJ/dΘⱼ = ∑( hΘ(Xⁱ) - Yⁱ)Xⁱⱼ

with

    hΘ( x ) = 1/( 1+e^-(Θ' * x ) )

vectorized implementation should look like

    Θ := Θ - α∑[ (hΘ(Xⁱ) - yⁱ) Xⁱ ]

Optimizations
=============

* conjugate gradient
* BFGS
* L BFGS

pros

* no need to pick α

in octave


    [optTheta, funtionVal, exitFlag]= fminunc(@costFunction, initialTheta, options)

with

    function [j, gradient] = costFunction(theta)
    j = J(Θ)
    gradient = [ dJ/dΘⱼ ] j=0, n

> and index start at 1 in octave :)
>

multiclass classification
=========================
tags : work, friends, family, hobby
        y=1        2        3     4


one versus rest (one versus all)
--------------------------------

    NN
    NN
           OO
           O
    XXXX


is mapped to 3 binary problems


    NN             **             **
    NN             **             **
           **             OO             **
           *              O              *
    ****           ****           XXXX

 
