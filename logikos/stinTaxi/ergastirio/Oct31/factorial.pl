% paragontiko
% f(3, X) = 1 * 2 * 3 = 6

f(0, 1).

f(N, P):-
    N > 0,
    N1 is N-1,
    f(N1, P1),
    P is P1*N.

