:- dynamic clause2/2.

solve(true) :- !.

solve( (A, B) ) :- !, solve(A), solve(B).

solve(Goal) :- \+ predicate_property(Goal, built_in), 
    clause2( Goal, Body ), solve(Body).

solve(Goal) :- predicate_property(Goal, built_in),
    call(Goal).

% compiler

clause2( p(X, Z), (q(X, Y), p(Y, Z) ) ).

clause2( p(X, Y), (q(X, Y) ) ).

clause2(q(a, b), true).

clause2(q(b, c), true).

clause2(member(X, [X | T]), true).

clause2(member(X, [H | T]), member(X, T) ).

clause2(ordered([H1]), true).

clause2(ordered( [H1a,H1b|T] ), (H1a =< H1b,ordered([H1b|T])) ).
