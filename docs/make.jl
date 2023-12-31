using DocumenterVitepress # ] add https://github.com/LuxDL/DocumenterVitepress.jl.git
using Documenter

makedocs(; sitename="gnuplot-examples", authors="Lazaro Alonso",
    clean=true,
    checkdocs=:all,
    format=DocumenterVitepress.MarkdownVitepress(),
    draft=false,
    source="../src_md_examples", build=joinpath(@__DIR__, "examples")
    )