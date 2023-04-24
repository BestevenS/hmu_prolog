f(a).
f(b).
f(c).

g(z):-
    g(a),
    f(b).

g(a):-
    f(c),
    f(d).

f(d):-
    f(a).

f(e):-
    f(c).
