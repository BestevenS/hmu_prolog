

insert(X, [], [X]).

insert(X, [Y|T1], [Y|T2]):-
    X > Y,              % X is greater than Y
    insert(X, T1, T2).  % insert X into T1 to get T2

insert(X, [Y|T], [X,Y|T]):-
    X =< Y.         % X is less than or equal to Y

insertSort([], []).

insertSort([H|T], S):-
    insertSort(T, L2),  % sort T to get L2
    insert(H, L2, S).   % insert H into L2 to get S

/*

insertSort([1,-2,2,0,-1], S).
->
S = [-2, -1, 0, 1, 2].

*/