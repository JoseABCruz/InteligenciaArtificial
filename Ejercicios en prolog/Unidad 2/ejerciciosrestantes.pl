%Ejercicios restantes

%Mínimo de dos números.
minimo(Numero1, Numero2, Menor) :- Numero1 < Numero2, write(Numero1).
minimo(Numero1, Numero2, Menor) :- Numero2 < Numero1, write(Numero2).

%Area de un circulo
% Definir el valor de pi.
pi_value(3.14159).

% Predicado para calcular el área del círculo.
area_circulo(Radio, Area) :-
    pi_value(PI),
    Area is PI * Radio * Radio.


%Area de un trapecio
% Predicado para calcular el área de un trapecio.
area_trapecio(Base1, Base2, Altura, Area) :-
    Area is (Base1 + Base2) * Altura / 2.




%Producto de los números comprendidos entre dos dados. 

%Ejemplo1
producto(Resultado):- Resultado is (1*2*3*4*5*6)*(1*2*3*4*5*6).


%Ejemplo2
% Predicado para simular el lanzamiento de un dado y obtener un número aleatorio entre 1 y 6.
lanzar_dado(Resultado) :-
    random(1, 7, Resultado).

% Predicado para calcular el producto de los números obtenidos al lanzar dos dados.
producto_de_dados(Product) :-
    lanzar_dado(Dado1),
    lanzar_dado(Dado2),
    Product is Dado1 * Dado2.


%Ejemplo3
producto_de_dos(Numero1, Numero2, Producto) :-
    Producto is (Numero1 * Numero2)/2.
