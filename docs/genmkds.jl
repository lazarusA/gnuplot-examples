using Documenter
using Literate

get_example_path(p) = joinpath(@__DIR__, "..", "examples", p)
OUTPUT = joinpath(@__DIR__, "src_md_examples")

folders = readdir(joinpath(@__DIR__, "..", "examples"))
setdiff!(folders, [".DS_Store"])

function get_files(folders)
    srcsfiles = []
    for f in folders
        names = readdir(joinpath(@__DIR__, "..", "examples", f))
        setdiff!(names, [".DS_Store"])
        fpaths  = "$(f)/" .* names
        srcsfiles = vcat(srcsfiles, fpaths...)
    end
    return srcsfiles
end

srcsfiles = get_files(folders)
nested_files = get_files(srcsfiles)

for p in nested_files
    Literate.markdown(get_example_path(p), joinpath(OUTPUT, dirname(p));
        documenter=true, credit=false)
end