calc(Request):-
    % Δημιουργία μιας νέας ιστοσελίδας (αποτελέσματα) με το
    % reply_html_page (:Head, :Body)
    reply_html_page(
        title('values'), % (:Head -To head της ιστοσελίδας
    []), % :Body - To body της ιστοσελίδας κενό
    % έλεγχος αν έχει πραγματοποιηθεί η μέθοδος POST
    member(method(post), Request), !,
    % Το κατηγόρημα http_read_data/3 διαβάζει τα δεδομένα από μια HTTP
    % σύνδεση. Στη δομή Data καταχωρεί τα δεδομένα από την http σύνδεση
    http_read_data(Request, Data, []),
    % ορισμός tags ( '<p><h1>') που θα χρησιμοποιηθούν για τη μορφοποίηση
    % των αποτελεσμάτων
    format('<sp><h1>', []),

    atom_number(Data.a, A),
    atom_number(Data.b, B),
    atom_number(Data.c, C),

    results(A, B, C, Ans),
    % κλήση κατηγορήματος με τα δεδομένα των δύο πεδίων που έδωσε ο χρήστης
    % sayHello(A, B, C).
    ansWrite(Ans).


    % Εκτύπωση των δεδομένων των δύο πεδίων στην ιστοσελίδα
    % sayHello(A, B, C):-
    %     write(A), write(B), write(C).


ansWrite([]).
    
ansWrite([H|T]):-
    write(H),
    write('  '),
    ansWrite(T).

% ansWrite(Ans):-
%     write(Ans).



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
            X1 is -B + sqrt(B ** 2 - 4 * A * C) / 2 * A,
            X2 is -B - sqrt(B ** 2 - 4 * A * C) / 2 * A,
            Ans = [X1, X2], !
        );
        (
            % b
            Ans = 'Oi rizes einai migadikoi arithmoi!', !
        )
    ).
