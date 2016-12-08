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

neural network and over/under fitting
=====================================
small network : cheap in cpu but prone to under fitting
big   network : cpu expensive, prone to over fitting

> big network : how many layers (L) ? _minimize_ Jcv(L)

building a spam classifier ?
============================
features : words indicating spam/not spam ?
say 100 features

> in practice, take most frequently occuring n words (10k to 50k) that
> are occuring most often in training set rather than manual pick.
>

how to spend time to have lower error ?

* more data (honeypot project : fake email that receive spams then analyzed)
* add features based on routing headers
* detect mispelling

error analysis
==============
recommended approach

* simple algorithm, implement it, test on validation set.
* plot learning curve, see if more data, more features are likely to help.
* manually examine errors of model : is there a pattern in them?

eg: 100 errors on 500 in validation set.

* (i) categorize errors
* (ii) what features could have helped ?

then count

(i) 12 pharma, 4 fake, 53 are steal password, 31 other...
    then, should work on steal password!

(ii) deliberate mispelling (3) header routing (11), ...

importance of numerical evaluation
----------------------------------
should discount/discounts/discounting be treated the same way ?

if so, can use a stemming algorithm (Porter stemmer)
how to decide ?

just see how it performs on the validation set!
eg : with: error=5%, without: error=3%

> this is a method for any feature : test it on the validation set!
>

error metrics for skewed classes
================================
skewed is when one class dominates the other one in training set.
eg : cancer classification

find 1% of error on test set

but only 0.5% of patients have cancer : this is a __skewed__ class (99.5 not cancer, 0.5% cancer).

> looks related to the classification bias?
>

precision / recall
==================
y = 1 is the rare class.

> this is a convention.

                actual
                  1   0
    prediction  1 Tp  Fp
                0 Fn  Tn

> Tn : True negative, Fp False positive

precision

    of all patients we predicted 1, how many actually have cancer ?
    = Tp / #predicted positives = Tp / (Tp + Fp)

recall

    of all patients that actually have cancer, what fraction did we predicted ?
    = Tp / #actual positives = Tp / (Tp + Fn)

eg

          1  0 (actual)
       1  80 20
       0  80 820

precision=0.8
recall=0.5

high precision and high recall are desirable.

suppose a fake prediction =0, then recall=0

trading precision and recall
============================
logistic regression ( h in [0, 1] )

predict 1 if h >= 0.5, 0 otherwise.

suppose we want to predict 1 only if very confident?
then increase threshold : say 1 if h >= 0.7
then higher precision AND lower recall (more undetected=false negative).

suppose we want to avoid missing too many cases of cancer (avoid false negative).
then decrease threshold : say 1 if h >= 0.3
then lower precision AND higher recall (goal).

more generally

    predict 1 if h >= threshold

so is there a way to compute this threshold that yield the best precision/recall ?

    algorithm1 : P=0.5  R=0.4
    algorithm2 : P=0.7  R=0.1
    algorithm3 : P=0.02 R=1.0

can we use a single real value instead of two to decide?
--------------------------------------------------------

average is poor
(recall=1 is easy : just return 1:)

F score (or F₁ score)

    F = 2 pr/(p+r)

> both p and r have to be large for score to be large, not just one as in average.

so we can test different algorithm on the __validation set__ and pick up the one with yields the higher F score.

> threshold is like a parameter, decided on the validation set.

