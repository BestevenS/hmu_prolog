% to use the 

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).

% first argument (/) the URI that server has to serve
% second argument (say_hi) the name of the function that will be called when the URI is requested
% third argument ([]), the options for the function

% :- http_handler(/, say_hi, []).
:- http_handler(root(hi), say_hi, []).
% do the request at the root of the server with calling the function say_hi

% just to be user friendly
% server(Port):-
:-
    write('Give the port number: '),
    read(Port),
    http_server(http_dispatch, [port(Port)]).

% the function that will be called when the URI is requested
say_hi(_Request):-
    format('Content-type: text/plain~n~n'), % must have header
    format('Hello Electrical & Computer Engineering!~n~n'),
    format('Hello Hellenic Mediterranean University!~n'),
    format('Hello World!~n').
