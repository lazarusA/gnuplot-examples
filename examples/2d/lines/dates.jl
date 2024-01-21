using Gnuplot
Gnuplot.quitall()#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)
push!( Gnuplot.options.init, linetypes(:tableau_hue_circle, lw=1.5, ps=1.5))
function saveas(file; sx=550, sy=350, fs=0.8, term="svg")
    Gnuplot.save(term="$(term) size $(sx),$(sy) fontscale $(fs)", "$(file).svg")
end;

# ## Time series: Dates

using Dates

dates = Date(2018, 1, 1):Day(1):Date(2019, 12, 31)
ta = rand(length(dates))
timefmt = "%Y-%m-%d" ## hour:minute:seconds are also available
pfmt = "%Y-%m-%d"
rot_xtics = -35
vals = 0.5*ta
tempo = string.(dates)
xmin1 = "2018-02-01"
xmax1 = "2019-04-01"

@gp "set xdata time" "set timefmt '\"$(timefmt)\"'" "set grid" :-
@gp :- "set format x '$(pfmt)'" "set xtics rotate by $(rot_xtics)" :-
@gp :- "set tmargin at screen 0.96; set bmargin at screen 0.15" :-
@gp :- "set lmargin at screen 0.1; set rmargin at screen 0.96" :-
@gp :- """set xrange [\'"$(xmin1)\"':\'"$(xmax1)\"']""" yrange = (-0.25,0.75) :-
@gp :- tempo vals "u 1:2 w l t 'series'"
saveas("lines006");

# ![](lines006.svg)