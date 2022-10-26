/*
consult('delete_all.pl').

delAll(a, [a,b,a,c,a,d], NL).

delAll(a, [a,b,a,a,a,a], NL).
*/

delAll(_, [], []).

delAll(X, [X|T], NL):-
    delAll(X, T, NL).

delAll(X, [H|T], [H|NL1]):-
    delAll(X, T, NL1).
