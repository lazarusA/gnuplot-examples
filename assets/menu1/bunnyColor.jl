using FileIO, Gnuplot, ColorSchemes
using GeometryBasics, LinearAlgebra, Statistics
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
# perpective, views, rotations
function frustum(left, right, bottom, top, znear, zfar)
    M = zeros(Float32, (4, 4))
    M[1, 1] = 2.0 * znear / (right - left)
    M[2, 2] = 2.0 * znear / (top - bottom)
    M[3, 3] = -(zfar + znear) / (zfar - znear)
    M[1, 3] = (right + left) / (right - left)
    M[3, 2] = (top + bottom) / (top - bottom)
    M[3, 4] = -2.0 * znear * zfar / (zfar - znear)
    M[4, 3] = -1.0
    M
end
function perspective(fovy, aspect, znear, zfar)
    h = tan(fovy*π/360) * znear
    w = h * aspect
    return frustum(-w, w, -h, h, znear, zfar)
end
function translate(x, y, z)
    [1 0 0 x; 0 1 0 y; 0 0 1 z; 0 0 0 1]
end
function xrotate(θ)
    t = π * θ / 180
    c, s = cos(t), sin(t)
    [1 0 0 0; 0 c -s 0; 0 s c 0; 0 0 0 1]
end
function yrotate(θ)
    t = π * θ / 180
    c, s = cos(t), sin(t)
    [c 0 s 0; 0 1 0 0; -s 0 c 0; 0 0 0 1]
end
# Model, view, perspective (MVP)
model = xrotate(20) * yrotate(45)
view  = translate(0,0,-3.5)
proj  = perspective(25, 1, 1, 100)
MVP   = proj * view * model
verpts = hcat(verpts, ones(npts)) * MVP'
verpts ./= verpts[:,4]
# zdepth_order
zdepth = zeros(length(triface))
ptsxy = []
for i in 1:length(triface)
    polytri = verpts[triface[i],:]
    x, y = polytri[:,1], polytri[:,2]
    push!(ptsxy, [x,y])
    zdepth[i] = -mean(polytri[:,3])
end
zmin, zmax = minimum(zdepth), maximum(zdepth)
zdepth = (zdepth .- zmin)/(zmax-zmin)
zdepth_order = sortperm(zdepth)
zdepth = zdepth[zdepth_order] # used for the colormap
# polygons to gnuplot
bunnyC = Vector{String}()
for (indx,i) in enumerate(zdepth_order) # order in which polygons should be drawn
    x, y = ptsxy[i][1], ptsxy[i][2]
    push!(bunnyC, join(string.(x) .* " ".* string.(y) .* " " .*
                  string(zdepth[indx]), "\n") * "\n")
end
# the bunny !
@gp "set title 'Easter'" :-
@gp :- "set style fill solid 1 noborder" title ="Bunny in color"
@gp :- "set size ratio -1" :-
@gp :- bunnyC "w filledcurves notit lc pal" palette(:spring)
@gp :- "unset colorbox; unset xtics; unset ytics; unset border"
save(term = "pngcairo size 800,600", output = "bunnyColor.png")
