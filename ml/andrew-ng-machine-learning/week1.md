week1
=====

model representation
--------------------

    (X⁽i⁾, Y⁽i⁾)

is ith element in training set

> i should be superscript has the parens

may be more _simply_

    (x(i), y(i))

> as if x was a vector

training set (x, y)
we name the function h (as hypothesis)

    h : x -> y

cost function
-------------

let

    h = θ₀ + θ₁x

> linear is not the only option for hypothesis :)
>

minimize cost function (square area)

    ∑(h(x(i))² - y(i)²)

> is the same with a 1/2m factor, so that we found bayes
>

gradient descent
----------------

    θj := θj - α ∂J(θ0, θ1)/∂θj, for j=0 and j=1

important property of algorithm is __simultineanous change of all parameters__

that is in say python

    while enough:
      n0 = theta0 - alpha * partial(J(thetha0, thetha1), thetha0)
      n1 = theta0 - alpha * partial(J(thetha0, thetha1), thetha0)
      thetha0 = n0
      thetha1 = n1

> we descent in all directions at the same time

enough is both partial differences are enough (0)

applied with a training set
---------------------------
we call it __batch__ gradient descent

calculus
--------
(ancient)

    d(GoF)/dx = dG/dF * dF/dx

also written as

    gof(x)' = g'of(x) . f'(x)

with o composition

    gof(x) = g( f(x) )

linear algebra review
---------------------
skipped : read is enough https://share.coursera.org/wiki/index.php/ML:Linear_Algebra_Review

let

    M = [
      a b c
      d e f
      g h i
    ]

and

    X = [
      x
      y
      z
    ]

Then

    MX = [
      ax + by + cz
      dx + ey + dz
      gx + hy + iz
    ]

general formula

    ABij = ∑Aik Bkj

also see https://en.wikipedia.org/wiki/Matrix_multiplication
