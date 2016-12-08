let's take batch gradient descent (m=400)

    Θⱼ = Θⱼ - α/m ∑( hΘ(Xⁱ) - Yⁱ)Xⁱⱼ, for j in 0:n

parallelize over many computers
===============================

map that to 4 machines

    m1 receives   1:100
    m2 receives 101:200
    ...

and each machine computes, on its slice

    ∑hΘ(Xⁱ) - Yⁱ)Xⁱⱼ

then controler combines the results...

    Θⱼ = Θⱼ - α/m( ∑result(i) ) i=1:4

then we can take down dataset that one single machine could not compute.

map reduce is a fit when we can _divide_ a dataset (independant).
this is the case for most of our learning algorithms (sum over a training set).

parallelize over cores (single computer)
========================================
this is also an option :)

and there are libraries that do parallelization,
and uses some map reduce for free on the computer.

