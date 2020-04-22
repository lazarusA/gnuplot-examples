using Gnuplot
x = y = -5:1:5
z = [x^2 + y^2 for x in x, y in y]
@gsp x y z "w pm3d notit" "set view map" "set auto fix" "set size square"
@gsp :- xlab = "x" ylab = "y" "set cblabel 'z'" palette(:plasma)
@gsp :- title = "3D Heatmap"
# please also see Heatmap discrete and make sure you are using the right one.
save(term ="pngcairo size 600,400", output ="heatmap1.png")
