insert(X, [], [X]).

insert(X, [Y|T1], [Y|T2]):-
    X > Y,   
    insert(X, T1, T2).

insert(X, [Y|T], [X,Y|T]):-
    X =< Y.  

insertSort(L, S):-
    insertSort_1(L, S, []).

insertSort_1([], S, S).

insertSort_1([H|T], S, S2):-
    insert(H, S2, S3), 
    insertSort_1(T, S, S3).
						  
/*

insertSort([1,-2,2,0,-1], S).
->
S = [-2, -1, 0, 1, 2].

*/