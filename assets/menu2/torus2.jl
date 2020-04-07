using Gnuplot
U  = LinRange(-π,π, 100)
V = LinRange(-π,π, 100)
r = 0.5
x = [1 + cos(u) + .5 * cos(u) * cos(v)  for u in U, v in V]
y = [.5 * sin(v)                        for u in U, v in V]
z = [sin(u) + .5 * sin(u) * cos(v)      for u in U, v in V]
bgcp1 = "set object rectangle from screen 0,0 to screen 1,1"
bgcp2 = " behind fillcolor '#212946' fillstyle solid noborder"
bgcolor = bgcp1*bgcp2

@gsp "set pm3d depthorder"
@gsp :- "set style fill solid 1.0"
@gsp :- "set pm3d lighting primary 0.35 specular 0.2"
@gsp :- x y z "w pm3d notit" palette(:Wistia) "set view 108,2"
@gsp :- "unset border" "set xyplane 0"
@gsp :- "unset tics"
@gsp :- "unset colorbox"
@gsp :- bgcolor
save(term="pngcairo size 600,400", output="torus2.png") # hide