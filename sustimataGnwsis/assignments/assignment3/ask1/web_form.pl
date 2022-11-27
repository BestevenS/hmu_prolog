/*

TP4916 Stefanos Chidiroglou

*/

web_form(_Request):-
    reply_html_page(
        title('POST demo'),
        [
            h2([], ['ax',
                sup('2'), 
                ' + bx + c']),
            h2('Dwse a, b, c:'),
            form([action='/calc', method='POST'],
                [p([], [
                    label([for=a],'a: '),
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
                )]
            )
        ]
    ).