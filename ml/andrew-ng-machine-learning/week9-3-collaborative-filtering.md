and what if we do not have a [romance, action] features measures?
the goal is to learn the features.

suppose we have rating for movie X⁽ⁱ⁾,
and we have no idea of the value of the features for each movie.

BUT users tells us how they rate [romance, action]
eg

Alice (1) rates Θ⁽¹⁾=[0 5 0] (Θ₀⁽¹⁾=0 is the bias).
Bob (2) is [0 5 0]
Carol (3) rates [0 0 5]
Dave (4) is [0 0 5]

If we have such general rating for features, then we can infer the feature for each movie, given the rating of each movie.
eg

film X(1) : 5 5 0 0 => should be [0 1 0] (that is [romantic, action] with the added biais).

the constraints are:

    Θ⁽¹⁾'x1 = 5 (Alice)
    Θ⁽²⁾'x1 = 5 (Bob)
    ...

Optimization algorithm
======================
Given Θ⁽ⁱ⁾ i=1:nᵤ, learn x⁽ⁱ⁾.

min

    1/2 ∑(Θ⁽ⁱ⁾'x⁽ⁱ⁾ -y⁽i,j⁾)² + λ/2 ∑xₖ⁽ⁱ⁾²
    j / r(i,j)=1, k=1:n

Then to learn x⁽ⁱ⁾, i=1:nₘ, we just sum over all i.

    ∑ (1/2 ∑(Θ⁽ⁱ⁾'x⁽ⁱ⁾ -y⁽i,j⁾)² + λ/2 ∑xₖ⁽ⁱ⁾²)
    i=1:nₘ, j / r(i,j)=1, k=1:n

So we can do a _recursive_ thing like

    Θ -> x -> Θ -> x ...

With initial Θ just a guess.

> collaborative, because there are users :)
>

do it : put two sides together
==============================
Given x⁽ⁱ⁾, i=1:nₘ, estimate Θ⁽ⁱ⁾ i=1:nᵤ

    J(Θ) = ∑ (1/2 ∑(θ⁽j⁾'x⁽ⁱ⁾ - y⁽ⁱ⁾)² + λ/2 ∑Θₖ⁽j⁾²)
           j=1:nᵤ, i / r(i,j)=1, k=1:n

> see week9-2-recommender.md

Given Θ⁽ⁱ⁾ i=1:nᵤ, estimage x⁽ⁱ⁾

    J(x) = ∑ (1/2 ∑(Θ⁽ⁱ⁾'x⁽ⁱ⁾ -y⁽i,j⁾)² + λ/2 ∑xₖ⁽ⁱ⁾²)
           i=1:nₘ, j / r(i,j)=1, k=1:n

> see above

Then we can design a new cost function for both


    J(x, θ) = 1/2 ∑∑(Θ⁽ⁱ⁾'x⁽ⁱ⁾ -y⁽i,j⁾)² + λ/2 ∑∑xₖ⁽ⁱ⁾² + λ/2 ∑∑Θₖ⁽j⁾²
        (i,j) / r(i,j)=1             i=1:nₘ, k=1:n  j=1:nᵤ, k=1,n

> this a global approach rather than a list of (optimize Θ given x, then optimize x given θ, ...)
> that is, a derivative with all vars at once.
>

and a few conventions, adaptation:

* we ditch x₀=1 : x has size n
* we ditch Θ₀=1

then the steps of algorithm are:

1- initialize x, θ to small random values.
2- minimize J(x, θ), with gradient descent or advanced algorithm.

vectorization
=============
Group all ratings of all movies in Y

let

    nₘ=5
    nᵤ=4

and

    Y= [5 5 0 0
        5 ? ? 0
        ? 4 0 ?
        0 0 5 4
        0 0 5 0]

and the matrix of predicted ratings


    P= X Θ'

with

    X = [ x⁽¹⁾'
          x⁽²⁾'
          ...
        ]
    for i=1:nₘ

And so is Θ, for j=nᵤ

This is called _low rank matrix factorization_
.

Finding related products
========================
for each product, we learn features x.
(replace product by movie to fit in above context and example).

> features require user input...
>
> that is we give a list of features (global), and ask for their marks.
>

so, how to find movie j related to movie i?

    minimize ||x⁽i⁾ - x⁽j⁾||

Implementation details
======================
And what about user 5 (Eve) that have not rated any movies?

Then

    J(x, θ) = 1/2 ∑∑(Θ⁽ⁱ⁾'x⁽ⁱ⁾ -y⁽i,j⁾)² + λ/2 ∑∑xₖ⁽ⁱ⁾² + λ/2 ∑∑Θₖ⁽j⁾²

Becomes for Eve

    J(x, θ) = λ/2 ∑∑xₖ⁽ⁱ⁾² + λ/2 ∑∑Θₖ⁽j⁾²

And minimize second term is Θ(5, :)=zeros(nᵤ)
That is not helpful a contribution...

Mean normalization of Y

    Y=Y-mean(Y)

> and unrated (?) stays unrated.

Then for user j on movie i, predict

    Θ⁽j⁾' x⁽ⁱ⁾ + μ⁽ⁱ⁾

where 

    μ⁽ⁱ⁾=mean(Y(i, :))

That is user Eve as no 0 rating but an average rating (say 2.5).
