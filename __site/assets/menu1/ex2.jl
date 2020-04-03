using Gnuplot
t = 0:0.001:1
@gp t sin.(10π*t) "w l tit 'sin' lc 'black'"
#save("plt2_ex2.gp") # hide
#save(term="pdf size 5,3", output="plt2_ex2.pdf") # hide
save(term="pngcairo size 600,400", output="./code/plt2_ex2.png") # hide
