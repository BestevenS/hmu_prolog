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
    reply_html_page(title('2h_askhsh'), % :Head - Το “title/1” δημιουργεί τον τίτλο της ιστοσελίδας
    [
        form( [ action='/display', method='POST' ],
        [
            p( [ ], [ % Το «p/2» ορίζει μια νέα παράγραφο.
                label([for=ma8hma],'Dwse Ma8hma: '),
                input([id=ma8hma, name=ma8hma, type=text, value='Texnhth Nohmosunh']) 
            ]),
            p( [ ], [ % Το «p/2» ορίζει μια νέα παράγραφο.
                label([for=a1],'Dwse pososto foithtwn pou eggrafontai(P(A1)): '),
                input([id=a1, name=a1, type=number, value='0.6'])
            ]),
            p( [ ], [ % Το «p/2» ορίζει μια νέα παράγραφο
                label([for=a2],'Dwse pososto foithtriwn pou eggrafontai(P(A2)): '),
                input([id=a2, name=a2, type=number, value='0.4'])
            ]),
            p( [ ], [ % Το «p/2» ορίζει μια νέα παράγραφο
                label([for=ba1],'Dwse pososto foithtwn pou to pernane(P(B|A1)): '),
                input([id=ba1, name=ba1, type=number, value='0.62'])
            ]),
            p( [ ], [ % Το «p/2» ορίζει μια νέα παράγραφο
                label([for=ba2],'Dwse pososto foithtriwn pou to pernane(P(B|A2)): '),
                input([id=ba2, name=ba2, type=number, value='0.68'])
            ]),
            p( [ ],
                input([name=submit, type=submit, value='Submit'], [])
            ) 
        ])
    ]).

landing_pad(Request):-
    % Δημιουργία μιας νέας ιστοσελίδας (αποτελέσματα) με το
    member(method(post), Request),!,
    http_read_data(Request, Data, []),
    atom_number(Data.a1, A1),
    atom_number(Data.a2, A2),
    atom_number(Data.ba1, BA1),
    atom_number(Data.ba2, BA2),
    p(A1, A2, BA1, BA2, AnsBA1, AnsBA2),
    reply_html_page(
        title('2h_askhsh'), % (:Head -To head της ιστοσελίδας
    [ ] ), % :Body - To body της ιστοσελίδας κενό
    format('<p><h1>', []),
    emfanish(Data.ma8hma, AnsBA1, AnsBA2),
    format("<br>
        <a href='http://localhost:8000/'>
        Epistrofh sto arxiko menu
        </a>", []
    ).

% a) gia thn pi8anothta na einai foithths
%P(A1\B) = (P(A1)*P(B\A1))/((P(A1)*P(B\A1))+(P(A2)*P(B\A2)))

% b) gia thn pi8anothta na einai foithtria
%P(A2\B) = (P(A2)*P(B\A2))/((P(A1)*P(B\A1))+(P(A2)*P(B\A2)))

p(A1, A2, BA1, BA2, AnsBA1, AnsBA2):-
    AnsBA1 is ((A1 * BA1) / ((A1 * BA1) + (A2 * BA2))) * 100, %a) foithths
    AnsBA2 is ((A2 * BA2) / ((A1 * BA1) + (A2 * BA2))) * 100. %b) foithtria

emfanish(Ma8hma, AnsBA1, AnsBA2):-
    write('Gia to Ma8hma: '),
    write(Ma8hma),
    format('<br>'),
    write(' H pi8anothta na to perase foithths einai: '),
    write(AnsBA1),write(' %'),
    format('<br>'),
    write(' H pi8anothta na to perase foithtria einai: '),
    write(AnsBA2),write(' %').