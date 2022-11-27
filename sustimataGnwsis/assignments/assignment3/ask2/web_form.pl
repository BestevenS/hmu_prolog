/*

TP4916 Stefanos Chidiroglou

*/

web_form(_Request):-
	reply_html_page(
		title('POST demo'),
		
        % Εδώ ξεκινάει η δημιουργία μιας html φόρμας. To «form/2» δημιουργεί μια
        % html ιστοσελίδα, η μέθοδος της είναι 'POST'. Όταν πατηθεί το κουμπί submit
        % ενεργοποιεί τη δραστηριότητα (το action) που της έχει ανατεθεί, στην περίπτωση
        % μας το '/hello', επίσης δηλώνεται η μέθοδος αποστολής δεδομένων,
        % method='POST'.
		[
			form([action='/hello', method='POST'],
			[
				p([], [
					% Το «p/2» ορίζει μια νέα παράγραφο.
					% Το «label/2» ορίζει στη φόρμα για ένα πεδίο με όνομα «name» το μήνυμα/label που θα
					% εκτυπωθεί/επιδειχθεί, δηλαδή «'Dwse parenteseis'».
					label([for=parenthesis], 'Dwse parenteseis'),
					% Το «input/2» ορίζει ότι ο τύπος των δεδομένων
					% στο πεδίο «name» είναι κείμενο «textarea», ταυτόχρονα δημιουργεί χώρο στην ιστοσελίδα για τη
					% καταχώρηση των δεδομένων. Εδώ θα διαβάσει δεδομένα.
					input([name=parenthesis, type=textarea])
				]),
				p([],
					input([name=submit, type=submit, value='Submit'], [])
				)
			])
		]
	).