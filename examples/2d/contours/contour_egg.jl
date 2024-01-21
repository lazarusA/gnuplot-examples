using Gnuplot
Gnuplot.quitall()#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))
function saveas(file; sx=550, sy=350, fs=0.8, term="svg")
    Gnuplot.save(term="$(term) size $(sx),$(sy) fontscale $(fs)", "$(file).svg")
end;

# ## Contour plot: egg shape

x = -1:0.05:1
y = -1.5:0.05:2
egg(x,y) = x^2 + y^2/(1.4 + y/5)^2
segg = [egg(x,y) for x in x, y in y]
@gsp x y segg "w l lc palette" palette(:thermal; rev= true) "set view map"
@gsp :- "set contour base;set key off" "set auto fix"
@gsp :- "set cntrparam levels incremental  0,0.01,1" "unset surface"
@gsp :- xrange = (-1.2,1.2) yrange = (-1.5,2) cbrange =(0,1)
@gsp :- xlab = "x" ylab = "y" "set size ratio -1"
saveas("contour002");

# ![](contour002.svg)