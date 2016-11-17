support vector machines!
========================

objectives
==========
logistic regression

when y=1, then we want h ~ 1, that is z >> 0 (z = Θ'x)

then cost function

	-(yⁱ * log( hΘ(xⁱ) ) + ( 1-yⁱ ) * log( 1-hΘ(xⁱ) ))

for such a y becomes

	-yⁱ * log( hΘ(xⁱ) )

so let's draw

		log(h(x)) = log( 1/(1+e^(-z))	

it is like with lines

			cost1(z)
			 ^
		2.7| \
		   |  \
		   | 	 \
		   | 	  \
		   |   	 '______
       +------------->
						 1

> the underscore is near 0

and similarly, when y=0, then we have

     cost0(z)
			          2.7
              /
             /
            /
			-----/
          -1

so let's use that instead

    J(Θ) = -1/m(∑yⁱ * cost1(xⁱ) + ( 1-yⁱ ) * cost0(xⁱ)) + λ/2m ∑Θⱼ², i=1:m, j=1:n

and find the min and multiply by m/λ

    J(Θ) = C(∑yⁱ * cost1(xⁱ) + ( 1-yⁱ ) * cost0(xⁱ)) + 1/2 ∑Θⱼ², i=1:m, j=1:n

with C=-1/λ
also written as

    J=CA + B

> looks like there is a - missing in course :)

and hypothesis is simpler

    h=1 if z>=0, else 0

large margin classifier
=======================
if y=1, we want z>=1 (not just 0)
if y=0, we want `z<=-1` (not just `<=0`)


so z should sit in ]-inf, -1] U [1, +inf[, whatever y value.

svm want to increase (maximize) the margin between positives and negatives boundaries.


            \o
         \   o o
        x x   \
          x\   \

maths
=====
vector inner product u=(uᵢ), v=(vᵢ) i=1:2

  || u || = √sum(uᵢ²) = √ u'u

let

    p the the orthogonal projection of v on u

then

    u'v = vu' = p ||u||

then let n=2 and Θ₀=0
and suppose C is large, then minimizing J is the same as minimizing regularization term (B)
which is

    1/2 Θ'Θ = 1/2 ||Θ||

decision boundary

    Θ'x >=  1 => y=1
    Θ'x <= -1 => y=0

is the same as

    p ||Θ|| >=  1 => y=1
    p ||Θ|| <= -1 => y=1

where p is the orthogonal projection of x on θ
if we set boundary near to actual X, then p is small, so we need large ||Θ|| for | p.||Θ|| | > 1
so this conflict with ||Θ|| is small (minimize J).

kernels
=======
suppose a distribution like this

      OOOO     OOOOO
    O  X   OOOO    O
    O  XX XX  XX    O
    O  X X  XXXX    O
      OO     XX     O
         O  O OO OOO

with two features

    (x1, x2) -> y
    y = 1 if z=(Θ₀ + Θ₁x₁ + Θ₂x₂ + Θ₃x₁x₂ + ... Θ₅x₂²) >= 0; 0 otherwise

let

    z=ΣΘᵢfᵢ

we have

    f₁=x₁
    f₃=x₁x₂
    ...

is there a way to define all these features f?

Given x, _choose_ (???!) 3 proximity landmarks l⁽¹⁾, l⁽²⁾, l⁽³⁾

f1, similarity( x, l⁽¹⁾)

    = e^( - ||x - l⁽¹⁾||²/2σ² )

the similarity function is called a kernel function (or k).
here, the one we used is a gaussian kernel.


> ||x - l⁽¹⁾|| = Σ(xᵢ-l⁽¹⁾ᵢ)², i=1:2
> there is no x₀
>

understand the _shape_ of k

if x ~ l⁽¹⁾, then k ~ 1
otherwise, k ~ 0

when we plat k, when σ=1, then we have a perfect gaussian.
when σ increase, then hill is larger
when σ decreases, then we approach dirac

> amplitude does not change : max is 1
>

then suppose we have

    Θ=[0.5 1 1 0]

then what is near l⁽¹⁾ and l⁽²⁾ are positives (z>=0)
otherwise is negative

so when we have a positive example, as a landmark, we can draw a near region that is
also positive, and then fit complex functions.

> looks like attractor.
>

choosing the landmarks
======================
landmarks are just x...

    l⁽i⁾ = x⁽i⁾ i=1:m

then the feature vector

    f⁽i⁾ⱼ =  similarity( x⁽i⁾, l⁽j⁾ )
          =  similarity( x⁽i⁾, x⁽j⁾ )
          i=0:m

> aaaaand f⁽0⁾ = 1

hypothesis is: Given x, compute features f (size=m+1)
predict is y=1 when Θ'f >= 0, 0 otherwise.

training is

    min J(Θ)
    J(Θ) = C(∑yⁱ * cost1(xⁱ) + ( 1-yⁱ ) * cost0(xⁱ)) + 1/2 ∑Θⱼ², i=1:m, j=1:n

and we have n=m

implementation details : regularization
=======================================

    ∑Θⱼ² = Θ'Θ  (with θ₀=0)

and we often do

    Θ'MΘ

where M enables better scaling to large feature set (???!).

svm and kernels do well
logistic regression and kernels do not, in practice is slow.

implementation details : parameters
===================================
C = 1/λ

    large C => high variance (like λ=0)
    low   C => high bias

σ²

    f = e^( - ||x - l⁽¹⁾||²/2σ² )

then

    large : high bias (low variance) (see above, f vary smoothly, then we have large error)
    small : low bias (high variance)

SVM?
====
recommends use a lib :)
most of all require you to choose

* C
* the similarity function (kernel)

choice of kernel
----------------
no kernel is linear kernel : θ'f = θ'x
MAY BE appropriate when n >> m


gaussian?
> then have to choose σ...

appropriate for n small and/or m large

> MAY have to scale features BEFORE (depends on lib...)
> it is important, because k=exp^-( ||x-l||²/2 )
>
> if one feature is 1000 and other is 1, then similarity is _flawed_
>

kernel need to verify "Mercer theorem".
(also see https://en.wikipedia.org/wiki/Support_vector_machine which has a link on Mercer and kernel trick).

there are many _of the shelf_ kernels

* polymomials

    (x'l)²
    (x'l)³
    (x'l + 1)³

* string kernels (???! distance between two strings :), ...

parameters of algorithm SHOULD BE determined using the __validation__ set
> should be highlighted at least once, or twice

multiclass
----------
most SVM have support
otherwise, use one versus all (git grep)

    y has size K
    train K svm, which distinguish class i from all other
    Θ⁽1⁾ (y=1) is class 1 over the rest, Θ⁽2⁾ ~ y=2, ...


logistic regression or svm?
===========================

                logistic      svm               try add features
    n >> m        X           linear k

    n small                   gaussian k
    m medium


    n small       ?             ?                     ?
    m large

small :  1000
medium:  10 * small (10k)

> neural network is likely to work as well but MAY BE slower to train.
>
