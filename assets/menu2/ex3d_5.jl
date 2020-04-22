using Gnuplot, Random
Random.seed!(1234)
matrix = randn(50,60)
@gp matrix "w image notit" "set auto fix"
save(term="pngcairo size 800,800", output="./code/plt3d_ex5.png") # hide
