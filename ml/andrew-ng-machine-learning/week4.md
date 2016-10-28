non linear hypothesis
=====================
may add k-polynomial combinations when number of features is small

    Θ₀ + Θ₁x₁ + Θ₂x₂ + Θ₃x₁² + Θ₄x₂² + Θ₅x₁x₂ + ...

when n increases, then this is not sustainable (around n^k/2?)

n=100, k=2 => around   5000 (n^k/2)
n=100, k=3 => around 170000

> does not remember my maths :)

eg, image recognition

  50x50 pixels, each of them have an intensity
  2500 features
  (we could *3 if using rgb instead of intensity...)

then quadratic features ~ 3M features

neural network
==============
hypothesis is "one learning algorithm"
that is, one net can learn to "see" though it used to "hear"
input is different, still, the net learns

model
=====

single node
-----------

    xᵢ i=0:n are the inputs
    there is one output hΘ=g(θ'x)

    x₀ -+
        |
    x₁ -+-> h0
        |
    x₂ -+

vocab

    x weights (parameters)
    g activation function (sigmoid)

> we bias x₀ MAY be omitted or not its value is 0...
> not sure yet, does not matter now

many nodes
----------

    x₁ -+-> a₁ -+
        |       |
    x₂ -+-> a₂ -+--> h0
        |       |
    x₃ -+-> a₃ -+

> that is each xᵢ is input of aⱼ, forming effectively a network

the first layer is the input layer (L1)
the middle is the hidden layer (L2)
the final is the output layer (L3)

notations
---------

    aᵢ⁽ⁿ⁾ activation of unit i in layer n (is j in lecture, but does not have j superscript)
    θ⁽ⁿ⁾  matrix of weight controlling function mapping from layer j to layer j+1

then, from above example

    a₁⁽²⁾ = g( θ₁₀⁽¹⁾ x₀ + θ₁₁⁽¹⁾ x₁ + θ₁₂⁽¹⁾ x₂ + θ₁₃⁽¹⁾ x₃ )
    a₂⁽²⁾ = g( θ₂₀⁽¹⁾ x₀ + θ₂₁⁽¹⁾ x₁ + θ₂₂⁽¹⁾ x₂ + θ₂₃⁽¹⁾ x₃ )
    ...
    hθ  = g( θ₁₀⁽²⁾ x₀ + θ₁₁⁽²⁾ x₁ + θ₂₁⁽²⁾ x₂ )

if layer n as k nodes, and layer n+1 m nodes, then θⁿ has size (m, k+1)

vectorized implementation
=========================
forward propagation

    x₁ -+-> a₁⁽²⁾ -+
        |          |
    x₂ -+-> a₂⁽²⁾ -+--> h0
        |          |
    x₃ -+-> a₃⁽²⁾ -+

we had

    a₁⁽²⁾ = g( θ₁₀⁽¹⁾ x₀ + θ₁₁⁽¹⁾ x₁ + θ₁₂⁽¹⁾ x₂ + θ₁₃⁽¹⁾ x₃ )

extract

    z₁⁽²⁾ = θ₁₀⁽¹⁾ x₀ + θ₁₁⁽¹⁾ x₁ + θ₁₂⁽¹⁾ x₂ + θ₁₃⁽¹⁾ x₃
    a₁⁽²⁾ = g(z₁⁽²⁾)

>
> z₁⁽²⁾ is z₁ of layer 2
>


    x = [x₀      z⁽²⁾ = [
         x₁           z⁽²⁾₁
         x₂           z⁽²⁾₂
         x₃]          z⁽²⁾₃]

and

    z⁽²⁾ = θ⁽¹⁾x
    a⁽²⁾ = g(z⁽²⁾)

> g applies element wise

and let

    a⁽¹⁾ = x

then

    a⁽ⁿ⁺¹⁾ = g( θ⁽ⁿ⁾ a⁽ⁿ⁾ )

> we add a⁽²⁾₀=1

note that

             a₁⁽²⁾ -+
                    |
             a₂⁽²⁾ -+--> h0
                    |
             a₃⁽²⁾ -+

is just logistic regression, not applied to the input x, but the _hidden_ layer 2 a⁽²⁾

so, algorithm as the opportunity to build appropriate _features_ that fit well

other architectures
-------------------

    x -> L1 -> L2 -> hθ

> L2 size may be different than L1

x is the input layer
(L1:k) are the hidden layers
final is output layer

Applications
============
logical algebra/functions
all inputs in {0, 1}

XOR (XNOR=NOT(XOR))
XNOR

    (1, 0) -> 0
    (1, 1) -> 1
    (1, 0) -> 0
    (0, 0) -> 1

AND, OR, NOT

    h = g( -30 + 20x₁ + 20x₂ ) ~ x₁ AND x₂
    h = g( -10 + 20x₁ + 20x₂ ) ~ x₁ OR x₂
    h = g( 10 - 20x₁ ) ~ NOT x₁

> made using truth table

NOT(x) AND NOT(y)
0 unless (0,0) else 1

    10 -20x -20y

putting it together : XNOR

    x   y  a1=(x AND y)  a2=(NOT(x) AND NOT(y)) h=(a1 OR a2)=(x XNOR y)
    0   0      0                  1                   1
    0   1      0                  0                   0
    1   0      0                  0                   0
    1   1      1                  0                   1

:)
