:- use_module(library(http/thread_httpd)).

:- use_module(library(http/http_dispatch)).

:- use_module(library(http/http_error)).

:- http_handler('/', hi_ece, []).

% server(Port):-
:-
    write('Give the port number: '),
    read(Port),
    http_server(http_dispatch, [port(Port)]).

hi_ece(_Request):- % print HTML with format/1.
    format('Content-type: text/html~n~n'), % must have header
    format('
        <html>
            <head>
                <title>ElCompEng</title>
            </head>
            <body>
                <h2>
                    Electrical and Computer Engineering Department.
                </h2>
                <p>
                    Welcome to the Department of Electrical
                    Engineering and Computer Engineering of Hellenic Mediterranean
                    University.
                </p>
            </body>
        </html>~n
    ').
