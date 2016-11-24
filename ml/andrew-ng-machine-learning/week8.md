unsupervised learning : clustering
==================================
In supervised learning, we have a training set {X, y}.
In unsupervised learning we have no labels {X}.

> label mostly apply to classification problem.
>

Then we want to find clusters (ie: sets of neighbours) in the training set.

k means algorithm
=================
By far the most popular one.

Input

* k number of clusters
* {X}

Initialize random centers μᵢ i=1:k
Then iterate

* for each node, associate to nearest center.
  let c⁽ⁱ⁾, the index of center that is nearer

        c⁽ⁱ⁾ = k / ||μₖ - X⁽ⁱ⁾||² = min( ||μⱼ - X⁽ⁱ⁾||² )

* move each center to barycenter of its set.

        μₖ = 1/mₖ( ∑X⁽ⁱ⁾ ) for all i where c⁽ⁱ⁾ = k

    where mₖ is the numbers of X attached to

> when no points in μₖ, we eliminate the value (k-1 clusters then).

k means for non separated dataset
=================================
suppose you have to find sizes S, M, L of (size, weight)?
it is ok

optimization objective
======================

    c⁽ⁱ⁾ : index of cluster in which X⁽ⁱ⁾ is currently assigned (c⁽ⁱ⁾ in 1:K)
    μₖ : centroid of cluster k
    when k=c⁽ⁱ⁾, then μₖ is the centroid of cluster to which X⁽ⁱ⁾ is currently assigned

objective is

    J( c⁽ⁱ⁾, μₖ ) = 1/m ∑ ||X⁽ⁱ⁾ - μ(c⁽ⁱ⁾)||²

> note: can not subscript c⁽ⁱ⁾ yet in μ...
>

J is also called distortion function.
The algorithm above does that.

  first is minimize J( c )  (μ fixed)
  second is minimize J( μ ) (c fixed)

random initialization
=====================
should have

    K < m

set μᵢ to random values in X.
still MAY converge to local optima...

eg: there are clusters that captures only a few (even 1) element.

to minimize that, we can run MANY random initialization and pick the run that give the lowest J.

    for i=1:100
      random initialize μ
      compute k means
      compute J

choosing number of cluster?
===========================

elbow method

    plot J(K), K=1:h

     \
      \
       \
        \
         .
          -
          ' - -- - -

          ^
          | pick this one


> not that reliable
>

evaluate k means clusters based on a later purpose (ie make 3 sizes or 5 sizes ? how well do/would they sell?)

dimensionality reduction
========================
(also named data compression)

fair goal
---------
remove redundant feature

    x1 : size in inches
    x2 : size in cm

another approach is to project x on a set of fewer dimension

eg: project 3d to a plane, ...

    x⁽ⁱ⁾ -> z⁽ⁱ⁾
    with x=[x₁, x₂, x₃], z=[z₁, z₂]

side effects?
-------------
outcomes are

* memory space
* lead time for learning algorithm

data visualization
------------------
is also helped!

example: visualize a country
initial model has size 50 (this is n).
we can not visualize n=50.
and what if we project x(n=50) to z(m=2)

> z are axis for projection

eg: z1 = GDP (~PIB in french)
    z2 = GDP / habitant

PCA (principal component analysis)
==================================
example of a 2d, we want to reduce to 1d

             x
           xx
       x
          x
     x

we can fit a line (1d) that minimizes distance against all x.
this is what PCA does.

> it also maximize dispersion.

formulation is as : reduce a n dimension problem (set I) to a k dimension problem (set R).
find k vectors uₗ in E that minimizes the error projection on the linear subspace spanned by those vectors.

PCA is not linear regression.
in linear regression, we want to minimize the distance to y (the goal).
here, we minimize the distance of all x to _plane_ u.

algorithm
---------
before, we do feature scaling (mean normalization)

> this comparable to what we did in linear regression.
> at the end, every feature as 0 mean.

and hopefuly, this is a _solved_ problem :)
maths beyond are skipped...

    sigma = 1/m ∑x⁽ⁱ⁾x⁽ⁱ⁾'

> this is the covariance matrix
> when examples are in row X=[x⁽¹⁾; x⁽²⁾; ...] then sigma=1/m X'X
> sigma has size n*n where n is the number of features.

then

    [ U, S, D ] = svd( sigma )

> eigenvectors, singular value decomposition
> eig is an alternate function in octave too

and

    Uᵣ = U(:, 1:k)

> that is uₗ is U(:, l)
> U is n*n
> Uᵣ is n*k, r means _reduce_

then

    z⁽ⁱ⁾ = Uᵣ' x⁽ⁱ⁾

> z⁽ⁱ⁾ has k dimension (or kx1).

also note that we do not apply the x₀=1.

reconstruction from compressed representation
---------------------------------------------
we had

    z⁽ⁱ⁾ = Uᵣ' x⁽ⁱ⁾

then we COULD do

    xapprox⁽ⁱ⁾ = Uᵣ * z⁽ⁱ⁾

> this is an approximation...
>

choosing k
==========
average projection error

    e = 1/m ∑ ||x⁽ⁱ⁾ - xapprox⁽ⁱ⁾||², i=1:m

variation

    v = 1/m ∑ ||x⁽ⁱ⁾||², i=1:m

typically, we choose k to be the _smallest_ value so that

    e/v <= 0.01

> that is e is 1% of v
> aka: we keep 99% variance.

the upper bound can be adapted : 0.1, 0.05, ...

maths to the rescue

    e/v = 1 - ∑Sⱼⱼ / ∑Sᵢᵢ, j=1:k, i=1:m

where S is the matrix of svd...

    [ U, S, D ] = svd( sigma )

which can be rephrased as

    ∑Sⱼⱼ / ∑Sᵢᵢ >= 0.99

> this rocks! we need to run PCA only once!

advice
======

supervised learning speedup
---------------------------
suppose x has dim 10,000

start from x (i=1:m)
reduce to z (i=1:m) with PCA

> pray for size(z) ~ 1,000 (that is a huge improvement)

PCA should be applied ONLY to the training set.

goals
-----
compression
  reduce memory usage
  reduce lead time

visualization (2d or 3d)

dont
----

### overfit : do not use PCA to reduce the number of features.
use regularization instead

> thinking about it : PCA does not use y ... it does not reduce the distance to value.
>

### premature use
use real data before reduce using PCA.
only use PCA if it doesn't work.
