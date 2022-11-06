/*Elegxw anadromika ta stoixeia an A>B...
An kati tetoio einai alithes mia fora
tote i lista den einai taxinomemene, giati
exw \+(not)*/
taxinomemene(L):-
    \+ (append(_,[A,B|_], L),
    A > B ).