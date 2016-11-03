neural network : cost function
==============================
let

    L   : number of layer
    sₗ  : number of unit in layer l (not counting bias unit)

we consider either

binary (K=1)

    y in {0, 1}

multi class (K >= 3)

    y is a vector [b]ₖ where b in {0, 1}, and there is only one 1

we had, in logistic regression

    J(Θ) = -1/m ∑yⁱ * log( hΘ(xⁱ) ) + ( 1-yⁱ ) * log( 1-hΘ(xⁱ) ) + λ/2m∑Θⱼ², i=1:m, j=1:n

neural network

    hΘ(x) has size K, hΘ(x)ᵢ is the ith output

    J(Θ) = -1/m ∑ᵢ∑ₖyⁱₖ * log( hΘ(xⁱ)ₖ ) + ( 1-yⁱₖ ) * log( 1-hΘ(xⁱ)ₖ ) + regulatization
    i=1:m
    k=1:K

and regularization term

    λ/2m∑ₙ∑ᵢ∑ⱼ(Θⱼᵢⁿ)²
    j=1:sₗ₊₁
    i=1:sₗ
    n=1:L-1

> n is l and I use n because no superscript k :)

backpropagation algorithm
=========================
so we need to compute

    J(Θ)
    dJ(Θ)/dΘᵢⱼₗ

> l is put downscript there is superscript in course

suppose 1 training example (x, y)

    a¹ = x
    z² = Θ¹a¹
    a² = g(z²) (with added bias unit a₀²)
    ...

intuition δⱼₗ is error of unit/node j in layer l

    L=4
    δⱼ⁽⁴⁾ = aⱼ⁽⁴⁾ - yⱼ

and vectorized

    δ⁽⁴⁾ = a⁽⁴⁾ - y
    δ⁽³⁾ = (Θ⁽³⁾)'δ⁽⁴⁾ .* g'(z⁽³⁾)

where g'(z⁽³⁾) is the derivative dg/dz evaluated at z⁽³⁾

    g'(z⁽³⁾) = a⁽³⁾ .* (1 -a⁽³⁾)

and there is no δ⁽¹⁾, because we do not derivate input layer
and we _can prove_ that (__without the regularization term__)

    dJ(Θ)/dΘᵢⱼₗ = aⱼ⁽l⁾ δᵢ⁽l+1⁾

so we can implement something like
start Δ⁽l⁾ is zero

    Δ⁽l⁾ = Δ⁽l⁾ + δᵢ⁽l⁾ * a⁽l⁾'


