stochastic
==========
suppose a linear gradient descent.

    h(X) = Θ'X, with (1,n)=size(Θ)
    J(Θ) = 1/2m ∑( hθ(xⁱ) - yⁱ)², for i=1:m

cost function is

    J(Θ) = 1/2m ∑( hΘ(Xⁱ) - Yⁱ)², for i=1:m

> on the training set.

as seen before a single descent step is like so:

    Θ := Θ - α∑ (hΘ(Xⁱ) - yⁱ) Xⁱ,, for i=1:m

> recall, this is batch gradient descent.
>

let (extract)

    cost(Θ, xⁱ, yⁱ) = 1/2m (hθ(xⁱ) - yⁱ)²

then

    J = 1/m ∑cost(Θ, xⁱ, yⁱ)

stochastic approach is

1- shuffle dataset

    n = take n

2- repeat (10 times?)

    for i=1:m
      Θⱼ := Θⱼ - α∑ (hΘ(Xⁱ) - yⁱ) Xⱼⁱ,, for i=1:n

> that is not _batch_ gradient descent...
> that is, making _progress_ at each step, rather than in batch.
>

it does not get to the global minimum.
it should get _near_.
that may be good enough, on a large dataset.

mini batch
==========
batch gradient descent : use all m examples for each iteration.
stochastic gradient descent : use all 1 example for each iteration.
mini batch gradient descent : use b examples for each iteration.

b in 2:100
let b = 10, and m=1000

    for i=1:1,11,21...991(=(1:m-b+1:b)
      Θⱼ := Θⱼ - α/10∑ (hΘ(X⁽k⁾) - y⁽k⁾) Xⱼ⁽k⁾,, for j=0:n, k=i:i+b-1

what gain?
when properly _vectorized_, mini batch SHOULD perform better.
and it can be __parallelized__.

convergence
===========
recall week3

    J(Θ) = 1/m ∑cost( hΘ(Xⁱ), Yⁱ ), for i=1:m

and to make sure it was doing well, we plotted J(number of iteration) and check it was decreasing.

now we MAY do that but each N iterations (say N=1000).

> mean average, that is.
> and also minimize the cost of computing the J function.

when N raises, then each plot is averaged, curve is smoother (derivative is smaller)

it might be that N=1000 shows erratic convergence, whereas N=5000 would show a _monotonic_ trend.

when J raises, then MUST decrease the learning rate α
> does not converge to global minimum.

an option is to decrease α when iterations raises.
> this is a slippery hack, keep it constant is more general?.

