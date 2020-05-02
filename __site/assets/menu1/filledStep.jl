using Gnuplot, Random
x = randn(1000)
h = hist(x, bs = 0.1)
c = "#1E90FF"
@gp h.bins h.counts "with fillsteps tit 'data' lc '$(c)' fs solid 0.3 noborder"
@gp :- h.bins h.counts "with steps tit '' lc '$(c)' lw 2" "set grid"
save(term="pngcairo size 600,400", output = "FilledStep.png")
