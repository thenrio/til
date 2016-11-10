debugging a learning algorithm
==============================
suppose h=predict house price is making large errors.

    J(Θ) = 1/2m (∑( hΘ(Xⁱ) - Yⁱ)² + λ∑Θⱼ²(j=1:n)) i=1:m

what to do ?
TL;DR

    +----------------------------+-----------+---------------+
    |option                      | high bias | high variance |
    +----------------------------+-----------+---------------+
    |use more training examples? |           |      X        |
    |reduce number of features   |           |      X        |
    |add features                |    X      |               |
    |add polynomial features     |    X      |               |
    |decrease λ                  |    X      |               |
    |increase λ                  |           |      X        |
    +----------------------------+-----------+---------------+

exploring all of them MAY be expensive in time.

alternate is invest in diagnostic :)
and what if we had a diagnostic?

* what is not working?
* guidance?

detect overfitting : split data set in training and test
========================================================
dataset = training set + test set

sizes : 70% in training set, 30% in test

then we can design a procedure, for a linear or regression

    compute Θ using training set
    measure J(Θ) on the test set

misclassification error

    err = 1 if (h >= 0.5 and y = 0) or (h<0.5 and y = 1)

how do we choose polynomial features?
=====================================
that is, how do we select model?

d=degree, d=1 => linear, d=2 => quadratic(x²), d=3 => cubic, ...

lets call

    θ⁽d⁾, Jtest(θ⁽d⁾)

the result and test error for degree=d
when we fit d to the test set, then we MAY as well overfit it.

so let's introduce a new set : validation set

    data = training(60%) + test(20%) + validation(20%)

validation or cross validation (cv)
so we have

    Jtrain, Jcv, Jtest

and we use cv for the model selection

    θ⁽1⁾, Jcv(θ⁽1⁾)
    θ⁽2⁾, Jcv(θ⁽2⁾)
    ...

then suppose 4 yields the lowest Jcv
we then use the test set to see if it generalizes

> d is a parameter that is fitted to validation set
>

bias or variance?
=================
bias is underfit
variance is overfit

let's take the house price prediction / size
and plot Jtrain, Jcv in function of the degree of model (polymomial).


Jtrain should decrease with d
Jcv should look like a u curve : 1 (when d is _too_ large then Jcv rises)

bias : both Jtrain and Jcv are high
variance : Jtrain is low and Jcv is high (Jcv >> Jtrain)

impact of regularization on bias, variance
==========================================
suppose d=4
and it makes variance

λ high => bias
λ ~ 0  => variance, like no regularization
good λ=> good

how can we choose λ ?

try

  λ = in [0 0.01 0.02 ...  10], compute Θ (using training set), compute Jcv

and pick the lowest Jcv

learning curve
==============
idea is for a given hypothesis (degree is the var in lecture):

* plot Jtrain(m)

> goal is to be near O(1) that is correct model
>
> otherwise will raise

* plot Jcv(m)

> should decrease with m when model is correct
> that is more examples yields better fit
>

when high bias
---------------
Jcv will not decrease with m
increase m with yield approx the same error
Jtrain will get near Jcv

getting more training examples does not help


when high variance
------------------
Jtrain will increase slowly (like log?)
Jcv will decrease also slowly so the will join at _infinite_

getting more training examples does help

> but slowly

neural network and over/under fitting
=====================================
small network : cheap in cpu but prone to under fitting
big   network : cpu expensive, prone to over fitting


> big network : how many layers (L) ? _minimize_ Jcv(L)
