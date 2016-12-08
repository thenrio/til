data for machine learning
=========================
eg : design a high performance learning system : confusable words (to, two, too, ...)

Banko an Brill tried different algorithms

* perceptron (logistic regression)
* winnow
* memory based
* naive bayes

details of the algorithm are not important, what is remarkable is that then plotted accuracy(training size)
1, 10, 100, 1000 (millions)

and all

* performed actually good given many data.
* the ones that performed best at first may be superseded when training set grows.

is large set important ?
------------------------
useful test : given x, can an expert human predict y ?

e1: for breakfast, I have __ eggs.  is it [two|too|to] ?
e2: what is the price of a 500m² house ?

a good english speaker can answer e1.
there is no house specialist that can answer e2.

large data rationale

* use a low bias algorithm (many features, neural network)
    then Jtrain will be small

* use a large traning set (this will decrease variance)
    then Jtest ~ Jtrain

