using Gnuplot, ColorSchemes, RDatasets
volcano = Matrix{Float64}(dataset("datasets", "volcano"))
@gsp title = "Auckland s Maunga Whau Volcano" :-
@gsp :- volcano "w image" "set view map" "set auto fix" palette(:inferno)
save(term="pngcairo size 900,600", output="./code/plt3d_ex6.png") # hide
