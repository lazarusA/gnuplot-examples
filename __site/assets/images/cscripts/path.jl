using Gnuplot, Random
Random.seed!(123)
n = 20
x, y = rand(n), rand(n)
@gp x y "w l lc 'black' t 'path'"
save(term ="pngcairo size 600,400", output ="path.png")
