p(X, Y):- q(X, Y).
p(X, Y):- q(X, Y), p(Y, _).
q(a, b).
q(b, c).