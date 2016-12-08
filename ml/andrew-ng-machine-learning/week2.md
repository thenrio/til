linear multi feature
====================
notation

    Xⁱ the ith training example (superscript)
    Xⱼ the jth feature (subscript)

then

    X = [X₀, ..., Xₙ]
    Θ = [Θ₀, ..., Θₙ]

and

    X₀ = 1

and `X'` the transpose of `X` (no superscript t in unicode and it is transpose is `'` in matlab...)
then

    h(X) = Θ'X

then the cost function

    J(Θ) = 1/2m ∑( hΘ(Xⁱ) - Yⁱ)², for i=1:m

then the descent

    Θⱼ = Θⱼ - α/m ∑( hΘ(Xⁱ) - Yⁱ)Xⁱⱼ, for j in 0:n

    dJ/dΘⱼ = 1/m ∑( hΘ(Xⁱ) - Yⁱ)Xⁱⱼ

> digraphs
>
> ∑     +Z
> Θ     H*
> α     a*

linear regression in practise
=============================

feature scaling
---------------
eg

    area : 1..2000m²
    rooms: 1..5

then gradient will be slow, idea is to have features

    -1 <= Xᵢ <= 1

> approx :)

### divide

    area  = area/2000
    rooms = rooms/5

### mean normalization
features have approximatively zero mean

    area = area - 1000 / 2000

    Xⱼ = (Xⱼ - avg(Xⱼ)) / abs(max(Xⱼ) - min(Xⱼ))

> or also
>

    Xⱼ = (Xⱼ - avg(Xⱼ)) / stddev(Xⱼ)

learning rate (α)
-----------------

* α too small, then slow convergence
* α too large, then MAY NOT decrease at each iteration, MAY NOT converge

a pragmatic approach

* plot J(Θ)k with k=number of iterations
* J(Θ) increasing with iterations => should decrease α

for α in discrete values [..., 0.001, 0.01, 0.1, 1, ...] plot J(Θ) against number of iteration (say upto 1000 by step 100???!)
then choose one

features and polynomial regression
==================================

may combine features
eg: area = l*L

polynomial hypothesis with one feature

    Price is Θ₀ + Θ₁size + Θ₂size² + Θ₃size³

Can we do a linear regression with 3 features ?

    X₁ = size
    X₂ = size²
    X₃ = size³

> feature scaling becomes important there => x1=[0...1E3]? x2=[0...1E6], x3=[0...1E9]...

may even use other functions...

    Θ₀ + Θ₁size + Θ₂√size

    X₂ = √size

> plot -> insights -> design of features (and choice) -> better model

normal equation
===============
do not iterate, just solve in one step

    J(Θ) = 1/2m ∑( hΘ(Xⁱ) - Yⁱ)², for i=1..m
    dJ/dΘⱼ = 0 for all i

given

    X : m x (n+1)
    y : m

then

    Θ = ( X'X )⁻¹ X'y

> X is the _design matrix_

m training examples, each n+1

    X = [ X¹t,
          X²t,
          ...
        ]

in octave,

    Θ = pinv(X'*X)*X'*y

> feature scaling is useless when using the normal equation

comparison
==========
gradient descent

pros

* works well when n is large (even millions of features)

cons

* choice of α (need to plot)
* many iterations

normal equation

cons

* slow if n is large (need to invert the matrix `X'X` which is N*N with N=(n+1) )

> pinv is O(N³) which is O(n³), n the number of features

rule of thumb

    n         approach
    100       normal equation
    1000      normal equation
    10000     MAY BE gradient descent
    1E6       gradient descent

finally, there are some algorithms for which the normal equation just don't apply (see later).

and the `X'X` MAY NOT be invertible :)

non invertible?
===============
pinv is ok, ???! it is not inv

causes for non invertibilty

* redundant features : linear dependency

    eg : X₁ = aX₂, X₁ area in feet, X₂ in meter and 1m=3.28feet

* too many features, not enough examples ( `m < n` )

    then delete some features or use regularization (later)
