using Gnuplot
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
@gsp :- x y z "w pm3d notit" palette(:cool) "set view 108,2"
@gsp :- "unset border" "set xyplane 0"
@gsp :- "unset tics"
@gsp :- "unset colorbox"
@gsp :- bgcolor
save(term="pngcairo size 600,400", output="torus1.png") # hide
