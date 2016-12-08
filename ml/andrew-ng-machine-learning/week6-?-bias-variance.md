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
