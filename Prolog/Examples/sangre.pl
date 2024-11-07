% familia.pl
% Definición de hechos

padre(juan, maria).
padre(juan, carlos).
madre(ana, maria).
madre(ana, carlos).
padre(carlos, luis).
madre(maria, sofia).

% Reglas para determinar relaciones

abuelo(X, Y) :- padre(X, Z), padre(Z, Y).
abuela(X, Y) :- madre(X, Z), madre(Z, Y).
hermano(X, Y) :- padre(P, X), padre(P, Y), X \= Y.

% Consultas de ejemplo:
% ?- abuelo(juan, luis).
% ?- hermano(maria, carlos).
% ?- abuela(ana, sofia).