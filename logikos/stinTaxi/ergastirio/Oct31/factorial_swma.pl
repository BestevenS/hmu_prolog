f(N, F):-
    f1(N, N, F).

f1(0, 1, 1).

f1(1, Facc, Facc).

f1(N, Facc, F):-
    N > 1,
    N1 is N - 1,
    NewFacc is Facc * N1,
    f1(N1, NewFacc, F).