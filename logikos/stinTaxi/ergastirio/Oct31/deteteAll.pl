/*
consult('deleteAll.pl').
delAll(a, [b,a,a,c,a],L2).
*/

delAll(_,[], Vasi):-
    Vasi = [].

delAll(X, [X|T], Teliki):-
    delAll(X, T, Meriki),
    Teliki = Meriki.

delAll(X, [Y|T], Teliki):-
    delAll(X, T, Meriki),
    Teliki = [Y|Meriki].