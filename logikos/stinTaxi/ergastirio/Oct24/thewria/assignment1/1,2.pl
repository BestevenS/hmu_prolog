healthy(yannis).
healthy(maria).
healthy(tasos).
has_job(yannis).
has_job(anna).
has_job(kostas).
has_kids(yannis).
has_kids(maria).
has_kids(anna).

happy(X):-
    healthy(X);
    has_job(X);
    has_kids(X).

very_happy(X):-
    (healthy(X), has_job(X));
    healthy(X), has_kids(X).