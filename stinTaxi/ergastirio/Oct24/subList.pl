/*
ask3.7 sel 111
consult('subList.pl').
subList(L1, L2) αληθες αν ολα τα στοιχεια της L1 ειναι στην L2
*/

subList([], _).

subList([H|T], L2):-
    member(H, L2),
    subList(T, L2).

/*

subList([a], [a,b,c]).
subList([], [a,b]). 
subList([a], [[b],[a]]).
subList([a], [1,2,3]).
subList([a,b], [a,1,2,c,4]).

*/