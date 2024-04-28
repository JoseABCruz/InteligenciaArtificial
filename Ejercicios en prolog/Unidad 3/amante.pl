
%Ejercicio amante

% Hechos
ama(juan, ana).
ama(ana, miguel).
ama(luis, isabel).
ama(miguel, ana).
ama(laura, juan).
ama(isabel, luis).

% Regla para describir a los amantes mutuos
amantes(X, Y) :- ama(X, Y), ama(Y, X).

% Preguntas
% ¿A quién ama "Juan"?
quien_ama_juan :- ama(juan, X).

% ¿Quién ama a "Ana"?
quien_ama_ana :- ama(X, ana)l.

% ¿Quién ama a alguien?
quien_ama_alguien :- ama(X, _).

% ¿Quién es amado por alguien?
amado_por_alguien(X) :- ama(_, X).

% ¿Quiénes se aman mutuamente?
se_aman_mutuamente(X, Y) :- amantes(X, Y).

% ¿Quién ama sin ser correspondido?
ama_sin_ser_correspondido(X) :- ama(X, Y), \+ ama(Y, X).






