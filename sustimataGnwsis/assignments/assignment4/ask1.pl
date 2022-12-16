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
    reply_html_page(title('1h_askhsh'), % :Head - Το “title/1” δημιουργεί τον τίτλο της ιστοσελίδας
    [
        form( [ action='/display', method='POST' ],
        [
            p( [ ], [ % Το «p/2» ορίζει μια νέα παράγραφο.
                label([for=kathgoria],'Dwse kathgoria ergazomenwn: '),
                input([id=kathgoria, name=kathgoria, type=text, value='Tourismos'])
            ]),
            p( [ ], [ % Το «p/2» ορίζει μια νέα παράγραφο.
                label([for=a1],'Dwse posostiaia katanomh plu8ismou gia Hrakleio(P(A1)): '),
                input([id=a1, name=a1, type=number, value='0.50'])
            ]),
            p( [ ], [ % Το «p/2» ορίζει μια νέα παράγραφο
                label([for=a2],'Dwse posostiaia katanomh plu8ismou gia Lasi8i(P(A2)): '),
                input([id=a2, name=a2, type=number, value='0.12'])
            ]),
            p( [ ], [ % Το «p/2» ορίζει μια νέα παράγραφο
                label([for=a3],'Dwse posostiaia katanomh plu8ismou gia Re8umno(P(A3)): '),
                input([id=a3, name=a3, type=number, value='0.13'])
            ]),
            p( [ ], [ % Το «p/2» ορίζει μια νέα παράγραφο
                label([for=a4],'Dwse posostiaia katanomh plu8ismou gia Xania(P(A4)): '),
                input([id=a4, name=a4, type=number, value='0.25'])
            ]),
            p( [ ], [ % Το «p/2» ορίζει μια νέα παράγραφο
                label([for=ba1],'Dwse pososto politwn gia Hrakleio(P(B|A1)): '),
                input([id=ba1, name=ba1, type=number, value='0.25'])
            ]),
            p( [ ], [ % Το «p/2» ορίζει μια νέα παράγραφο
                label([for=ba2],'Dwse pososto politwn gia Lasi8i(P(B|A2)): '),
                input([id=ba2, name=ba2, type=number, value='0.05'])
            ]),
            p( [ ], [ % Το «p/2» ορίζει μια νέα παράγραφο
                label([for=ba3],'Dwse pososto politwn gia Re8umno(P(B|A3)): '),
                input([id=ba3, name=ba3, type=number, value='0.20'])
            ]),
            p( [ ], [ % Το «p/2» ορίζει μια νέα παράγραφο
                label([for=ba4],'Dwse pososto politwn gia Xania(P(B|A4)): '),
                input([id=ba4, name=ba4, type=number, value='0.15'])
            ]),
            p( [ ],
                input([name=submit, type=submit, value='Submit'], [ ])
            )
        ])
    ]).

landing_pad(Request):-
    % Δημιουργία μιας νέας ιστοσελίδας (αποτελέσματα) με το
    member(method(post), Request),!,
    http_read_data(Request, Data, []),
    atom_number(Data.a1, A1),
    atom_number(Data.a2, A2),
    atom_number(Data.a3, A3),
    atom_number(Data.a4, A4),
    atom_number(Data.ba1, BA1),
    atom_number(Data.ba2, BA2),
    atom_number(Data.ba3, BA3),
    atom_number(Data.ba4, BA4),
    p(A1, A2, A3, A4, BA1, BA2, BA3, BA4, AnsBNew),
    reply_html_page(
        title('1h_askhsh'), % (:Head -To head της ιστοσελίδας
    [ ] ), % :Body - To body της ιστοσελίδας κενό
    format('<p><h1>', []),
    emfanish(Data.kathgoria, AnsBNew),
    format("<br>
        <a href='http://localhost:8000/'>
            Epistrofh sto arxiko menu
        </a>", []
    ).

% P(B) = P(A1) * P(B \ A1) + P(A2) * P(B \ A2) + P(A3) * P(B \ A3) + P(A4) * P(B \ A4)
p(A1, A2, A3, A4, BA1, BA2, BA3, BA4, AnsBNew):-
    AnsBNew is ((A1 * BA1) + (A2 * BA2) +
        (A3 * BA3) + (A4 * BA4)) * 100.

emfanish(Kathgoria, AnsBNew):-
    write('Gia thn Kathgoria: '),
    write(Kathgoria),
    format('<br>'),
    write('To pososto twn ergazomenwn se olh thn Krhth einai: '),
    write(AnsBNew),write(' %').