using Gnuplot, ColorSchemes, RDatasets
volcano = Matrix{Float64}(dataset("datasets", "volcano"))
@gp title = "Auckland s Maunga Whau Volcano" :-
@gp :- volcano "w image" "set auto fix" "set size ratio -1" palette(:inferno)
save(term="pngcairo size 900,600", output="./code/plt3d_ex6.png") # hide
