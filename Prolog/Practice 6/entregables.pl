% Autor: Javier García Fernández


% ....................................................................
% ----------------------------Ejercicio 3 ----------------------------
% ....................................................................

/*
 d1(P1, P2, D)
 Predicado que calcula la distancia de Manhattan (L1) entre dos puntos.
 Argumentos
 + P1:
 - Significado: coordenada del primer punto (X1, Y1)
 - Tipo: entrada
 + P2:
 - Significado: coordenada del segundo punto (X2, Y2)
 - Tipo: entrada
 + D:
 - Significado: distancia Manhattan
 - Tipo: salida
 Variables locales
 + X1, Y1, X2, Y2:
 - Significado: coordenadas de los puntos
 + DX, DY:
 - Significado: diferencias absolutas en las coordenadas
*/

d1((X1, Y1), (X2, Y2), D) :-
    % Calculamos la diferencia absoluta en X
    DX is abs(X2 - X1),
    % Calculamos la diferencia absoluta en Y
    DY is abs(Y2 - Y1),
    % Sumamos las diferencias absolutas
    D is DX + DY.

/*
 d2(P1, P2, D)
 Predicado que calcula la distancia euclidiana (L2) entre dos puntos.
 Argumentos
 + P1:
 - Significado: coordenada del primer punto (X1, Y1)
 - Tipo: entrada
 + P2:
 - Significado: coordenada del segundo punto (X2, Y2)
 - Tipo: entrada
 + D:
 - Significado: distancia euclidiana
 - Tipo: salida
 Variables locales
 + X1, Y1, X2, Y2:
 - Significado: coordenadas de los puntos
 + DX, DY:
 - Significado: diferencias en las coordenadas
 + DXSq, DYSq:
 - Significado: cuadrados de las diferencias
*/

d2((X1, Y1), (X2, Y2), D) :-

    % Calculamos la diferencia en X
    DX is X2 - X1,
    % Calculamos la diferencia en Y
    DY is Y2 - Y1,
    % Elevamos al cuadrado las diferencias
    DXSq is DX * DX,
    DYSq is DY * DY,
    % Calculamos la raíz cuadrada de la suma de cuadrados
    D is sqrt(DXSq + DYSq).

/*
 dmax(P1, P2, D)
 Predicado que calcula la distancia de Chebyshev (L∞) entre dos puntos.
 Argumentos
 + P1:
 - Significado: coordenada del primer punto (X1, Y1)
 - Tipo: entrada
 + P2:
 - Significado: coordenada del segundo punto (X2, Y2)
 - Tipo: entrada
 + D:
 - Significado: distancia de Chebyshev
 - Tipo: salida
 Variables locales
 + X1, Y1, X2, Y2:
 - Significado: coordenadas de los puntos
 + DX, DY:
 - Significado: diferencias absolutas en las coordenadas
*/

dmax((X1, Y1), (X2, Y2), D) :-
    % Calculamos la diferencia absoluta en X
    DX is abs(X2 - X1),
    % Calculamos la diferencia absoluta en Y
    DY is abs(Y2 - Y1),
    % Tomamos el maximo de las diferencias absolutas
    (DX >= DY -> D = DX ; D = DY).



% ....................................................................
% ----------------------------Ejercicio 4 ----------------------------
% ....................................................................

/*
 suma(A, B, R)
 Predicado que calcula la suma de todos los números comprendidos entre A y B (inclusive).
 Argumentos
 + A:
 - Significado: límite inferior del rango
 - Tipo: entrada
 + B:
 - Significado: límite superior del rango
 - Tipo: entrada
 + R:
 - Significado: resultado de la suma
 - Tipo: salida
 Variables locales
 + L:
 - Significado: lista de números entre A y B
*/

suma(A, B, R) :-
    % Generamos una lista de números entre A y B
    findall(X, between(A, B, X), L),
    % Calculamos la suma de los elementos de la lista
    sum_list(L, R).

% ....................................................................
% ----------------------------Ejercicio 5 ----------------------------
% ....................................................................


/*
 media(A, B, R)
 Predicado que calcula la media aritmética de los números comprendidos entre A y B (inclusive).
 Argumentos
 + A:
 - Significado: límite inferior del rango
 - Tipo: entrada
 + B:
 - Significado: límite superior del rango
 - Tipo: entrada
 + R:
 - Significado: resultado de la media aritmética
 - Tipo: salida
 Variables locales
 + L:
 - Significado: lista de números entre A y B
 + S:
 - Significado: suma de los elementos de la lista
 + N:
 - Significado: cantidad de elementos en la lista
*/

media(A, B, R) :-
    % Generamos una lista de números entre A y B
    findall(X, between(A, B, X), L),
    % Calculamos la suma de los elementos de la lista
    sum_list(L, S),
    % Calculamos la longitud de la lista
    length(L, N),
    % Dividimos la suma entre la cantidad de elementos para obtener la media
    R is S / N.


% ....................................................................
% ----------------------------Ejercicio 6 ----------------------------
% ....................................................................


/*
 cuadrado(N, C)
 Predicado que dibuja un cuadrado de N x N caracteres en la consola.
 Argumentos
 + N:
 - Significado: tamaño del lado del cuadrado
 - Tipo: entrada
 + C:
 - Significado: caracter que compone el cuadrado
 - Tipo: entrada
 Variables locales
 + Fila:
 - Significado: lista que representa una fila del cuadrado
*/

cuadrado(N, C) :-
    % Generamos una fila de N caracteres como lista
    fila(N, C, Fila),
    % Repetimos la línea N veces
    between(1, N, _),
    % Imprimimos la fila
    imprimir_lista(Fila),
    % Forzamos la salida al imprimir todas las líneas
    fail; true.

% Predicado auxiliar para generar una fila como una lista repetida
fila(0, _, []) :- !.
fila(N, C, [C | Resto]) :-
    N > 0,
    N1 is N - 1,
    fila(N1, C, Resto).

% Predicado auxiliar para imprimir una lista separada por espacios
imprimir_lista([]) :-
    writeln('').
imprimir_lista([X | Resto]) :-
    write(X),
    write(' '),
    imprimir_lista(Resto).


% ....................................................................
% ----------------------------Ejercicio 7 ----------------------------
% ....................................................................

/*
 contar_lectores_por_edad(Edad, Total)
 Predicado que cuenta la cantidad de lectores con una edad predeterminada.
 Argumentos
 + Edad:
 - Significado: edad a buscar entre los lectores
 - Tipo: entrada
 + Total:
 - Significado: número total de lectores con la edad especificada
 - Tipo: salida
 Variables locales
 + ListaLectores:
 - Significado: lista de lectores que tienen la edad especificada
*/

contar_lectores_por_edad(Edad, Total) :-
    % Recoge todos los lectores con la edad especificada, ignorando los detalles del nombre
    findall(_, lector(_, _, Edad), ListaLectores),
    % Cuenta el número de elementos en la lista
    length(ListaLectores, Total).

% Hechos
lector(nombre("Ana", "Garrido", "Aguirre"), mujer, 31).
lector(nombre("Marta", "Cantero", "Lasa"), mujer, 20).
lector(nombre("Rodrigo", "Luna", "Soto"), hombre, 20).
lector(nombre("Rodriga", "Lunera", "Sote"), hombre, 20).
lector(nombre("Rodrigez", "Lunada", "Sotar"), hombre, 31).
lector(nombre("Romulo", "Luca", "Sota"), hombre, 30).
lector(nombre("Rosa", "Luz", "Soto"), hombre, 30).
lector(nombre("Marta", "Siles", "Parra"), mujer, 30).

% Preguntas:
% ¿Hay lectores?
% ?- lector(_, _, _).

% ¿Quiénes son lectores?
% ?- lector(Nombre, _, _).

% ¿Qué lectores son mujeres? y ¿hombres?
% ?- lector(Nombre, mujer, _).
% ?- lector(Nombre, hombre, _).

% ¿Hay lectores con el mismo nombre?
% ?- lector(nombre(Nombre, _, _), _, _), lector(nombre(Nombre, _, _), _, _), fail; true.

% Uso del predicado:
% ?- contar_lectores_por_edad(30, Total).
% Total = 2.

% ....................................................................
% ----------------------------Ejercicio 8 ----------------------------
% ....................................................................

/*
 sustituir(Lista, ElemViejo, ElemNuevo, Resultado)
 Predicado que sustituye todas las apariciones de un elemento en una lista, incluso dentro de sublistas, por otro elemento.
 Argumentos
 + Lista:
 - Significado: lista original que puede contener sublistas
 - Tipo: entrada
 + ElemViejo:
 - Significado: elemento a reemplazar
 - Tipo: entrada
 + ElemNuevo:
 - Significado: elemento que reemplaza al elemento viejo
 - Tipo: entrada
 + Resultado:
 - Significado: lista resultante con las sustituciones realizadas
 - Tipo: salida
 Variables locales
 + H, T, HRes, TRes:
 - Significado: cabeza y cola de la lista original y sus correspondientes resultados tras el reemplazo
*/

% Caso base: una lista vacía permanece vacía.
sustituir([], _, _, []). 


sustituir([H | T], ElemViejo, ElemNuevo, [ElemNuevo | TRes]) :-
    % Si la cabeza es igual al elemento viejo
    H == ElemViejo, 
     % Sustituimos en la cola.
    sustituir(T, ElemViejo, ElemNuevo, TRes).


sustituir([H | T], ElemViejo, ElemNuevo, [HRes | TRes]) :-
    % Si la cabeza es una sublista
    is_list(H), 
    % Sustituimos recursivamente en la sublista.
    sustituir(H, ElemViejo, ElemNuevo, HRes), 
    % Sustituimos en la cola.
    sustituir(T, ElemViejo, ElemNuevo, TRes). 


sustituir([H | T], ElemViejo, ElemNuevo, [H | TRes]) :-
    % Si la cabeza no es igual al elemento viejo y no es una sublista
    H \== ElemViejo, 
    % Continuamos con la cola.
    sustituir(T, ElemViejo, ElemNuevo, TRes). 

% Ejemplos de uso:
% ?- sustituir([a,b,c,a,d,e], a, z, R).
% R = [z, b, c, z, d, e].
% ?- sustituir([[a,b],[c,a,d],e], a, z, R).
% R = [[z, b], [c, z, d], e].


% ....................................................................
% ----------------------------Ejercicio 9 ----------------------------
% ....................................................................


/*
 invertir(Lista, Resultado)
 Predicado que invierte los elementos de una lista, incluyendo sublistas.
 Argumentos
 + Lista:
 - Significado: lista original que puede contener sublistas
 - Tipo: entrada
 + Resultado:
 - Significado: lista invertida con las sublistas también invertidas
 - Tipo: salida
 Variables locales
 + H:
 - Significado: cabeza de la lista original
 + T:
 - Significado: cola de la lista original
 + InvertidaT:
 - Significado: cola invertida de la lista original
 + HInvertida:
 - Significado: cabeza invertida en caso de ser sublista
*/

% Caso base: la lista vacía permanece vacía.
invertir([], []). 


invertir([H | T], Resultado) :-
    % Invertimos recursivamente la cola
    invertir(T, InvertidaT),
    % Verificamos si la cabeza es una lista
    (es_lista(H) ->
        % Si la cabeza es una lista, la invertimos
        invertir(H, HInvertida),
        concatenar(InvertidaT, [HInvertida], Resultado)
    ;
        % Si la cabeza no es una lista, la añadimos directamente
        concatenar(InvertidaT, [H], Resultado)
    ).

/*
 concatenar(L1, L2, L)
 Predicado auxiliar que concatena dos listas.
 Argumentos
 + L1:
 - Significado: primera lista
 - Tipo: entrada
 + L2:
 - Significado: segunda lista
 - Tipo: entrada
 + L:
 - Significado: lista resultado de la concatenación
 - Tipo: salida
*/

% Caso base: concatenar una lista vacía con L resulta en L.
concatenar([], L, L). 

concatenar([X | L1], L2, [X | L3]) :-
    % Concatenamos recursivamente la cola de L1 con L2
    concatenar(L1, L2, L3).

/*
 es_lista(X)
 Predicado auxiliar que comprueba si un término es una lista.
 Argumentos
 + X:
 - Significado: término a comprobar
 - Tipo: entrada
*/

% Caso base: la lista vacía es una lista.
es_lista([]). 

es_lista([_ | Cola]) :-
    % Si tiene una cola que también es una lista
    es_lista(Cola).

% Ejemplos de uso:
% ?- invertir([1, 2, 3, 4, 5], R).
% R = [5, 4, 3, 2, 1].
% ?- invertir([1, [2, 3], [4, 5]], R).
% R = [[5, 4], [3, 2], 1].

% ....................................................................
% ----------------------------Ejercicio 10----------------------------
% ....................................................................

/*
 contar(X, L, N)
 Predicado que cuenta el número de veces que un elemento aparece consecutivamente al principio de una lista simple.
 Argumentos
 + X:
 - Significado: elemento a contar al principio de la lista
 - Tipo: entrada
 + L:
 - Significado: lista simple donde se busca el elemento
 - Tipo: entrada
 + N:
 - Significado: número de apariciones consecutivas del elemento al principio de la lista
 - Tipo: salida
 Variables locales
 + T:
 - Significado: cola de la lista
 + N1:
 - Significado: contador acumulativo
*/

contar(_, [], 0). % Caso base: si la lista esta vacía, el conteo es 0.
contar(X, [X | T], N) :-
    % Si el primer elemento coincide, contamos recursivamente en la cola
    contar(X, T, N1),
    N is N1 + 1.
contar(X, [Y | _], 0) :-
    % Si el primer elemento no coincide, el conteo se detiene
    X \== Y.

% Ejemplos de uso:
% ?- contar(a, [a, a, a, b, c], N).
% N = 3.
% ?- contar(b, [a, a, a, b, c], N).
% N = 0.


% ....................................................................
% ----------------------------Ejercicio 11----------------------------
% ....................................................................

/*
 quitar(N, L, R)
 Predicado que elimina los primeros N elementos de una lista simple.
 Argumentos
 + N:
 - Significado: número de elementos a eliminar al principio de la lista
 - Tipo: entrada
 + L:
 - Significado: lista original
 - Tipo: entrada
 + R:
 - Significado: lista resultante tras eliminar los N primeros elementos
 - Tipo: salida
 Variables locales
 + T:
 - Significado: cola de la lista
*/

% Caso base: si N es 0, la lista no se modifica.
quitar(0, L, L) :- !. 

% Caso base: si la lista esta vacía, no hay elementos que eliminar.
quitar(_, [], []). 

quitar(N, [_ | T], R) :-
    N > 0,
    N1 is N - 1,
    quitar(N1, T, R).

% Ejemplos de uso:
% ?- quitar(3, [a, b, c, d, e], L).
% L = [d, e].
% ?- quitar(0, [a, b, c], L).
% L = [a, b, c].
% ?- quitar(5, [a, b], L).
% L = [].


% ....................................................................
% ----------------------------Ejercicio 12----------------------------
% ....................................................................

/*
 comprimir(L, R)
 Predicado que comprime una lista simple, agrupando elementos repetidos consecutivos en sublistas de la forma [N, X].
 Argumentos
 + L:
 - Significado: lista original a comprimir
 - Tipo: entrada
 + R:
 - Significado: lista comprimida
 - Tipo: salida
 Variables locales
 + Comprimida:
 - Significado: resultado parcial de compresión
*/

% Caso base: lista vacía se comprime a lista vacía.
comprimir([], []). 

comprimir([X | T], [Grupo | R]) :-
    % Cuenta las apariciones consecutivas del elemento X.
    contar(X, [X | T], N), 
    % Elimina las apariciones contadas del elemento X.
    quitar(N, [X | T], Restante), 
    % Si N > 1, crea un grupo [N, X], sino deja X solo.
    (N > 1 -> Grupo = [N, X]; Grupo = X), 
    % Llama recursivamente con el resto de la lista.
    comprimir(Restante, R). 

% Ejemplo de uso:
% ?- comprimir([a, b, b, c, d, d, d, e, f, f, f, f, f, f], R).
% R = [a, [2, b], c, [3, d], e, [6, f]].


% ....................................................................
% ----------------------------Ejercicio 13----------------------------
% ....................................................................


/*
 desplegar(N, X, L)
 Predicado que genera una lista compuesta por N repeticiones del atomo X.
 Argumentos
 + N:
 - Significado: número de repeticiones del atomo X
 - Tipo: entrada
 + X:
 - Significado: atomo a repetir
 - Tipo: entrada
 + L:
 - Significado: lista resultante con N repeticiones de X
 - Tipo: salida
 Variables locales
 + L:
 - Significado: acumulador para construir la lista resultante
*/

% Caso base: si N es 0, la lista es vacía.
desplegar(0, _, []). 

desplegar(N, X, [X | T]) :-
    % N debe ser positivo
    N > 0, 
    % Decrementa N
    N1 is N - 1, 
    % Genera recursivamente la lista con N-1 repeticiones
    desplegar(N1, X, T).

% Ejemplo de uso:
% ?- desplegar(3, a, L).
% L = [a, a, a].
% ?- desplegar(0, b, L).
% L = [].

% ....................................................................
% ----------------------------Ejercicio 14----------------------------
% ....................................................................

/*
 descomprimir(L, R)
 Predicado que descomprime una lista comprimida en elementos simples.
 Argumentos
 + L:
 - Significado: lista comprimida en la forma de [N, X] o elementos simples
 - Tipo: entrada
 + R:
 - Significado: lista descomprimida con todos los elementos simples
 - Tipo: salida
 Variables locales
 + H:
 - Significado: cabeza de la lista original
 + T:
 - Significado: cola de la lista original
 + Desplegados:
 - Significado: resultado parcial de descomprimir un elemento comprimido
 + Resto:
 - Significado: resultado parcial del resto de la lista
*/

% Caso base: una lista vacía se descomprime a una lista vacía.
descomprimir([], []). 

descomprimir([H | T], R) :-
    (is_list(H), H = [N, X] ->
        % Si H es una sublista del tipo [N, X], usamos desplegar
        desplegar(N, X, Desplegados)
    ;
        % Si H no es una lista, lo tratamos como un elemento simple
        Desplegados = [H]
    ),
    % Continuamos descomprimiendo la cola
    descomprimir(T, Resto),
    % Concatenamos el resultado descomprimido de la cabeza y la cola
    concatenar(Desplegados, Resto, R).

% Ejemplo de uso:
% ?- descomprimir([a, [2, b], c, [3, d], e, [6, f]], R).
% R = [a, b, b, c, d, d, d, e, f, f, f, f, f, f].

% ....................................................................
% ----------------------------Ejercicio 15----------------------------
% ....................................................................

% Hechos
localidad("Aguilar de la Frontera", "Córdoba", 13500).
localidad("Espiel", "Córdoba", 2400).
localidad("Montoro", "Córdoba", 9200).
localidad("Brenes", "Sevilla", 12700).
localidad("Lora del Río", "Sevilla", 18700).
localidad("Marchena", "Sevilla", 19400).

/*
 contarLocalidadesProvincia(Provincia, N)
 Predicado que cuenta las localidades de una provincia.
 Argumentos
 + Provincia:
 - Significado: nombre de la provincia
 - Tipo: entrada
 + N:
 - Significado: número de localidades en la provincia
 - Tipo: salida
 Variables locales
 + Localidades:
 - Significado: lista de localidades de la provincia
*/
contarLocalidadesProvincia(Provincia, N) :-
    % Encuentra todas las localidades de la provincia
    findall(Nombre, localidad(Nombre, Provincia, _), Localidades),
    % Cuenta los elementos de la lista
    length(Localidades, N).

/*
 sumarHabitantesProvincia(Provincia, N)
 Predicado que suma los habitantes de las localidades de una provincia.
 Argumentos
 + Provincia:
 - Significado: nombre de la provincia
 - Tipo: entrada
 + N:
 - Significado: suma de habitantes de todas las localidades de la provincia
 - Tipo: salida
 Variables locales
 + Habitantes:
 - Significado: lista de habitantes de las localidades
*/
sumarHabitantesProvincia(Provincia, N) :-
    % Encuentra los habitantes de las localidades de la provincia
    findall(Habitantes, localidad(_, Provincia, Habitantes), ListaHabitantes),
    % Suma los elementos de la lista
    sumarLista(ListaHabitantes, N).

/*
 sumarLista(Lista, Suma)
 Predicado auxiliar que calcula la suma de los elementos de una lista.
 Argumentos
 + Lista:
 - Significado: lista de números a sumar
 - Tipo: entrada
 + Suma:
 - Significado: resultado de la suma de los elementos de la lista
 - Tipo: salida
*/
% Caso base: suma de una lista vacía es 0.
sumarLista([], 0). 

sumarLista([H | T], Suma) :-
    % Suma recursiva de la cola
    sumarLista(T, SumaResto), 
    % Suma de la cabeza mas la suma de la cola
    Suma is H + SumaResto.

% Ejemplo de uso:
% ?- contarLocalidadesProvincia("Sevilla", N).
% N = 3.
% ?- sumarHabitantesProvincia("Sevilla", N).
% N = 50800.


% ....................................................................
% ----------------------------Ejercicio 16----------------------------
% ....................................................................

/*
 separar(L, I, D)
 Predicado que separa una lista en dos listas, colocando en I los elementos en posiciones impares y en D los elementos en posiciones pares.
 Argumentos
 + L:
 - Significado: lista original
 - Tipo: entrada
 + I:
 - Significado: lista de elementos en posiciones impares
 - Tipo: salida
 + D:
 - Significado: lista de elementos en posiciones pares
 - Tipo: salida
*/
% Caso base: lista vacía se separa en dos listas vacías.
separar([], [], []). 

% Caso base: una lista con un único elemento va a I.
separar([X], [X], []). 
separar([X, Y | T], [X | I], [Y | D]) :-
    separar(T, I, D). % Separación recursiva para el resto de la lista.

/*
 unir(I, D, R)
 Predicado que fusiona dos listas ordenadas en una lista ordenada.
 Argumentos
 + I:
 - Significado: primera lista ordenada
 - Tipo: entrada
 + D:
 - Significado: segunda lista ordenada
 - Tipo: entrada
 + R:
 - Significado: lista fusionada y ordenada
 - Tipo: salida
*/

% Caso base: fusionar una lista vacía con L resulta en L.
unir([], L, L). 

% Caso base: fusionar L con una lista vacía resulta en L.
unir(L, [], L). 

unir([X | I], [Y | D], [X | R]) :-
    X =< Y, % Si el primer elemento de I es menor o igual al de D
    unir(I, [Y | D], R). % Continuamos fusionando recursivamente
unir([X | I], [Y | D], [Y | R]) :-
    X > Y, % Si el primer elemento de D es menor
    unir([X | I], D, R). % Continuamos fusionando recursivamente

/*
 mergesort(L, R)
 Predicado que ordena una lista de números utilizando el método de ordenación mergesort.
 Argumentos
 + L:
 - Significado: lista original
 - Tipo: entrada
 + R:
 - Significado: lista ordenada
 - Tipo: salida
*/
% Caso base: una lista vacía esta ordenada.
mergesort([], []). 

% Caso base: una lista con un único elemento esta ordenada.
mergesort([X], [X]).

mergesort(L, R) :-
    separar(L, I, D), % Separar la lista en dos partes
    mergesort(I, RI), % Ordenar recursivamente la primera parte
    mergesort(D, RD), % Ordenar recursivamente la segunda parte
    unir(RI, RD, R). % Fusionar las dos partes ordenadas

% Ejemplos de uso:
% ?- separar([4, 1, 2, 3, 5], I, D).
% I = [4, 2, 5],
% D = [1, 3].

% ?- unir([1, 3], [2, 4, 5], R).
% R = [1, 2, 3, 4, 5].

% ?- mergesort([5, 4, 1, 3, 2], R).
% R = [1, 2, 3, 4, 5].


% ....................................................................
% ----------------------------Ejercicio 17----------------------------
% ....................................................................

% Hechos
donante(persona(juan, campos, ruiz), a, positivo).
donante(persona(ana, lara, silva), ab, negativo).
donante(persona(luis, luna, pachecho), ab, negativo).

/*
 puede_donar_a(Donante, Receptor)
 Predicado que verifica si una persona puede donar sangre a otra considerando grupo sanguíneo y factor RH.
 Argumentos
 + Donante:
 - Significado: grupo sanguíneo y factor RH del donante
 - Tipo: entrada
 + Receptor:
 - Significado: grupo sanguíneo y factor RH del receptor
 - Tipo: entrada
*/

puede_donar_a(o, _, _). % O negativo puede donar a todos
puede_donar_a(o, _, positivo). % O positivo puede donar a positivos
puede_donar_a(a, a, _). % A puede donar a A
puede_donar_a(a, ab, _). % A puede donar a AB
puede_donar_a(a, a, positivo). % A positivo a positivos
puede_donar_a(a, ab, positivo). % A positivo a positivos
puede_donar_a(b, b, _). % B puede donar a B
puede_donar_a(b, ab, _). % B puede donar a AB
puede_donar_a(b, b, positivo). % B positivo a positivos
puede_donar_a(b, ab, positivo). % B positivo a positivos
puede_donar_a(ab, ab, _). % AB negativo a AB
puede_donar_a(ab, ab, positivo). % AB positivo solo a sí mismo

/*
 contar_por_grupo_y_factor(Grupo, Factor, N)
 Predicado que cuenta los donantes de un grupo sanguíneo y factor RH específicos.
 Argumentos
 + Grupo:
 - Significado: grupo sanguíneo
 - Tipo: entrada
 + Factor:
 - Significado: factor RH (positivo o negativo)
 - Tipo: entrada
 + N:
 - Significado: número de donantes con el grupo y factor especificados
 - Tipo: salida
*/
contar_por_grupo_y_factor(Grupo, Factor, N) :-
    % Encuentra todos los donantes que coinciden con el grupo y el factor
    bagof(Donante, donante(Donante, Grupo, Factor), ListaDonantes),
    % Cuenta los elementos de la lista
    length(ListaDonantes, N).

/*
 escribir_donantes_a_fichero(Grupo, Factor)
 Predicado que realiza las siguientes acciones:
 1. Solicita el nombre de un fichero.
 2. Escribe en dicho fichero los nombres de los donantes con el grupo y factor indicados.
 Argumentos
 + Grupo:
 - Significado: grupo sanguíneo
 - Tipo: entrada
 + Factor:
 - Significado: factor RH
 - Tipo: entrada
*/

escribir_donantes_a_fichero(Grupo, Factor) :-
    % Encuentra los donantes con el grupo y factor especificados
    bagof(persona(Nombre, Apellido1, Apellido2), donante(persona(Nombre, Apellido1, Apellido2), Grupo, Factor), Donantes),
    % Solicita el nombre del fichero al usuario
    write('Introduce el nombre del fichero: '), nl,
    read(Fichero),
    % Abre el fichero para escritura
    open(Fichero, write, Stream),
    % Escribe cada donante en el fichero
    forall(member(persona(Nombre, Apellido1, Apellido2), Donantes),
           format(Stream, '~w ~w ~w~n', [Nombre, Apellido1, Apellido2])),
    % Cierra el fichero
    close(Stream),
    write('Donantes escritos en el fichero.'), nl.

% Ejemplos de uso:
% ?- contar_por_grupo_y_factor(ab, negativo, N).
% N = 2.
% ?- escribir_donantes_a_fichero(ab, negativo).

% Predicado forall: https://www.swi-prolog.org/pldoc/man?predicate=forall/2
% Predicado format: https://www.swi-prolog.org/pldoc/man?predicate=format/2

% ....................................................................
% ----------------------------Ejercicio 18----------------------------
% ....................................................................

/*
 prefijo(Arbol, Lista)
 Predicado que devuelve los elementos del arbol en orden prefijo.
 Argumentos
 + Arbol:
 - Significado: arbol binario
 - Tipo: entrada
 + Lista:
 - Significado: lista de elementos en orden prefijo
 - Tipo: salida
*/

% Caso base: arbol vacío tiene orden prefijo vacío.
prefijo([], []). 

prefijo([Raiz, Izq, Der], Lista) :-
    prefijo(Izq, LI), % Orden prefijo del hijo izquierdo.
    prefijo(Der, LD), % Orden prefijo del hijo derecho.
    append([Raiz | LI], LD, Lista).

/*
 infijo(Arbol, Lista)
 Predicado que devuelve los elementos del arbol en orden infijo.
 Argumentos
 + Arbol:
 - Significado: arbol binario
 - Tipo: entrada
 + Lista:
 - Significado: lista de elementos en orden infijo
 - Tipo: salida
*/



% Caso base: un arbol vacío tiene un orden infijo vacío
infijo([], []).

% Caso recursivo: procesar el subarbol izquierdo, la raíz y el subarbol derecho
infijo([Raiz, Izq, Der], Lista) :-
    % Llamada recursiva para obtener el orden infijo del subarbol izquierdo
    infijo(Izq, LI),
    % Llamada recursiva para obtener el orden infijo del subarbol derecho
    infijo(Der, LD),
    % Concatenar la lista del subarbol izquierdo, la raíz y el subarbol derecho
    append(LI, [Raiz | LD], Lista).

/*
 sufijo(Arbol, Lista)
 Predicado que devuelve los elementos del arbol en orden sufijo.
 Argumentos
 + Arbol:
 - Significado: arbol binario
 - Tipo: entrada
 + Lista:
 - Significado: lista de elementos en orden sufijo
 - Tipo: salida
*/
% Caso base: un arbol vacío tiene un orden sufijo vacío
sufijo([], []).

% Caso recursivo: procesar los subarboles izquierdo y derecho, y luego la raíz
sufijo([Raiz, Izq, Der], Lista) :-
    % Llamada recursiva para obtener el orden sufijo del subarbol izquierdo
    sufijo(Izq, LI),
    % Llamada recursiva para obtener el orden sufijo del subarbol derecho
    sufijo(Der, LD),
    % Concatenar las listas del subarbol izquierdo y derecho, y luego agregar la raíz
    append(LI, LD, Temp),
    append(Temp, [Raiz], Lista).

/*
 profundidad(Arbol, Profundidad)
 Predicado que calcula la profundidad del arbol.
 Argumentos
 + Arbol:
 - Significado: arbol binario
 - Tipo: entrada
 + Profundidad:
 - Significado: profundidad del arbol
 - Tipo: salida
*/

% Caso base: la profundidad de un arbol vacío es 0
profundidad([], 0).

% Caso recursivo: la profundidad es el maximo entre los subarboles izquierdo y derecho, mas 1
profundidad([_, Izq, Der], Profundidad) :-
    % Llamada recursiva para obtener la profundidad del subarbol izquierdo
    profundidad(Izq, PI),
    % Llamada recursiva para obtener la profundidad del subarbol derecho
    profundidad(Der, PD),
    % Calcular la profundidad como el maximo de las profundidades de los subarboles mas 1
    Profundidad is max(PI, PD) + 1.

/*
 contiene(Arbol, Elem)
 Predicado que comprueba si un elemento esta en el arbol.
 Argumentos
 + Arbol:
 - Significado: arbol binario
 - Tipo: entrada
 + Elem:
 - Significado: elemento a buscar en el arbol
 - Tipo: entrada
*/

% Caso base: un arbol vacío no contiene ningún elemento
contiene([], _) :- fail.

% Caso 1: el elemento coincide con la raíz del arbol
contiene([Elem, _, _], Elem).

% Caso 2: el elemento puede estar en el subarbol izquierdo
contiene([_, Izq, _], Elem) :-
    % Llamada recursiva para buscar en el subarbol izquierdo
    contiene(Izq, Elem).

% Caso 3: el elemento puede estar en el subarbol derecho
contiene([_, _, Der], Elem) :-
    % Llamada recursiva para buscar en el subarbol derecho
    contiene(Der, Elem).

/*
 contar_nodos(Arbol, N)
 Predicado que cuenta el número de nodos en el árbol.
 Argumentos
 + Arbol:
 - Significado: árbol binario
 - Tipo: entrada
 + N:
 - Significado: número total de nodos en el árbol
 - Tipo: salida
*/

% Caso base: un arbol vacío tiene 0 nodos
contar_nodos([], 0).

% Caso recursivo: un nodo cuenta como 1 mas la suma de los nodos en los subarboles
contar_nodos([_, Izq, Der], N) :-
    % Llamada recursiva para contar nodos en el subarbol izquierdo
    contar_nodos(Izq, NI),
    % Llamada recursiva para contar nodos en el subarbol derecho
    contar_nodos(Der, ND),
    % Calcular el total como la suma de los nodos de los subarboles mas 1 (raíz actual)
    N is NI + ND + 1.

/*
 contar_hojas(Arbol, N)
 Predicado que cuenta el número de hojas en el árbol.
 Argumentos
 + Arbol:
 - Significado: árbol binario
 - Tipo: entrada
 + N:
 - Significado: número total de hojas en el árbol
 - Tipo: salida
*/

% Caso base: un arbol vacío tiene 0 hojas
contar_hojas([], 0).

% Caso 1: un nodo sin hijos es una hoja
contar_hojas([_, [], []], 1).

% Caso recursivo: contar las hojas en ambos subarboles
contar_hojas([_, Izq, Der], N) :-
    % Llamada recursiva para contar hojas en el subarbol izquierdo
    contar_hojas(Izq, NI),
    % Llamada recursiva para contar hojas en el subarbol derecho
    contar_hojas(Der, ND),
    % Calcular el total como la suma de las hojas de los subarboles
    N is NI + ND.


/*
 redirigir_a_fichero(Predicado, Arbol, Fichero)
 Predicado que redirige la salida de un predicado que opera sobre un árbol hacia un fichero.
 Argumentos
 + Predicado:
 - Significado: predicado que opera sobre el árbol y produce un resultado
 - Tipo: entrada
 + Arbol:
 - Significado: árbol binario sobre el cual se ejecutará el predicado
 - Tipo: entrada
 + Fichero:
 - Significado: nombre del fichero donde se escribirá el resultado
 - Tipo: entrada
 Variables locales
 + Stream:
 - Significado: flujo de escritura hacia el fichero
 + Resultado:
 - Significado: resultado obtenido al aplicar el predicado al árbol
*/

% Abrimos el fichero en modo escritura
redirigir_a_fichero(Predicado, Arbol, Fichero) :-
    open(Fichero, write, Stream),
    % Llamamos al predicado con el árbol y obtenemos el resultado
    call(Predicado, Arbol, Resultado),
    % Escribimos el resultado en el fichero
    write(Stream, Resultado),
    % Cerramos el flujo de escritura
    close(Stream).


% Ejemplo de arbol
% Arbol = [a, [b, [d, [], []], [e, [], []]], [c, [], [f, [], []]]].

% Ejemplos de uso:
% ?- prefijo([a, [b, [d, [], []], [e, [], []]], [c, [], [f, [], []]]], Lista).
% Lista = [a, b, d, e, c, f].

% ?- profundidad([a, [b, [d, [], []], [e, [], []]], [c, [], [f, [], []]]], P).
% P = 3.

% ?- redirigir_a_fichero(prefijo, [a, [b, [d, [], []], [e, [], []]], [c, [], [f, [], []]]], 'salida.txt').


% ....................................................................
% ----------------------------Ejercicio 19----------------------------
% ....................................................................

/*
 crear_primos(N, L)
 Predicado que crea una lista compuesta por los números primos menores o iguales que el número N.
 Argumentos
 + N:
 - Significado: límite superior de los números primos a generar
 - Tipo: entrada
 + L:
 - Significado: lista de números primos menores o iguales que N
 - Tipo: salida
*/

/*
 primo(N)
 Predicado auxiliar que verifica si un número N es primo.
*/
primo(2). % El 2 es primo.
primo(N) :-
    N > 2,
    \+ tiene_divisor(N, 2). % N no tiene divisores desde 2 hasta sqrt(N).

% Predicado auxiliar que verifica si un número tiene un divisor
tiene_divisor(N, D) :-
    D * D =< N, % Solo verificamos divisores hasta sqrt(N).
    (N mod D =:= 0 ; tiene_divisor(N, D + 1)).

crear_primos(N, L) :-
    findall(X, (between(2, N, X), primo(X)), L). % Genera todos los números primos entre 2 y N.

% Ejemplo de uso:
% ?- crear_primos(10, L).
% L = [2, 3, 5, 7].


% ....................................................................
% ----------------------------Ejercicio 20----------------------------
% ....................................................................

/*
 leer_y_escribir_primos(FicheroEntrada, FicheroSalida)
 Predicado que lee números de un fichero, filtra los números primos y los escribe en otro fichero.
 Argumentos
 + FicheroEntrada:
 - Significado: nombre del fichero de entrada que contiene los números
 - Tipo: entrada
 + FicheroSalida:
 - Significado: nombre del fichero donde se escribirán los números primos
 - Tipo: entrada
*/

leer_y_escribir_primos(FicheroEntrada, FicheroSalida) :-
    % Abre el fichero de entrada en modo lectura
    open(FicheroEntrada, read, StreamEntrada),
    % Lee todos los números del fichero
    read(StreamEntrada, Numeros),
    % Cierra el flujo de entrada
    close(StreamEntrada),
    % Filtra los números primos
    include(primo, Numeros, Primos),
    % Abre el fichero de salida en modo escritura
    open(FicheroSalida, write, StreamSalida),
    % Escribe los números primos en el fichero
    forall(member(Primo, Primos), writeln(StreamSalida, Primo)),
    % Cierra el flujo de salida
    close(StreamSalida).

% Ejemplo de uso:
% ?- leer_y_escribir_primos('entrada.txt', 'salida.txt').
% Donde 'entrada.txt' contiene números como [10, 7, 15, 3, 2], y
% 'salida.txt' contendrá los números primos [7, 3, 2].

