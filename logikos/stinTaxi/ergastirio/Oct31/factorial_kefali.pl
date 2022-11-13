% paragontiko
% f(3, X) = 1 * 2 * 3 = 6

f(0, 1).

f(N, F):-
    N > 0,
    N1 is N - 1,
    f(N1, F1),
    F is N * F1.
