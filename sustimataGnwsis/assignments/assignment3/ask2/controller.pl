/*

TP4916 Stefanos Chidiroglou

*/

:- use_module(library(http/thread_httpd)). 
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)). 
:- use_module(library(http/http_client)).

:- consult('web_form.pl').
:- consult('calc.pl').
:- consult('stackActions.pl').

:- http_handler('/', web_form, []). 
:- http_handler('/hello', calc, []).  

% server(Port):-
:-
    write('Dwse ton arithmo tis portas: '),
    read(Port),
    http_server(http_dispatch, [port(Port)]).
