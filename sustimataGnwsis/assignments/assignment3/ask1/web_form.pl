/*

TP4916 Stefanos Chidiroglou

*/

web_form(_Request):-
    reply_html_page(
        title('POST demo'),
        % Εδώ ξεκινάει η δημιουργία μιας html φόρμας. To «form/2» δημιουργεί μια
        % html ιστοσελίδα, η μέθοδος της είναι 'POST'. Όταν πατηθεί το κουμπί submit
        % ενεργοποιεί τη δραστηριότητα (το action) που της έχει ανατεθεί, στην περίπτωση
        % μας το '/calc', επίσης δηλώνεται η μέθοδος αποστολής δεδομένων,
        % method='POST'.
        [
            h2([], ['ax',
                sup('2'), 
                ' + bx + c']),
            h2('Dwse a, b, c:'),
            form([action='/calc', method='POST'],
                [
                    p([], [
                        % Το «p/2» ορίζει μια νέα παράγραφο.
                        % Το «label/2» ορίζει στη φόρμα για ένα πεδίο με όνομα «name» το μήνυμα/label που θα
                        % εκτυπωθεί/επιδειχθεί, δηλαδή «'a: '».
                        label([for=a],'a: '),
                        % Το «input/2» ορίζει ότι ο τύπος των δεδομένων
                        % στο πεδίο «name» είναι κείμενο «number», ταυτόχρονα δημιουργεί χώρο στην ιστοσελίδα για τη
                        % καταχώρηση των δεδομένων. Εδώ θα διαβάσει δεδομένα.
                        input([name=a, type=number])
                    ]),
                    p([], [
                        label([for=b],'b: '),
                        input([name=b, type=number])
                    ]),
                    p([], [
                        label([for=c],'c: '),
                        input([name=c, type=number])
                    ]),
                    p([],
                        input([name=submit, type=submit, value='Submit'], [])
                    )
                ]
            )
        ]
    ).