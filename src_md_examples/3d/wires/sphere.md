```@meta
EditURL = "../../../examples/3d/wires/sphere.jl"
```

````@example sphere
using Gnuplot
Gnuplot.quitall()#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))
function saveas(file; sx=550, sy=350, fs=0.8, term="svg")
    Gnuplot.save(term="$(term) size $(sx),$(sy) fontscale $(fs)", "$(file).svg")
end;
nothing #hide
````

## Sphere: wireframe

````@example sphere
Θ = LinRange(0, 2π, 100)
Φ = LinRange(0, π, 20)
r = 0.8
x = [r * cos(θ) * sin(ϕ)      for θ in Θ, ϕ in Φ]
y = [r * sin(θ) * sin(ϕ)      for θ in Θ, ϕ in Φ]
z = [r * cos(ϕ) for θ in Θ, ϕ in Φ]
@gsp "set pm3d depthorder" :-
@gsp :- x y z "w l" "set view equal xyz"
saveas("wires002");
nothing #hide
````

![](wires002.svg)

