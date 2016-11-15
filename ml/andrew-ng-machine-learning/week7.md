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




