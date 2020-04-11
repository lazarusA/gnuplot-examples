using Gnuplot
x = 0:0.01:2π
@gp xlab = "x" ylab = "sin"
for i in 1:50
    @gp :- i x sin.(x .+ i / 10.0) "w l lc 'black' notit"
end
save(term="gif animate size 600,400 delay 1", output="basicAnim.gif")
