


```julia
using Gnuplot, Random
Random.seed!(123)
let
    Θ = LinRange(0, 2π, 100)
    Φ = LinRange(0, π, 20)
    r = 0.8
    x = [r * cos(θ) * sin(ϕ)      for θ in Θ, ϕ in Φ]
    y = [r * sin(θ) * sin(ϕ)      for θ in Θ, ϕ in Φ]
    z = [r * cos(ϕ) for θ in Θ, ϕ in Φ]
    @gsp "set pm3d depthorder" :-
    @gsp :- x y z "w l" "set view equal xyz"
end
```


```
"assets/wires002.svg"
```


![](assets/wires002.svg)

