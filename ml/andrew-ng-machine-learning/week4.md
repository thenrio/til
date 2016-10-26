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
