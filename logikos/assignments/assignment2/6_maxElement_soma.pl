maxElement([H|T], Max):-
    maxElement_1([H|T], Max, H). 

maxElement_1([], Max, M):-
    Max = M.

maxElement_1([H|T], Max, Max2):-
    H >= Max2,                  % if the head is greater than the current max
    Max3 is H,                  % set the new max to the head
    maxElement_1(T, Max, Max3). % and continue

maxElement_1([H|T], Max, Max2):-
    H < Max2,                   % if the head is less than the current max
    maxElement_1(T, Max, Max2). % continue

/*

maxElement([3, 2, 8, -5, 4], Μ).
->
M = 8.

maxElement([3, 2, 8, -5, 4], 8).
->
true.

maxElement([3, 2, 8, -5, 4], 4).
->
false.

*/