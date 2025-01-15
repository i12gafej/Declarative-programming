
/*
 Dmax(P1, P2, D)
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
d1((X1, Y1), (X2, Y2), D) :-
    % Calculamos la diferencia absoluta en X
    DX is abs(X2 - X1),
    % Calculamos la diferencia absoluta en Y
    DY is abs(Y2 - Y1),
    % Sumamos las diferencias absolutas
    D is DX + DY.


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


dmax((X1, Y1), (X2, Y2), D) :-
    % Calculamos la diferencia absoluta en X
    DX is abs(X2 - X1),
    % Calculamos la diferencia absoluta en Y
    DY is abs(Y2 - Y1),
    % Tomamos el máximo de las diferencias absolutas
    (DX >= DY -> D = DX ; D = DY).