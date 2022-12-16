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
    reply_html_page(title('3h_askhsh'), % :Head - Το “title/1” δημιουργεί τον τίτλο της ιστοσελίδας
    [
        form( [ action='/display', method='POST' ],
        [
            p( [ ], [ % Το «p/2» ορίζει μια νέα παράγραφο.
                label([for=covid],'Dwse pi8anothta na exei Covid: '),
                input([id=covid, name=covid, type=number, value='0.35']) ] ),
            p( [ ], [ % Το «p/2» ορίζει μια νέα παράγραφο
                label([for=ageusiaCovid],'Dwse pi8anothta na exei Ageusia kai na gnwrizei oti exei Covid: '),
                input([id=ageusiaCovid, name=ageusiaCovid, type=number, value='0.7']) ] ),
            p( [ ], [ % Το «p/2» ορίζει μια νέα παράγραφο
                label([for=ageusiaNotCovid],'Dwse pi8anothta na exei Ageusia kai na gnwrizei oti den exei Covid: '),
                input([id=ageusiaNotCovid, name=ageusiaNotCovid, type=number, value='0.05']) ] ),
            p( [ ],
                input([name=submit, type=submit, value='Submit'], [ ] )) ]
        )]).

landing_pad(Request):-
    % Δημιουργία μιας νέας ιστοσελίδας (αποτελέσματα) με το
    member(method(post), Request),!,
    http_read_data(Request, Data, []),
    atom_number(Data.covid, Covid),
    atom_number(Data.ageusiaCovid, AgeusiaCovid),
    atom_number(Data.ageusiaNotCovid, AgeusiaNotCovid),
    p(Covid, AgeusiaCovid, AgeusiaNotCovid, AnsCovidAgeusia),
    reply_html_page(
        title('3h_askhsh'), % (:Head -To head της ιστοσελίδας
    [ ] ), % :Body - To body της ιστοσελίδας κενό
    format('<p><h1>', []),
    emfanish(AnsCovidAgeusia),
    format("<br>
        <a href='http://localhost:8000/'>
            Epistrofh sto arxiko menu
        </a>", []
    ).

% P(koronoio\ageusia) = (P(ageusia\koronoio)*P(koronoio))/(P(ageusia\koronoio)*P(koronoio))+(P(ageusia\!koronoio)*P(!koronoio))
p(Covid, AgeusiaCovid, AgeusiaNotCovid, AnsCovidAgeusia):-
    NotCovid is 1-Covid, % auto xreiazetai gia ton upologismo
    AnsCovidAgeusia is ((AgeusiaCovid * Covid) / 
        ((AgeusiaCovid * Covid) + 
        (AgeusiaNotCovid * NotCovid))) * 100.

emfanish(AnsCovidAgeusia):-
    write('H pi8anothta kapoios as8enhs me ageusia na exei covid einai: '),
    write(AnsCovidAgeusia),write(' %').