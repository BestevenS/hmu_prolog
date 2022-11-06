maxElement([H], Max):-
    Max = H.

maxElement([H|T], Max):-
	maxElement(T, Max2),    % recursive call
    H >= Max2,              % if H is greater than Max2
    Max = H.                % then Max is H

maxElement([H|T], Max):-
	maxElement(T, Max2),
    H < Max2,               % if H is less than Max2
    Max = Max2.             % then Max is Max2

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