using Gnuplot
x = y = -5:1:5
z = [x^2 + y^2 for x in x, y in y]
@gp x y z "w image notit" "set auto fix" "set size square"
@gp :- xlab = "x" ylab = "y" "set cblabel 'z'" palette(:dense)
@gsp :- title = "Heatmap Discrete"
save(term ="pngcairo size 600,400", output ="heatmap2.png")
