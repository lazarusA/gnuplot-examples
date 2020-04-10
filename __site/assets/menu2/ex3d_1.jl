# This file was generated, do not modify it. # hide
using Gnuplot
x, y = [0,1,2], [0,1,2]
Z = [10 10 10; 10 3 10; 10 2 10]
@gsp x y Z "w l lc 'red'" "set view equal xyz"
save(term="png", output="./code/plt3d_ex1.png") # hide
