occurrences(L, X, N):-
    occurrences_1(L, X, N, 0).

occurrences_1([], _, N, N).

occurrences_1([H|T], X, N, N2):-
    H=X,                        % if the head is equal to X
    N3 is N2+1,                 % increment the counter
    occurrences_1(T, X, N, N3). % and continue

occurrences_1([H|T], X, N, N2):-
    \+(H=X),                    % if the head is not equal to X
    occurrences_1(T, X, N, N2). % continue

/* 

occurrences([1, 2, 3, 3, 3, 4], 3, 3).
occurrences([1, 2, 3, 3, 3, 4], 3, N).

*/