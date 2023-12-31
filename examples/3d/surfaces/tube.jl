using Gnuplot#hide
Gnuplot.quitall()#hide
mkpath("assets")#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)#hide
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))#hide
saveas(file) = Gnuplot.save(term="svg size 550,350 fontscale 0.8", "assets/$(file).svg")#hide

using Gnuplot, Random
let
    U  = LinRange(0,10π, 80)
    V = LinRange(0,2π, 20)
    x = [(1-0.1*cos(v))*cos(u) for u in U, v in V]
    y = [(1-0.1*cos(v))*sin(u) for u in U, v in V]
    z = [0.1*(sin(v) + u/1.7 - 10) for u in U, v in V]
    @gsp "set pm3d depthorder" :-
    @gsp :- "set style fill transparent solid 0.7" "set view equal xyz"
    @gsp :- x y z "w pm3d notit" "set xyplane -0.05" palette(:ice)
    saveas("surface004") # hide
end

# ![](assets/surface004.svg)