/*

αx2 + βx + γ
input: α, β, γ
output: x1, x2

*/

% --- για ορισμό και ρύθμιση ενός βασικού HTTP διακομιστή (server)
:- use_module(library(http/thread_httpd)).
% --- για την αποστολή αιτήματος στο διακομιστή
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).% για χειρισμό σφαλμάτων του server
:- use_module(library(http/html_write)). %για τη δημιουργία html και πολλά άλλα.
% we need the next module from the HTTP client library for the predicate http_read_data
:- use_module(library(http/http_client)).

:- consult('web_form.pl').
:- consult('calc.pl').


:- http_handler('/', web_form, []).
:- http_handler('/calc', calc, []).

% Δημιουργία ενός απλού web-server με πολλαπλά νήματα (multithread)
% server(Port):-
:-
    write('Give the port number: '),
    read(Port),
    http_server(http_dispatch, [port(Port)]).
