debugging a learning algorithm
==============================
suppose h=predict house price is making large errors.

    J(Θ) = 1/2m (∑( hΘ(Xⁱ) - Yⁱ)² + λ∑Θⱼ²(j=1:n)) i=1:m

what to do ?

* use more training examples
* reduce number of features
* add features
* add polynomial features
* increase λ
* decrease λ

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
