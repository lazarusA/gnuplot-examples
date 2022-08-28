using Gnuplot#hide
Gnuplot.quitall()#hide
mkpath("assets")#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)#hide
push!( Gnuplot.options.init, linetypes(:tableau_hue_circle, lw=1.5, ps=1.5))#hide
saveas(file) = save(term="svg size 550,350 fontscale 0.8", output="assets/$(file).svg")#hide

using Gnuplot, Dates
let 
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
    saveas("lines006") # hide
end

# ![](assets/lines006.svg)