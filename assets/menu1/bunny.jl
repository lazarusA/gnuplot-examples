using FileIO, Gnuplot, ColorSchemes
using GeometryBasics
# based on https://matplotlib.org/matplotblog/posts/custom-3d-engine/
# download this file
# https://matplotlib.org/matplotblog/posts/custom-3d-engine/bunny.obj
bunny = load("bunny.obj")
ptstemp = bunny.position
npts = length(ptstemp)
points = zeros(npts, 3)
for i in 1:npts
    points[i,:] = ptstemp[i]
end
# normalize into a box
mnpts = minimum(points, dims=1)
mxpts = maximum(points, dims=1)
# all the data needed.
verpts = (points .- (mxpts .+ mnpts)./2)./maximum(mxpts .- mnpts)
triface = decompose(TriangleFace{Int32}, bunny)
# polygons to gnuplot
tmp = Vector{String}()
for i in 1:length(triface)
    polytri = verpts[triface[i],:]
    x, y = polytri[:,1], polytri[:,2] # polytri[:,3]
    push!(tmp, join(string.(x) .* " ".* string.(y), "\n") * "\n")
end

@gp "set size ratio -1" :-
@gp :- tmp "w l notit lc 'black' lw 0.2"
@gp :- "unset xtics; unset ytics; unset border"
Gnuplot.save(term = "pngcairo size 800,600", output = "bunnyLines.png")
