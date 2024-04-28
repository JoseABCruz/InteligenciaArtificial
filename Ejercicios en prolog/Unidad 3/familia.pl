
%Ejercicio Familia

% Hechos
hombre(antonio).
hombre(juan).
hombre(luis).
hombre(rodrigo).
hombre(ricardo).
mujer(isabel).
mujer(ana).
mujer(marta).
mujer(carmen).
mujer(laura).
mujer(alicia).

matrimonio(antonio, ana).
matrimonio(juan, carmen).
matrimonio(luis, isabel).
matrimonio(rodrigo, laura).

hijo(juan, antonio).
hijo(juan, ana).
hijo(rodrigo, antonio).
hijo(rodrigo, ana).
hijo(marta, antonio).
hijo(marta, ana).
hijo(carmen, luis).
hijo(carmen, isabel).
hijo(ricardo, juan).
hijo(ricardo, carmen).
hijo(alicia, rodrigo).
hijo(alicia, isabel).

% Regla para matrimonio reflexivo
matrimonio_reflexivo(X, Y) :- matrimonio(X, Y).
matrimonio_reflexivo(X, Y) :- matrimonio(Y, X).

% Reglas para obtener nietos
nieto(Nieto, Abuelo) :- hijo(Nieto, Padre), hijo(Padre, Abuelo).
nieta(Nieta, Abuelo) :- hijo(Nieta, Padre), hijo(Padre, Abuelo), mujer(Nieta).

% Reglas para obtener abuelos
abuelo(Abuelo, Nieto) :- nieto(Nieto, Abuelo), hombre(Abuelo).
abuela(Abuela, Nieto) :- nieto(Nieto, Abuela), mujer(Abuela).

% Reglas para definir quiénes son los padres
padre(Padre, Hijo) :- hijo(Hijo, Padre), hombre(Padre).
madre(Madre, Hijo) :- hijo(Hijo, Madre), mujer(Madre).

% Reglas para obtener hermanos
hermano(Hermano1, Hermano2) :-
    padre(Padre, Hermano1),
    padre(Padre, Hermano2),
    madre(Madre, Hermano1),
    madre(Madre, Hermano2),
    hombre(Hermano1),
    hombre(Hermano2),
    Hermano1 \= Hermano2.


hermana(Hermana1, Hermana2) :-
    padre(Padre, Hermana1),
    padre(Padre, Hermana2),
    madre(Madre, Hermana1),
    madre(Madre, Hermana2),
    mujer(Hermana1),
    mujer(Hermana2),
    Hermana1 \= Hermana2.

% Reglas para obtener tíos
tio(Tio, Sobrino) :-
    hermano(Tio, Padre),
    hijo(Sobrino, Padre).

tia(Tia, Sobrino) :-
    hermana(Tia, Madre),
    hijo(Sobrino, Madre).

% Reglas para obtener primos
primo(Primo, Persona) :-
    hijo(Primo, Tio),
    tio(Tio, Persona),
    hombre(Primo),
    Primo \= Persona.

prima(Prima, Persona) :-
    hijo(Prima, Tio),
    tio(Tio, Persona),
    mujer(Prima),
    Prima \= Persona.



% Reglas para obtener suegros
suegro(Suegro, Persona) :- matrimonio(Suegro, Hijo), hijo(Persona, Hijo).
suegra(Suegra, Persona) :- matrimonio(Suegra, Hijo), hijo(Persona, Hijo), mujer(Suegra).


