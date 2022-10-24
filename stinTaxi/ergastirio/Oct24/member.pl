/*
mb(X, [H|T]):-
    X = H.
or
*/

mb(X, [X|_]).

/*
mb(X, [H|T]):-
    H \= X,
    mb(X, T).
or
*/

mb(X,[_|T]):-
    mb(X,T).

% consult('member.pl').