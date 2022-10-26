/*
consult('delete.pl').
*/


del(X, [X|T], T).

del(X, [Y|T], [Y|T1]):-
    del(X, T, T1).

/*
or

del(X, [H|T], NL):-
    H = X,
    NL = T.

del(X, [H|T], NL):-
    X \= H,
    del(X, T, NL1),
    NL = [H|NL1].


del(a, [1, a, b, c, 2, 3], L).

del(a,[1, a, 2, a, 3, a], L).

*/