using Gnuplot
Gnuplot.quitall()#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))
function saveas(file; sx=550, sy=350, fs=0.8, term="svg")
    Gnuplot.save(term="$(term) size $(sx),$(sy) fontscale $(fs)", "$(file).svg")
end;

x = range(0.01, 100, 3000)
y = -0.75sin.(x);

# ## log scales

@gp "set logscale x" "set logscale cb" yrange = [-1,1] :-
## @gp :- raw"""set format cb '10^{%T}'"""
@gp :- xlab = raw"""default format x""" cblab = "Scientific Notation" :-
@gp :- ylab = raw"""-0.75 sin(x)""" :-
@gp :- x y x "w l notit lw 2 dt 1 lc palette"
saveas("log_scales");

# ![](log_scales.svg)