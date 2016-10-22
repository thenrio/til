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
calculus shows

    dJ/dΘⱼ = ∑( hΘ(Xⁱ) - Yⁱ)Xⁱⱼ

then

    Θⱼ = Θⱼ - α ∑( hΘ(Xⁱ) - Yⁱ)Xⁱⱼ, for j in 0..n

with

    hΘ( x ) = 1/( 1+e^-(Θ' * x ) )

vectorized implementation should look like

    Θ := Θ - α∑[ (hΘ(Xⁱ) - yⁱ) Xⁱ ]

> this is really near linear regression...
> the diff is dJlin/dΘᵢ = 1/m dJlog/dΘᵢ
>
> not really sure for the calculus of logistic regression!

Advanced optimizations
======================

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

    gradient(i) = [ dJ/dΘᵢ₋₁ ] j=1:n+1

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

overfitting
============

underfitting => the training set has error (high bias)
overfitting => fit training set very well, but any new example has high error (high variance)

options
-------

O1- reduce number of features

* manually
* model selection algorithm (later)

O2- regularization

intuition for regularization
============================

    y ^          x
      |    x
      |  x
      |
      | x
      +------------->
                    x

    Θ₀ + Θ₁x + Θ₂x² + Θ₃x³ + Θ₄x⁴

try to have Θ₃ Θ₄ near zeros (small contributions)

    J(Θ) = 1/2m (∑( hΘ(Xⁱ) - Yⁱ)² + λ∑Θⱼ²(j=1:n)) i=1:m

λ is regularization parameter

regularization for linear regression
====================================

    Θⱼ = Θⱼ( 1-αλ/m) - α/m ∑( hΘ(Xⁱ) - Yⁱ)Xⁱⱼ, for j in 1..n

normal equation and regularization
==================================

    Θ = ( X'X )⁻¹ X'y

it is the analytical equation, that minimize the cost function J
now, regularization changes J

    Θ = ( X'X + λA )⁻¹ X'y

with

    A [ 0
          1
            1
              1 ]

    A is identity (n+1) except A(1,1)=0

non invertibility ?
-------------------
suppose `m<n` (more features than examples)
then, `X'X` is not invertible

but `X'X + λA` is, for `λ>0`

regularization for logistic regression
======================================

    J(Θ) = -1/m ∑yⁱ * log( hΘ(xⁱ) ) + ( 1-yⁱ ) * log( 1-hΘ(xⁱ) ) + λ/2m∑Θⱼ², i=1:m, j=1:n

and the partial derivative

    dJ/dΘ₀ =  1/m ∑( hΘ(xⁱ) - yⁱ)xⁱ₀
    dJ/dΘⱼ =  1/m ∑( hΘ(xⁱ) - yⁱ)xⁱⱼ + λ/m Θⱼ
