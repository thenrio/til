neural network : cost function
==============================
let

    L   : number of layer
    sₗ  : number of unit in layer l (not counting bias unit)

we consider either

binary (K=1)

    y in {0, 1}

multi class (K >= 3)

    y is a vector [b]ₖ where b in {0, 1}, and there is only one 1

we had, in logistic regression

    J(Θ) = -1/m ∑yⁱ * log( hΘ(xⁱ) ) + ( 1-yⁱ ) * log( 1-hΘ(xⁱ) ) + λ/2m∑Θⱼ², i=1:m, j=1:n

neural network

    hΘ(x) has size K, hΘ(x)ᵢ is the ith output

    J(Θ) = -1/m ∑ᵢ∑ₖyⁱₖ * log( hΘ(xⁱ)ₖ ) + ( 1-yⁱₖ ) * log( 1-hΘ(xⁱ)ₖ ) + regularization
    i=1:m
    k=1:K

and regularization term

    λ/2m∑ₗ∑ᵢ∑ⱼ(Θⱼᵢ⁽l⁾)²
    j=1:sₗ₊₁
    i=1:sₗ
    l=1:L-1

back propagation algorithm
==========================
so we need to compute

    J(Θ)
    dJ(Θ)/dΘᵢⱼₗ

> l is put downscript there is superscript in course

forward propagation is
suppose 1 training example (x, y)

    a⁽¹⁾ = x
    z⁽²⁾ = Θ⁽¹⁾a⁽¹⁾
    a⁽²⁾ = g(z⁽²⁾) (with added bias unit a₀²)
    ...
    a⁽³⁾ = hΘ(x) = g(z⁽⁴⁾)

intuition δⱼₗ is error of unit/node j in layer l

    L=4
    δⱼ⁽⁴⁾ = aⱼ⁽⁴⁾ - yⱼ

and vectorized

    δ⁽⁴⁾ = a⁽⁴⁾ - y
    δ⁽³⁾ = (Θ⁽³⁾)'δ⁽⁴⁾ .* g'(z⁽³⁾)

where g'(z⁽³⁾) is the derivative dg/dz evaluated at z⁽³⁾

    g'(z⁽³⁾) = a⁽³⁾ .* (1 -a⁽³⁾)

and there is no δ⁽¹⁾, because we do not derivate input layer
and we _can prove_ that (__without the regularization term__)

    dJ(Θ)/dΘᵢⱼₗ = aⱼ⁽l⁾ δᵢ⁽l+1⁾

so we can implement something like
start Δ⁽l⁾ is zero

for i = 1:m (training set) do

    set a⁽¹⁾=x⁽ⁱ⁾
    compute a⁽l⁾ for l=2:L using forward progapation
    δ⁽L⁾=a⁽L⁾-y⁽ⁱ⁾
    compute δ⁽l⁾ for l=L-1:2

    Δᵢⱼ⁽l⁾ = Δᵢⱼ⁽l⁾ + aⱼδᵢ⁽l+1⁾

> this is not the same i as the outer one ...

then 

    Dᵢⱼ⁽l⁾ = 1/m Δᵢⱼ⁽l⁾ + λΘᵢⱼ⁽l⁾ if j > 0
    Dᵢⱼ⁽l⁾ = 1/m Δᵢⱼ⁽l⁾ otherwise

these are the derivatives we look for!

backpropagation intuition
=========================

forward propagation

    δⱼ⁽l⁾ error of cost of unit j in layer l aⱼ⁽l⁾

> l SHOULD be superscript...

    δⱼ⁽l⁾ = d(cost(i))/dzⱼ⁽l⁾
    cost(i) = yⁱ * log( hΘ(xⁱ) ) + ( 1-yⁱ ) * log( 1-hΘ(xⁱ) )

backward does approx the same...

implementation detail : unrolling parameters
============================================
previously, using fminunc

    [J, gradient]=costFunction
    theta = fminunc(@costFunction, initialTheta, options)

theta, gradient had size: n+1

now, with neural network, say L=4

    theta1, theta2, theta3  : matrixes
    D1,     D2,     D3      : matrixes

> theta1 is (i, s₁) ...

can we _unroll_ these matrixes as vectors?

eg:

    L=3
    s1=10, s2=10, s3=1

    theta1, D1 : (10, 11)
    theta2, D2 : (10, 11)
    theta3, D3 : ( 1, 11)

we can unroll them in octave like so

    theta = [ theta1(:); theta2(:); theta3(:) ]

reverse is

    theta1 = reshape(theta(  1:110), 10, 11)
    theta1 = reshape(theta(111:220), 10, 11)
    theta3 = reshape(theta(221:231),  1, 11)

so basic idea is to _unroll_ all matrixes (say all edges) theta1:3 in a theta vector,
and use fminunc
.

with a costfunction that has same dimensions

    [J, gradient] = costFunction( theta )

    // forward
    theta1, theta2, theta3 = theta // ununroll=reshape each layer
    compute D1, D2, D3
    compute J
    gradient=[ D1, D2, D3 ]

gradient check
==============
algorithms MAY have implementation error and then show high error.
how do we check it?

basic idea is using limit definition

    dJΘ/dΘ = (J(Θ+ε) - J(Θ-ε)) / 2*ε

so for instance

    dJΘ/dΘ₁ = (J(Θ₁+ε, Θ₂, ...) - J(Θ₁-ε, Θ₂, ...)) / 2*ε
    dJΘ/dΘ₂= (J(Θ₁, Θ₂+ε, ...) - J(Θ₁, Θ₂-ε, ...)) / 2*ε

and we can want to check in costFunction

    gradapprox ~ gradient

how to SEE that, not sure yet :)

> this is a development check
> disable this in production/submit or SLOOOOW
>

random initialization
=====================

    theta = fminunc(@cost, initialTheta, options)

same value?

    initialTheta = zeros(n, 1)

does not _work_ against a neural network

    +1 -+      +1 -+
        |          |
    x₁ -+-> a₁⁽²⁾ -+--> h0
        |          |
    x₂ -+-> a₂⁽²⁾ -+

because then all hedges of layer 1 are 0

then  a₁⁽²⁾= a₂⁽²⁾
and   δ₁⁽²⁾= δ₂⁽²⁾

then after 1 iteration, we still have theta all same value...

random initilization breaks symmetry

    each Θᵢⱼ⁽l⁾ in [-ε, +ε]

    theta1 = rand(10, 11) * 2ε -ε
    theta2 = rand( 1, 11) * 2ε -ε

all together
============
pick/choose an architecture
---------------------------

L=3, s=[3, 5, 4]
L=4, s=[3, 5, 5, 4]

number of input units = numbers of features (dimension of x⁽ⁱ⁾)
number of output units = number of classes

reasonable default : 1 hidden, or if >1, all same size usually, the most the better (number of unit in a (hidden) layer)

train
-----

1- random initial weights
2- implement forward propagation to have hΘ(x) for x in training set
3- implement cost function J
4- implement backward progagation to have derivative D

    > for 1:m on training set is ok for a first implementation
    get activation a⁽l⁾ and δ⁽l⁾ for l=2:L

5- use gradient check
  then disable gradient check

6- use gradient descent or optimized function

> J(Θ) is non convex
>
