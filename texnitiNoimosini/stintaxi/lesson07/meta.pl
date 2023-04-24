% Ορισμός Τελεστών.
:- op(1200, xfx, [if]).
:- op(1000, xfy, [and]).
:- op(900, fy, [not]).
% διερμηνέας (μεταπρόγραμμα)
solve(true).
solve( (X and Y) ) :- solve(X), solve(Y).
solve( (not X) ) :- \+ solve(X). 
solve(Head) :- clause1( (Head if Body) ), 
solve(Body).
% Πρόγραμμα-αντικείμενο
clause1( (p(X, Z) if q(X, Y) and p(Y, Z) ) ).
clause1( (p(X, Y) if q(X, Y) ) ).
clause1( (q(a, b) if true) ).
clause1( (q(b, c) if true) ).