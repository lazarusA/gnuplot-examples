using Distributions, StatsBase, LinearAlgebra, Random
Random.seed!(123)
function histVals(μ,σ; npts=1000, izq = -8, der = 6, paso = 0.15)
    dist = rand(Normal(μ,σ), npts)
    h = fit(Histogram, dist, izq:paso:der) #nbins = 50
    h = normalize(h)
    edg = collect(h.edges[1])
    centros = (edg[2:end] .+ edg[1:end-1])/2
    centros, h.weights
end
@gp histVals(0.25,0.5)... "w boxes t '0.25,0.5' lc '#E69F00'"
@gp :- "set key title 'μ,σ' box 3" xlab = "x" ylab = "P(x)"
@gp :- "set style fill transparent solid 0.45 noborder"
@gp :- histVals(-1,2)... "w histeps t '-1,2' lc 'black'"
@gp :- histVals(2,1)... "w fillsteps t '2,1' lc '#009E73' fs transparent solid 0.2 noborder"
save(term="pngcairo size 600,400", output="./code/plt_ex16.png") # hide
