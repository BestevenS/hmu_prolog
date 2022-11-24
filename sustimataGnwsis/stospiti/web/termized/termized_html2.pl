:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).

:- http_handler('/', say_hi, []).

% server(Port):-
:-
    write('Give the port number: '),
    read(Port),
    http_server(http_dispatch, [port(Port)]).

say_hi(_Request):-
    phrase(my_nonterm, TokenizedHtml, []),
    format('Content-type: text/html~n~n'), % Υποχρεωτικό
    print_html(TokenizedHtml).

my_nonterm-->
    html([
        html([
            head([
                title('HELLO')
            ]),
            body([
                h1('A Simple Web Page'), 
                p('With some text') 
            ])
        ])
    ]).