% member_(2, [1, 2, 4, 5]).
member_(X, L):-
    append(L1, [X|T], L).

% adjacent(3, 4, [1, 3, 4, 5, 2]).
adjacent(X, Y, L):-
    append(L1, [X, Y|T], L).

% last(1, [1, 2, 3, 4, 1]).
last(X, L):-
    append(L1, [X], L).