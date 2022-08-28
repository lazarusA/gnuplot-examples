using Gnuplot#hide
Gnuplot.quitall()#hide
mkpath("assets")#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)#hide
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))#hide
saveas(file) = save(term="svg size 550,350 fontscale 0.8", output="assets/$(file).svg")#hide

using Gnuplot, Random
Random.seed!(123)
let
    Θ = LinRange(0, 2π, 100)
    Φ = LinRange(0, π, 100)
    r = 0.8
    x = [r * cos(θ) * sin(ϕ) for θ in Θ, ϕ in Φ]
    y = [r * sin(θ) * sin(ϕ) for θ in Θ, ϕ in Φ]
    z = [r * cos(ϕ) for θ in Θ, ϕ in Φ]
    @gsp "set pm3d depthorder" :-
    @gsp :- "set style fill solid 1.0 noborder" "set view equal xyz"
    @gsp :- "set pm3d lighting primary 0.5 specular 0.6"
    @gsp :-  x y z "w pm3d notit" "set xyplane 0" palette(:viridis)
    saveas("surface002") # hide
end

# ![](assets/surface002.svg)