using Gnuplot, RDatasets
cars = dataset("datasets", "mtcars")
byCat = cars.Cyl
categ = unique(byCat)
# aesthetics
@gp linetypes(:Set1_5) :-
@gp :- xlab ="Horse Power" ylab = "Miles/(US) gallon" "set auto fix"
@gp :- title = "Categorical Data" :-
@gp :- "set offsets graph .05, graph .05, graph .05, graph .05" :-
@gp :- "set key t r font ',12' tit 'Cylinders' box" :-
# the actual plot
for c in categ
    indc = findall(x->x == c, byCat)
    @gp :-  cars.HP[indc] cars.MPG[indc]  "w p tit '$(c)' pt 7 ps 1.4 "
end
save(term ="pngcairo size 600,400", output ="Categorical_cars.png")
