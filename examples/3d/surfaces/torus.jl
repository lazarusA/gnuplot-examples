using Gnuplot
Gnuplot.quitall()#hide
Gnuplot.options.term = "unknown"#hide
empty!(Gnuplot.options.init)
push!( Gnuplot.options.init, linetypes(:Set1_5, lw=1.5, ps=1.5))
function saveas(file; sx=550, sy=350, fs=0.8, term="svg")
    Gnuplot.save(term="$(term) size $(sx),$(sy) fontscale $(fs)", "$(file).svg")
end;

# ## Torus

bgcp1 = "set object rectangle from screen 0,0 to screen 1,1"
bgcp2 = " behind fillcolor 'black' fillstyle solid noborder"
bgcolor = bgcp1*bgcp2
U  = LinRange(-π,π, 50)
V = LinRange(-π,π, 100)
r = 0.5
x = [1 + cos(u) + r * cos(u) * cos(v)  for u in U, v in V]
y = [r * sin(v)                        for u in U, v in V]
z = [sin(u) + r * sin(u) * cos(v)      for u in U, v in V]
@gsp "set pm3d depthorder"
@gsp :- "set style fill transparent solid 0.5"
@gsp :- "set pm3d lighting primary 0.05 specular 0.2"
@gsp :- x y z "w pm3d notit" palette(:Hiroshige) "set view 108,2"
@gsp :- "unset border" "set xyplane 0"
@gsp :- "unset tics"
@gsp :- "unset colorbox"
@gsp :- bgcolor
saveas("surface003");

# ![](surface003.svg)