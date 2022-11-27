/*

TP4916 Stefanos Chidiroglou

*/

web_form(_Request):-
	reply_html_page(
		title('POST demo'),
		[
			form([action='/hello', method='POST'],
			[
				p([], [
					label([for=parenthesis],'Dose parenthesi'),
					input([name=parenthesis, type=text])
				]),
				p([],
					input([name=submit, type=submit, value='Submit'], [])
				)
			])
		]
	).