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

say_hi(_Request):- % print HTML with print_html/1.
    format('Content-type: text/html~n~n'), % must have header
    print_html([
        '<html>', 
            '<head>', 
                '<title>', 'Hello', '</title>',
            '</head>', 
            '<body>', 
                '<h2>', 'A Simple Web Page', '</h2>',
                '<p>', 'With some text.', '</p>', 
            '</body>', 
        '</html>'
    ]).
