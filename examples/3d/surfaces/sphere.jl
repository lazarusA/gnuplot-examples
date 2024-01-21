using Gnuplot
Gnuplot.quitall()#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))
function saveas(file; sx=550, sy=350, fs=0.8, term="svg")
    Gnuplot.save(term="$(term) size $(sx),$(sy) fontscale $(fs)", "$(file).svg")
end;

# ## sphere surface

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
saveas("surface002");

# ![](surface002.svg)