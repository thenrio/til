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

### is accuracy a good way to measure performance?
no because of skewed classes (good >> bad).

### possible evaluation metric

* F1 score (recommended: maximize F1 score on the validation set)
* precision, recall

anomaly detection versus supervised learning?
=============================================
which one to pick ?

      anomaly                 |   supervised
      ------------------------+----------------------------------------
      very few positive       |   large number of positive and negative.
      (0-20 is common)        |
                              |
      large negative          |   Enough positive to learn what it look like.
                              |   Future positive should look the same.
      many different types    |
      of anomaly.             |
      hard for an algorithm   |
      to learn from positive  |
      example what they might |
      look like.`             |
      them...                 |
                              |
      future anomaly may not  |
      look like the previous  |

eg:

* anomaly: fraud, manufacturing (low rate of error), monitoring of machines...
* supervised: spam, weather prediction, cancer classification...

> it is possible to switch from anomaly to supervised once there is enough positive examples...

choosing features to use
========================
plot each feature : is it gaussian?

> hist function does that in octave.

non gaussian features
---------------------
if not then maybe a log will bring it to that distribution?

     x
    xxx
    xxxx
      x x
        xxxx
          x xxx
              xxx

or square, 1/5, or ...

error analysis
--------------
we want

    p large for normal (y=0)
    p small for anomaly (y=1)

what we might get is : comparable (say large for both)...
then may introduce a __new feature__ so that we find different values

> either large or small, it will appear as an anomaly
> this is an important property of the algorithm
> try to push anomaly out of the gaussian shape

eg: computer monitoring
choose features that may take large or small values on anomaly

* memory use
* io (disk, network, ...)
* load
* network usage

for instance x5=load/network, x6=load²/network, ...

multi gaussian distribution
===========================
let x₁ cpu load, x₂ mem use
and measures like

      x₂
      ^
      |
      |   o     x
      |       x xx
      |     x x
      |    xxx
      |   xx
      |
      +--------------> x₁

the o is quite far from x region, and still, MAY be selected as ok.
this is because algorithm beams like circle (or disc).
each variable is independant.

let's take a different model: xᵢ are not modeled separately (ie: not independant).

    p(x; μ, σ²) = 1/(2π^(n/2) |E|^1/2) . exp( -1/2 (X-μ)' E⁻¹ (X-μ) )

with

    E covariance matrix of X
    |E| is determinant of E

eg:

    μ=[0 0]

    E=[1 0
       0 1]

then p(x) should radiate in circle (contour).

      E=[0.6  0
         0    0.6]

still, radiates in circle, sharper (less flat).

and

      E=[1    0.8
         0.8  1]

Then it looks like an ellipsis with axis (0,0) (1,1) (raising).
(negative should relood at course to be sure :)

algorithm
=========
let's recap

    x has dim n (n features)
    μ has dim n
    E has dim n n

Given a training set of size m (x⁽ⁱ⁾)
Then

    μ = 1/m ∑x⁽ⁱ⁾ i=1:m
    E = 1/m ∑(x⁽ⁱ⁾-μ)(x⁽ⁱ⁾-μ)'

> that was not so complicated :)
>

steps are

S1- fit model on the training set using formula above.

S2- Given a new example, flag anomaly if

    p(x) < ε

relation with original model?
-----------------------------
original and multivariate distribution are the same when E is diagonal.
(that is no correlation).

    E = [σ₁²
           σ₂²
             .
               .]

comparison
----------
original

* requires to manually create news features out of existing ones to capture anomalies (x₃=x₂/x₁).
    > that is combine, correlate features.

* is cpu cheap.

* scales to high n

multivariate

* adjusts correlation.
* cpu more expensive.
* does not scale to high n (matrix inversion).
* MUST have m > n or E is not invertible (in practice, use if m > 10n).
    > when not invertible, check size, check features are not redundant (same as normal equation).
