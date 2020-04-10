using Gnuplot
U  = LinRange(0,10π, 80)
V = LinRange(0,2π, 20)
x = [(1-0.1*cos(v))*cos(u) for u in U, v in V]
y = [(1-0.1*cos(v))*sin(u) for u in U, v in V]
z = [0.1*(sin(v) + u/1.7 - 10) for u in U, v in V]
@gsp x y z "w l notit lc 'orange'" "set xyplane -0.05"
save(term="pngcairo size 600,400", output="tubes1.png") # hide
