recall week6

    it's not who have the best algorithm who wins,
    it's who have the biggest data.

because variance goes down when m raises.

let's take linear/logistic regression
a single step is (vectorized)

    Θ := Θ - α∑ (hΘ(Xⁱ) - yⁱ) Xⁱ, i=1:m

with

    m=1E8

this make a lot of sum...

can we use m=1E3 ?
usual method is as described in week6
plot learning curve

    Jtrain
    Jval

when Jtrain `<<` Jval at 10 and Jtrain ~ Jval at 1E3, then it high bias
invest in larger training set will not help.
