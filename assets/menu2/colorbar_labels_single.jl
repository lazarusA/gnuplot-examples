using Gnuplot, Random
Random.seed!(123)
test = rand(50,50)
@gp "set auto fix" "set size square" :-
@gp :- test "w image notit"  """set cblabel "CBTitle \\n (my unit)" """ :-
@gp :- "set cblabel  offset -6.5, 10 font ',8' textcolor lt 3 rotate by 0" :-
@gp :- palette(:plasma) :-
@gp :- "set tmargin at screen 0.90"
save(term = "pngcairo size 400,400", output = "colorbar_labels_single.png")
