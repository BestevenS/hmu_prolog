gonios(yannis, kostas).
gonios(yaannis, eleni).
gonios(kostas, manos).
gonios(kostas, anna).
gonios(manos, nikos).

progonos(X, Y):-
    gonios(X, Y).

progonos(X, Y):-
    gonios(X, Z),
    progonos(Z, Y).
