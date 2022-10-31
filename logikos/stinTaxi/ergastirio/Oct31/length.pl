/*

consult('length.pl').

len([a, g, F, 2, 1], X).

*/

len(L, N):-
    len1(L, 0, N).

len1([], M, M).

len1([_|T], M, N):-
    M1 is M + 1,
    len1(T, M1, N).


/*

len([], 0).
len([_|T], N):-
    len(T, N1),
    N is N1 + 1.

*/