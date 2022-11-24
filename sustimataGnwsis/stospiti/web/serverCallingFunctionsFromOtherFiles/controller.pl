% --- για ορισμό και ρύθμιση ενός βασικού HTTP διακομιστή (server)
:- use_module(library(http/thread_httpd)).
% --- για την αποστολή αιτήματος στο διακομιστή
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).% για χειρισμό σφαλμάτων του server
:- use_module(library(http/html_write)). %για τη δημιουργία html και πολλά άλλα.
% we need the next module from the HTTP client library for the predicate http_read_data
:- use_module(library(http/http_client)).

:- consult('landing_pad.pl').
:- consult('web_form.pl').

% Δήλωση του χειριστή (handler) της αρχικής σελίδας, δηλ. της web_form. Όταν
% ζητηθεί η αρχική σελίδα θα καλεστεί το κατηγόρημα web_form
:- http_handler('/', web_form, []).
:- http_handler('/hello', landing_pad, []).

% Δημιουργία ενός απλού web-server με πολλαπλά νήματα (multithread)
% server(Port):-
:-
    write('Give the port number: '),
    read(Port),
    http_server(http_dispatch, [port(Port)]).
