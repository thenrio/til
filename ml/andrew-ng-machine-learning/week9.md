anomaly detection
=================
suppose we have x₁, x₂ vibration and heat of an aircraft engine.
we have existing measures.

    x⁽ⁱ⁾, i=1:m

plotted as x


    ^     x
    |     x  x x
    |    x  xxx
    |    xx x
    |    xxx x
    |     x x
    |             o
    +-------------->

and that another one is measured (`o`)
o looks like an anomaly.

model p(x) using data (training set).
identify anomaly as

    p(x) < ε

applications are

* fraud detection (typing speed, ...)
* computer monitoring (features=[load, free, ...])

gaussian distribution
---------------------
normal distribution N(μ, σ²)

> μ=mean
> σ=standard deviation, σ²=variance

is

    p(x) = 1/(√2Π . σ) e^(-(x-μ)²/σ²)

parameter estimation
--------------------

    μ = 1/m ∑x⁽ⁱ⁾
    σ²= 1/m ∑(x⁽ⁱ⁾-μ)²

algorithm
---------
let

    p(x) = Π p(xᵢ; μᵢ, σ²ᵢ)
    (Π is product)

> this is true if all features are independant.
>
> when they are not, algorithm runs fine (!???!)

S1- choose features that are indicative of anomaly (n)

S2- fit parameters, μᵢ, σ²ᵢ, i=1:n

S3- given a new example, is it an _anomaly_ if

    p(x) < ε
    p(x) = Π 1/(√2Π . σᵢ) e^(-(xᵢ-μᵢ)²/σᵢ²), i=1:n

building an anomaly detection system
====================================
suppose we have some labeled data : 0=normal, 1=anomalous.
and normal >> anomalous (skewed)
then split data in

    training set : normal
    validation set : both
    test set : both

> this may depend on the proportion (bias) of anomalous.
> not sure there :)
>

eg:

    10000 good aircraft engine
       20 bad aircraft engine

applied is

    training : 6000
    validation : 2000 + 10 bad
    test : 2000 + 10 bad

> the proportion for good in training, validation, test is the same as in week6 (60, 20, 20).
> the bad are splitted in validation and test.
model is


    y=1 if p(x) < ε
    y=0 if p(x) >= ε (normal)

can use validation set to choose ε
