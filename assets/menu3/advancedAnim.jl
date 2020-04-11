using Gnuplot
x = 0:0.01:2π
files = Vector{String}()
for i in 1:50
    @gp xlab = "x" ylab = "sin"  x sin.(x .+ i / 10.0) "w l lc 'black' notit"
    save(term="pngcairo size 600,400", output="advancedAnim$(i).png")
    push!(files, "advancedAnim$(i).png")
end
run(`convert -limit memory 1 -limit map 1 $files advancedAnim.gif`)
run(`rm -f $files`)

# https://github.com/gcalderone/Gnuplot.jl/issues/9
