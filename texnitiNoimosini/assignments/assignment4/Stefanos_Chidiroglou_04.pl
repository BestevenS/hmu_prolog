clause2(monopati(X, Y, Monopati), 
    monopati1(X, Y, [X], Monopati)).
clause2(monopati1(X, X, Monopati, Monopati), true).
clause2(monopati1(X, Z, Monopati, Teliko_monopati), 
    (akme(X, Y), not(member(Y, Monopati)), 
    append(Monopati, [Y], Neo_monopati), 
    monopati1(Y, Z, Neo_monopati, Teliko_monopati))).
clause2(member(X,[H|T]), X=H).
clause2(member(X,[H|T]), (X \= H, 
    member(X,T))).
clause2(append([], L2, L2), true).
clause2(append([H1|T1], L2, [H1|T3]), 
    append(T1, L2, T3)).

clause2(akme(a, c), true).
clause2(akme(c, a), true).
clause2(akme(c, e), true).
clause2(akme(c, f), true).
clause2(akme(b, c), true).
clause2(akme(b, d), true).
clause2(akme(d, f), true).
clause2(akme(d, g), true).

:- dynamic clause2/2.

change_clause(Old, New) :- 
    retract(clause2(Old, _)), 
    assertz(clause2(New, _)).

add_clause(Clause) :-
    assertz(clause2(Clause, _)).

delete_clause(Clause) :-
    retract(clause2(Clause, _)).

solve(true) :- !.
solve((A, B)) :- !, solve(A), solve(B).
solve(Goal) :-
    \+ predicate_property(Goal, built_in), 
    clause2(Goal, Body), 
    solve(Body).

run_program :-
    write('Παρακαλώ επιλέξτε την επιθυμητή ενέργεια:'), nl,
    write('1. Εκτέλεση monopati(a, f, Path)'), nl,
    write('2. Εκτέλεση monopati(a, Y, Path)'), nl,
    write('3. Εκτέλεση monopati(b, f, Path)'), nl,
    write('4. Εκτέλεση monopati(b, Y, Path)'), nl,
    write('5. Έξοδος από το πρόγραμμα'), nl,
    read(Input),
    perform_action(Input).
    
    perform_action(1) :-
        solve(monopati(a, f, Path)),
        write(Path), nl,
        run_program.
    perform_action(2) :-
        solve(monopati(a, Y, Path)),
        write(Path), nl,
        run_program.
    perform_action(3) :-
        solve(monopati(b, f, Path)),
        write(Path), nl,
        run_program.
    perform_action(4) :-
        solve(monopati(b, Y, Path)),
        write(Path), nl,
        run_program.
    perform_action(5).
    perform_action(_) :-
        write('Λανθασμένη επιλογή, παρακαλώ δοκιμάστε ξανά'), nl,
        run_program.
    