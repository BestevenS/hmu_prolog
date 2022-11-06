occurrences([], _, 0). 

occurrences([H|T], X, N):-
    H = X,                  % if the head is equal to X
    occurrences(T, X, M),   % count the occurrences in the tail
    N is M+1.               % and add 1 to the result

occurrences([H|T], X, N):-
    \+(H=X),                % if the head is not equal to X
    occurrences(T, X, N).   % count the occurrences in the tail

/* 

occurrences([1, 2, 3, 3, 3, 4], 3, 3).
occurrences([1, 2, 3, 3, 3, 4], 3, N).

*/