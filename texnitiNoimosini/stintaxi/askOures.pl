% Απο εδω και κατω τα πηρα απο σημειωσεις eclass

empty_queue([]).

member_queue(X, Q):- 
    member(X, Q).

get_elem_queue(X, [X|T]).

dequeue(X, [X|T], T).

enqueue(X, [], [X]).
enqueue(X, [H|T], [H|T1]):-
    enqueue(X, T, T1).

% Απο εδω και κατω τα πηρα απο εμένα

start:-
    empty_queue(Q),
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
            enqueue(Name, Q, Q2),
            main(Q2)
        )
    ).

exit([Name|Q]):-
    (
        \+empty_queue([Name|Q]),
        get_elem_queue(Name, [Name|Q]),
        write(Name), nl,
        exit(Q)
    );
    (
        empty_queue(Q),
        write('Telos')
    ).

