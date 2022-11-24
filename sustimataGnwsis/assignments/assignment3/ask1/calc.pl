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
    format('<p><h1>', []),

    results(Data.a, Data.b, Data.c, Ans),

    ansWrite(Ans).

    % κλήση κατηγορήματος με τα δεδομένα των δύο πεδίων που έδωσε ο χρήστης
    % sayHello(Data.a, Data.b, Data.c).



ansWrite([]).
    
ansWrite([H|T]):-
    write(H),
    ansWrite(T).

% Εκτύπωση των δεδομένων των δύο πεδίων στην ιστοσελίδα
% sayHello(A, B, C):-
%     write(A), write(B), write(C).

results(A, B, C, Ans):-
    (
        % 1.
        number_string(A, A), A =:= 0,
        B =:= 0,
        % Απο την εκφώνηση ξέρω ότι το C δεν με νοιάζει
        Ans = 'Το τριώνυμο είναι εκφυλισμένο!', !
    );
    (
        % 2.
        A =:= 0,
        B =\= 0,
        Ans = -C/B, !
    );
    (
        % 3.
        A =\= 0,
        C =:= 0,
        append(-B/A, Ans),
        append(0, Ans), !
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
            append(
                (-B + sqrt(B ** 2 - 4 * A * C)) / 2 * A, Ans
            ),
            append(
                (-B - sqrt(B ** 2 - 4 * A * C)) / 2 * A, Ans
            ), !
        );
        (
            % b
            Ans = 'Οι ρίζες είναι μιγαδικοί αριθμοί!', !
        )
    ).

