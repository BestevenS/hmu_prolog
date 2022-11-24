landing_pad(Request):-
    % Δημιουργία μιας νέας ιστοσελίδας (αποτελέσματα) με το
    % reply_html_page (:Head, :Body)
    reply_html_page(
        title('REPLY POST demo'), % (:Head -To head της ιστοσελίδας
    []), % :Body - To body της ιστοσελίδας κενό
    % έλεγχος αν έχει πραγματοποιηθεί η μέθοδος POST
    member(method(post), Request), !,
    % Το κατηγόρημα http_read_data/3 διαβάζει τα δεδομένα από μια HTTP
    % σύνδεση. Στη δομή Data καταχωρεί τα δεδομένα από την http σύνδεση
    http_read_data(Request, Data, []),
    % ορισμός tags ( '<p><h1>') που θα χρησιμοποιηθούν για τη μορφοποίηση
    % των αποτελεσμάτων
    format('<p><h1>', []),
    % κλήση κατηγορήματος με τα δεδομένα των δύο πεδίων που έδωσε ο χρήστης
    sayHello(Data.name, Data.email).
        
% Εκτύπωση των δεδομένων των δύο πεδίων στην ιστοσελίδα
sayHello(Name, Email):-
    write('Hello '),
    write(Name),
    write('('),write(Email),write(')!').

