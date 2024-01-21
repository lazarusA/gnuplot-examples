using Gnuplot
Gnuplot.quitall()#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))
function saveas(file; sx=550, sy=350, fs=0.8, term="svg")
    Gnuplot.save(term="$(term) size $(sx),$(sy) fontscale $(fs)", "$(file).svg")
end;

# ## Tube plot: wireframe

U  = LinRange(0,10π, 80)
V = LinRange(0,2π, 20)
x = [(1-0.1*cos(v))*cos(u) for u in U, v in V]
y = [(1-0.1*cos(v))*sin(u) for u in U, v in V]
z = [0.1*(sin(v) + u/1.7 - 10) for u in U, v in V]
@gsp x y z "w l notit lc 'orange'" "set xyplane -0.05"
saveas("wires004");

# ![](wires004.svg)