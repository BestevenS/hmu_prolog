% Απο εδω και κατω τα πηρα απο σημειωσεις eclass

empty_stack([]).

member_stack(X, Q):- 
    member(X, Q).

top([H|T], H).

get_elem_stack(X, [X|T]).

pop([X|List],X,List).

push(X,List,[X|List]).

% Απο εδω και κατω τα πηρα απο εμένα

start:-
    empty_stack(Q),
    main(Q).

main(Q):-
    write('Dwse ena onoma: '),
    read(Name),
    (
        (
            Name == 'telos',
            exit(Q)
        );
        (
            \+(Name == 'telos'),
            push(Name, Q, Q2),
            main(Q2)
        )
    ).

exit(Q):-
    pop(Q, Name, Q2),
    write(Name), nl,
    exit(Q2).

