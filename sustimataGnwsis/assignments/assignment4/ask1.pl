/*
Η περιφέρεια θέλει ένα πρόγραμμα σε Prolog
στο οποίο
    θα δίνεται ως είσοδος η ποσοστιαία κατανομή του
πληθυσμού κάθε νομού και το ποσοστό των πολιτών
κάθε νομού που αφορά τη συγκεκριμένη κατηγορία
εργαζομένων.
Το πρόγραμμα σας να
    βρίσκει για όλη τη Κρήτη το ποσοστό των 
εργαζομένων στη συγκεκριμένη κατηγορία. 
    
    Για παράδειγμα, έστω ότι το ποσοστό των 
εργαζομένων στον τουρισμό στους νομούς Ηρακλείου, 
Λασιθίου, Ρεθύμνου και Χανίων είναι 0.22, 0.28, 
0.25 και 0.20 αντίστοιχα.
    Να υπολογίσετε το ποσοστό των εργαζομένων στο 
τουρισμό σε όλη την Κρήτη.

    Το πρόγραμμα σας να τρέχει για οποιαδήποτε
κατηγορία εργαζομένων π.χ. στον τουρισμό, στην
πληροφορική, στον αγροτικό τομέα κτλ. 
    Σημείωση: Να εφαρμόσετε τον τύπο της ολικής
πιθανότητας.
*/

% Ποσοστό εργαζομένων στον τουρισμό στους 4 νομούς της Κρήτης

% Ηράκλειο 0.50
% Λασίθι 0.12
% Ρεθύμνο 0.13
% Χανιά 0.25

% τουρισμό
% αγροτικο τομεα
% πληροφορικη

:-
    Hraklio     = "Hraklio",
    Lasithi     = "Lasithi",
    Rethymno    = "Rethymno",
    Chania      = "Chania",
    % nomos, plithismos, polites
    Hplithismos = 0.50,
    Lplithismos = 0.12,
    Rplithismos = 0.13,
    Xplithismos = 0.25,
    Hpolites    = 0.22,
    Lpolites    = 0.28,
    Rpolites    = 0.25,
    Xpolites    = 0.20,
    H = [Hraklio, Hplithismos, Hpolites],
    L = [Lasithi, Lplithismos, Lpolites],
    R = [Rethymno, Rplithismos, Rpolites],
    X = [Chania, Xplithismos, Xpolites],
    write("Dwse to kathgoria ergazomenwn: "),
    read(Kathgoria),
    creator(H), creator(L), creator(R), creator(X).


creator([Nomos, Plithismos, Polites]):-
    write("Dwse posostiaia katanomi tou plithismou stin perioxi "),
    write(Nomos), write(": "),
    read(Plithismos),

    write("Dwse pososto politwn "),
    write(Nomos), write(": "),
    read(Polites).
    