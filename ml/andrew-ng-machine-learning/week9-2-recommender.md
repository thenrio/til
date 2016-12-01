problem statement
=================

eg: predict movie ratings
-------------------------

let

    nᵤ : number of users
    nₘ : number of movies
    r(i,j) : if user i has rated movie m (1 or 0).
    y(i,j) : rating, if rated

> strange model?... could use an union instead of (r, y)
> unrated | 1..5
>

A user has rated a subset of all movies.
Given that, what would be its rating for a movie not rated yet?

can we add classes to movies?
-----------------------------
eg : movie1 : [romance:0.9, action: 0.3], ...

> each class, a real value in [0, 1]
>

then movie1 = x⁽¹⁾ = [1, 0.9, 0.3]

> added x₀=1
>

model is for each user j, learn a θ⁽j⁾, so that predicted rating of x⁽ⁱ⁾ is θ⁽j⁾'x⁽ⁱ⁾.

> looks like a linear regression for each user.
>

algorithm
---------
let

    m⁽j⁾ : number of movies user j has rated

we want to minimize

    1/2m⁽j⁾ ∑(θ⁽j⁾'x⁽ⁱ⁾ - y⁽i,j⁾)² for all rated i

> there should be a more compact formulation...

and we should add a regularization term

    λ/2m⁽j⁾ ∑Θₖ⁽j⁾²(k=1:n)

simplification : ditch m⁽j⁾ (this does not change the minimization objective)

    1/2 ∑(θ⁽j⁾'x⁽ⁱ⁾ - y⁽i,j⁾)² + λ/2 ∑Θₖ⁽j⁾²(k=1:n)

and we want to minimize for all users, j=1:nᵤ

    ∑ (1/2 ∑(θ⁽j⁾'x⁽ⁱ⁾ - y⁽i,j⁾)² + λ/2 ∑Θₖ⁽j⁾²)
    j=0:nᵤ, i / r(i,j)=1, k=1:n

> I pass gradient descent formula ...
>

This is called _content_ based recommendation.
We give each movie some _content_ and we estimate rating based on this content.
