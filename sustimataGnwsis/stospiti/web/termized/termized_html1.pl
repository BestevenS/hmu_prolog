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
    format('Content-type: text/html~n~n'), % must have
    phrase(
        html(
            html([
                head(title('Hello')),
                body([
                    h1('A Simple Web Page'),
                    p('With some text')])
            ])
        ), TokenizedHtml, []
    ),
    print_html(TokenizedHtml).