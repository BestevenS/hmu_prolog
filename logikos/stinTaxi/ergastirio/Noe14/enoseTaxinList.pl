enoseTaxinList([H1|T1], [H2|T2], [H1|T3]):-
    enoseTaxinList(T1, [H2|T2], T3).

enoseTaxinList([H1|T1], [H2|T2], [H1|T3]):-
    H1 = H2, !,
    enoseTaxinList(T1, T2, T3).

enoseTaxinList([H1|T1], [H2|T2], [H1|T3]):-
    H1 > H2,
    enoseTaxinList([H1|T1], T2, T3).

enoseTaxinList(List1, [], List1).
enoseTaxinList([], List2, List2).