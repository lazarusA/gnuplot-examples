using Documenter, DocumenterMarkdown
using Literate

get_example_path(p) = joinpath(@__DIR__, "..", "examples", p)
OUTPUT = joinpath(@__DIR__, "src", "examples", "generated")

flines = "lines/" .* readdir(joinpath(@__DIR__, "..", "examples", "lines"))
ffilled = "filledcu/" .* readdir(joinpath(@__DIR__, "..", "examples", "filledcu"))

fheats = "heatmaps/" .* readdir(joinpath(@__DIR__, "..", "examples", "heatmaps"))
fscatt = "scatters/" .* readdir(joinpath(@__DIR__, "..", "examples", "scatters"))
fconto = "contours/" .* readdir(joinpath(@__DIR__, "..", "examples", "contours"))
fsurfa = "surfaces/" .* readdir(joinpath(@__DIR__, "..", "examples", "surfaces"))
fwires = "wires/" .* readdir(joinpath(@__DIR__, "..", "examples", "wires"))

srcs2d = [flines..., ffilled..., fheats..., fscatt..., fconto...]
srcs3d = [fsurfa..., fwires...]


for (d, paths) in (("2d", srcs2d),)
    for p in paths
    Literate.markdown(get_example_path(p), joinpath(OUTPUT, d, dirname(p));
            documenter=true)
    end
end

for (d, paths) in (("3d", srcs3d),)
    for p in paths
    Literate.markdown(get_example_path(p), joinpath(OUTPUT, d, dirname(p));
            documenter=true)
    end
end