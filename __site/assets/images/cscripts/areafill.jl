using Gnuplot
x = LinRange(0,1,100)
@gp x x.^2 "w filledcu y = 0 lc 'red' t 'area fill'"
@gp :- "set style fill transparent solid 0.2"
save(term ="pngcairo size 600,400", output ="areafill.png")
