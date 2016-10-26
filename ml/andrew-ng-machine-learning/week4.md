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

    x₁ -+-> a₁ -+--> h0
        |       |
    x₂ -+-> a₂ -+
        |       |
    x₃ -+-> a₃ -+

> that is each xᵢ is input of aⱼ, forming effectively a network

the first layer is the input layer (L1)
the middle is the hidden layer (L2)
the final is the output layer (L3)

notations
---------

    aᵢⁿ activation of unit i in layer n (is j in lecture, but does not have j superscript)
    θⁿ  matrix of weight controlling function mapping from layer j to layer j+1

then, from above example

    a₁² = g( θ₁₀¹ x₀ + θ₁₁¹ x₁ + θ₁₂¹ x₂ + θ₁₃¹ x₃ )
    a₂² = g( θ₂₀¹ x₀ + θ₂₁¹ x₁ + θ₂₂¹ x₂ + θ₂₃¹ x₃ )
    ...
    hθ  = g( θ₁₀² x₀ + θ₁₁² x₁ + θ₂₁² x₂ )

if layer n as k nodes, and layer n+1 m nodes, then θⁿ as size (m, k+1)
