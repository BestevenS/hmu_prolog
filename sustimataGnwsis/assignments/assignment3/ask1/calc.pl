calc(Request):-
    reply_html_page(
        title('values'), 
    []),
    member(method(post), Request), !,
    http_read_data(Request, Data, []),
    % format('<p><h1>', []),

    atom_number(Data.a, A),
    atom_number(Data.b, B),
    atom_number(Data.c, C),

    results(A, B, C, Ans),
    ansWrite(Ans).

ansWrite([]).
    
ansWrite([H|T]):-
    write(H),
    write('  '),
    ansWrite(T).

ansWrite(Ans):-
    write(Ans).


results(A, B, C, Ans):-
    (
        % 1.
        A =:= 0,
        B =:= 0,
        % Απο την εκφώνηση ξέρω ότι το C δεν με νοιάζει
        Ans = 'To triwnumo einai ekfulismeno!', !
    );
    (
        % 2.
        A =:= 0,
        B =\= 0,
        Ans is -C/B, !
    );
    (
        % 3.
        A =\= 0,
        C =:= 0,
        X1 is -B/A,
        Ans = [X1, '0'], !
    );
    (
        % 4.
        % i, ii.
        % Απο την εκφώνηση ξέρω ότι το B δεν με νοιάζει
        A =\= 0,
        C =\= 0,
        (
            % a
            B ** 2 - 4 * A * C >= 0,
            X1 is (-B + sqrt(B ** 2 - 4 * A * C) / 2 * A),
            X2 is (-B - sqrt(B ** 2 - 4 * A * C) / 2 * A),
            Ans = [X1, X2], !
        );
        (
            % b
            Ans = 'Oi rizes einai migadikoi arithmoi!', !
        )
    ).
