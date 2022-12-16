% Stefanos Chidiroglou tp4916

% --- για ορισμό και ρύθμιση ενός βασικού HTTP διακομιστή (server)
:-use_module(library(http/thread_httpd)).
% --- για την αποστολή αιτήματος στο διακομιστή
:-use_module(library(http/http_dispatch)).
:-use_module(library(http/http_error)).% για χειρισμό σφαλμάτων του server
:-use_module(library(http/html_write)). %για τη δημιουργία html και πολλά άλλα.
:-use_module(library(http/http_client)).

:-http_handler('/', web_form, []).
:-http_handler('/display', landing_pad, []).

server(Port):-
    http_server(http_dispatch, [port(Port)]).

:-server(8000).

web_form(_Request):-
    reply_html_page(title('4h_askhsh'), % :Head - Το “title/1” δημιουργεί τον τίτλο της ιστοσελίδας
    [
        form( [ action='/display', method='POST' ],
        [
            p( [ ], [ % Το «p/2» ορίζει μια νέα παράγραφο.
                label([for=puretos], 'Exei Pureto(yes/no): '),
                select([id=puretos, name=puretos], [option(yes), option(no)])
            ]),
            p( [ ], [ % Το «p/2» ορίζει μια νέα παράγραφο
                label([for=bhxas], 'Exei Bhxa(yes/no): '),
                select([id=bhxas, name=bhxas], [option(yes), option(no)])
            ]),
            p( [ ], [ % Το «p/2» ορίζει μια νέα παράγραφο
                label([for=efidrwsh], 'Exei Efidrwsh(yes/no): '),
                select([id=efidrwsh, name=efidrwsh], [option(yes), option(no)])
            ]),
            p( [ ], [ % Το «p/2» ορίζει μια νέα παράγραφο
                label([for=aimoptush], 'Exei Aimoptush(yes/no): '),
                select([id=aimoptush, name=aimoptush], [option(yes), option(no)])
            ]),
            p( [ ],
                input([name=submit, type=submit, value='Submit'], [ ] )
            )
        ])
    ]).

landing_pad(Request):-
    member(method(post), Request), !,
    http_read_data(Request, Data, []),
    rule(_,
        values(Data.puretos, Data.bhxas, Data.efidrwsh, Data.aimoptush),
        Res1, Res2
    ),
    reply_html_page(
        title('4h_askhsh'), 
    [ ] ), 
    format('<p><h1>', []),
    emfanish(Res1, Res2).


emfanish(AnsRes1, AnsRes2):-
    write("Pososto gripis "),
    write(AnsRes1), write(' %'), format('<br>'),
    write("Pososto pneumonias "), write(AnsRes2), write(' %').


rule_gripis(A):-
    Prior = 0.5,
    LS = 1.8,
    O_gripis is Prior / (1 - Prior),
    O_h_gripis is LS * O_gripis,
    A is (O_h_gripis) / (1 + O_h_gripis).


rule_pneumonias(A):-
    Prior = 0.5,
    LS = 1.2,
    O_pneumonias is Prior / (1 - Prior),
    O_h_pneumonias is LS * O_pneumonias,
    A is (O_h_pneumonias) / (1 + O_h_pneumonias).


rule(3,values(yes,no,no,no),Res1,Res2):-
    LN = 0.6,
    rule_gripis(Prior),
    O_gripis is Prior / (1 - Prior),
    O_h_gripis is LN * O_gripis,
    Res1 is (O_h_gripis) / (1 + O_h_gripis),
    Res2 is 1 - Res1.



rule(4,values(yes,yes,no,no),Res1,Res2):-
    LS = 2.7,
    rule_pneumonias(Prior),
    O_pneumonias is Prior / (1 - Prior),
    O_h_pneumonias is LS * O_pneumonias,
    Res2 is (O_h_pneumonias) / (1 + O_h_pneumonias),
    Res1 is 1 - Res2.


rule(5,values(yes,no,yes,no),Res1,Res2):-
    LN = 0.8,
    rule(3,_,Prior,_),
    O_gripis is Prior / (1 - Prior),
    O_h_gripis is LN * O_gripis,
    Res1 is (O_h_gripis) / (1 + O_h_gripis),
    Res2 is 1 - Res1.


rule(6,values(yes,yes,no,yes),Res1,Res2):-
    LS = 2.7,
    rule(4,_,_,Prior),
    O_pneumonias is Prior / (1 - Prior),
    O_h_pneumonias is LS * O_pneumonias,
    Res2 is (O_h_pneumonias) / (1 + O_h_pneumonias),
    Res1 is 1 - Res2.