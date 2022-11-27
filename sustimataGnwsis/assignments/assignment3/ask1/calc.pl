/*

TP4916 Stefanos Chidiroglou

*/

calc(Request):-
    reply_html_page(
        title('Calcs'), 
    []),
    member(method(post), Request), !,
    http_read_data(Request, Data, []),
    % get the values from the form

    % convert the values to numbers and store them in variables
    atom_number(Data.a, A),
    atom_number(Data.b, B),
    atom_number(Data.c, C),

    % using the numbers calculate the result
    % and get the Answer of the result
    result(A, B, C, Ans),

    % output the Answer to the page
    ansWrite(Ans).

% if have 2 roots 
% then insert them to the Ans list

% if have 1 root or the answer is a string 
% then insert it to the Ans variable

% if Ans is a list
ansWrite([]).

ansWrite([H|T]):-
    write(H),
    write('  '),
    ansWrite(T).

% if Ans is a variable
ansWrite(Ans):-
    write(Ans).


result(A, B, C, Ans):-
    (
        % 1.
        A =:= 0,
        B =:= 0,
        % Απο την εκφώνηση ξέρω ότι η τιμή του C δεν με νοιάζει
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
        % Απο την εκφώνηση ξέρω ότι η τιμή του B δεν με νοιάζει
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
