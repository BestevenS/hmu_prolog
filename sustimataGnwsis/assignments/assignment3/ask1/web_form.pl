web_form(_Request):-
    % Δημιουργία μιας ιστοσελίδας με το reply_html_page (:Head, :Body)
    reply_html_page(
        title('POST demo'),
        % :Head - Το “title/1” δημιουργεί τον τίτλο της ιστοσελίδας
        % :Body - Το σώμα της ιστοσελίδας βρίσκεται στη λίστα [ ..]
        % Εδώ ξεκινάει η δημιουργία μιας html φόρμας. To «form/2» δημιουργεί μια
        % html ιστοσελίδα, η μέθοδος της είναι ’POST’. Όταν πατηθεί το κουμπί submit
        % θα πάρουμε μια νέα σελίδα την http://127.0.0.1:8000/hello . To «form/2»
        % ενεργοποιεί τη δραστηριότητα (το action) που της έχει ανατεθεί, στην περίπτωση
        % μας το ‘/hello’, επίσης δηλώνεται η μέθοδος αποστολής δεδομένων,
        % method=’POST’.
        [
            h2([], ['ax',
                sup('2'), 
                ' + bx + c']),
            h2('Give a, b, c to show the roots'),
            form([action='/calc', method='POST'],
                [p([], [ % Το «p/2» ορίζει μια νέα παράγραφο.
                    % Το «label/2» ορίζει στη φόρμα για ένα πεδίο με όνομα «name» το μήνυμα/label που θα
                    % εκτυπωθεί/επιδειχθεί, δηλαδή «'What is your name?». Το «input/2» ορίζει ότι ο τύπος των δεδομένων
                    % στο πεδίο «name» είναι κείμενο «textarea», ταυτόχρονα δημιουργεί χώρο στην ιστοσελίδα για τη
                    % καταχώρηση των δεδομένων. Εδώ θα διαβάσει δεδομένα.
                    label([for=a],'a: '),
                    input([name=a, type=number])
                ]),
                p([], [ % Το «p/2» ορίζει μια νέα παράγραφο
                    label([for=b],'b: '),
                    input([name=b, type=number])
                ]),
                p([], [
                    label([for=c],'c: '),
                    input([name=c, type=number])
                ]),
                p([],
                    input([name=submit, type=submit, value='Submit'], [])
                )]
            )
        ]
    ).