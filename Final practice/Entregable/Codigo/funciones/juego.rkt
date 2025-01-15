;                          FUNCIONES DE BARAJA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: crear-mazo  
Descripción: Genera un mazo completo de cartas, compuesto por cuatro barajas completas, con cada palo (corazón, diamante, trébol, pica) y valores ('A', '2', ..., 'K').  
Parámetros:  
- Ninguno.  
Devuelve:  
- Una lista que representa el mazo completo, donde cada carta es una sublista de la forma `(valor palo)`.  
Descripción de la solución:  
Utiliza `map` para generar las cartas de cada palo y `append` para combinarlas. Se crean cuatro barajas completas para cada palo ('corazón', 'diamante', 'trébol', 'pica'), generando 208 cartas en total.  
Funciones auxiliares:  
- Ninguna.  
|#


(define (crear-mazo)
  (append
   (map (lambda (valor) (list valor 'corazon))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'corazon))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'corazon))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'corazon))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'diamante))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'diamante))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'diamante))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'diamante))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'trebol))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'trebol))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'trebol))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'trebol))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'pica))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'pica))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'pica))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'pica))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: range  
Descripción: Genera una lista decreciente desde `n-1` hasta 0.  
Parámetros:  
- `n`: Número entero no negativo que define el tamaño de la lista.  
Devuelve:  
- Una lista de números enteros decrecientes desde `n-1` hasta 0.  
Descripción de la solución:  
La función es recursiva. Si `n` es 0, devuelve una lista vacía. Si no, construye la lista añadiendo `n-1` al frente de la lista generada por una llamada recursiva con `n-1`.  
Funciones auxiliares:  
- Ninguna.  
|#


(define (range n)
  (if (= n 0)
      '()
      (cons (- n 1) (range (- n 1)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: swap  
Descripción: Intercambia los elementos en las posiciones `i` y `j` de una lista dada.  
Parámetros:  
- `lst`: Lista en la que se desea realizar el intercambio.  
- `i`: Índice del primer elemento a intercambiar.  
- `j`: Índice del segundo elemento a intercambiar.  
Devuelve:  
- Una nueva lista con los elementos en las posiciones `i` y `j` intercambiados.  
Descripción de la solución:  
Se extraen los elementos en las posiciones `i` y `j`. Luego, se reconstruye la lista utilizando `map` y un rango que recorre todos los índices de la lista. En el mapeo, si el índice actual corresponde a `i`, se reemplaza con el elemento de la posición `j` y viceversa. Los demás índices permanecen iguales.  
Funciones auxiliares:  
- `range`: Genera un rango de índices desde `n-1` hasta 0.  
- `list-ref`: Obtiene el elemento de la lista en el índice especificado.  
|#


(define (swap lst i j)
  (let ((elem-i (list-ref lst i))
        (elem-j (list-ref lst j)))
    (map (lambda (idx)
           (cond ((= idx i) elem-j)
                 ((= idx j) elem-i)
                 (else (list-ref lst idx))))
         (range (length lst)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: barajar  
Descripción: Mezcla un mazo de cartas utilizando un algoritmo de barajado similar al algoritmo de Fisher-Yates.  
Parámetros:  
- `mazo`: Lista de cartas a mezclar.  
Devuelve:  
- Una nueva lista con las cartas del mazo en orden aleatorio.  
Descripción de la solución:  
La función `barajar` utiliza una función auxiliar `shuffle-helper` que realiza el barajado recursivamente.  
1. Se selecciona un índice aleatorio `j` dentro del rango de 0 a `n` (inclusive).  
2. Los elementos en las posiciones `n` y `j` son intercambiados mediante la función `swap`.  
3. El proceso continúa decrementando `n` hasta que alcanza 0, momento en el cual el mazo está completamente barajado.  
Funciones auxiliares:  
- `shuffle-helper`: Realiza el barajado recursivamente.  
- `swap`: Intercambia dos elementos en la lista.  
|#


(define (barajar mazo)
  (define (shuffle-helper lst n)
    (if (<= n 0)
        lst
        (let ((j (random (+ n 1))))
          (shuffle-helper (swap lst n j) (- n 1)))))
  (shuffle-helper mazo (- (length mazo) 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: add-carta-mano  
Descripción: Añade una nueva carta a la mano de un jugador o del crupier y actualiza el mazo.  
Parámetros:  
- `mano`: Lista de cartas que el jugador o el crupier ya tiene.  
- `mazo`: Lista de cartas disponibles en el mazo.  
- `turno`: Indica si es el turno del jugador o del crupier ('jugador' o 'crupier').  
Devuelve:  
- Una lista con dos elementos: la mano actualizada con la nueva carta y el mazo actualizado sin esa carta.  
Descripción de la solución:  
1. Extrae la primera carta del mazo como `nueva-carta`.  
2. Calcula la posición en el tablero donde se colocará la carta, dependiendo del turno.  
3. Anima la carta moviéndose desde el mazo hasta la posición calculada en el tablero.  
4. Dibuja la carta en la posición final y realiza otra animación para la "patita".  
5. Devuelve la nueva mano y el mazo restante.  
Funciones auxiliares:  
- `mover-patita-carta`: Mueve la carta visualmente desde el mazo a la posición de destino.  
- `mover-patita`: Dibuja la animación de la "patita" asociada a la carta.  
- `dibujar-carta`: Dibuja la carta en su posición final.  
|#


(define (add-carta-mano mano mazo turno)
  (let
      ((nueva-carta (car mazo))
       (pos-y (if (eq? turno 'jugador) 400 250))
       (pos-x (+ (* 90 (length mano)) 200)))
    (mover-patita-carta 700 pos-y pos-x pos-y 0.3 1. tapete)
    (dibujar-carta pos-x pos-y 0.3 (cadr nueva-carta) (car nueva-carta) valores)
    (mover-patita (+ 100 pos-x) pos-y 700 pos-y 0.4 1. tapete)
    (cons (append mano (list nueva-carta)) (cdr mazo))
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: extraer-mazo  
Descripción: Extrae el mazo actualizado sin la primera carta.  
Parámetros:  
- `mazo`: Lista de cartas disponibles en el mazo.  
Devuelve:  
- El mazo actualizado sin la primera carta.  
Descripción de la solución:  
Elimina la primera carta del mazo utilizando la función `cdr`.  
Funciones auxiliares:  
Ninguna.  
|#


(define (extraer-mazo mazo)
  (cdr mazo)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: count  
Descripción: Cuenta los elementos de una lista que cumplen con un predicado dado.  
Parámetros:  
- `pred`: Función predicado que evalúa cada elemento de la lista.  
- `lst`: Lista de elementos a evaluar.  
Devuelve:  
- Un número que representa la cantidad de elementos que cumplen con el predicado.  
Descripción de la solución:  
Se utiliza una función auxiliar `count-helper` para recorrer la lista acumulando el número de elementos que cumplen el predicado.  
Funciones auxiliares:  
- `count-helper`: Realiza la recursión y lleva un acumulador de los elementos contados.  
|#


(define (count pred lst)
  (define (count-helper lst acc)
    (cond
      ; Si la lista está vacía, devuelve el acumulador
      ((null? lst) acc)
      ; Si el predicado es verdadero, incrementa el acumulador
      ((pred (car lst)) (count-helper (cdr lst) (+ acc 1)))
      ; Si no, sigue sin incrementar
      (else (count-helper (cdr lst) acc))))
  ; Inicializa el acumulador en 0
  (count-helper lst 0))                               


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: valor-carta  
Descripción: Obtiene el valor numérico de una carta de blackjack.  
Parámetros:  
- `carta`: Una lista con el valor y palo de la carta, donde el valor puede ser una letra (e.g., 'A', 'J') o un número.  
Devuelve:  
- El valor numérico de la carta según las reglas del blackjack.  
  - As ('A') vale 11.  
  - Diez ('T') y figuras ('J', 'Q', 'K') valen 10.  
  - Cualquier otro número devuelve su valor numérico.  
Descripción de la solución:  
El valor de la carta se obtiene verificando su tipo mediante cond:  
- Se retorna 11 para el As.  
- Se retorna 10 para las figuras y el diez.  
- Para otros casos, se convierte el valor a número y se retorna.  
Funciones auxiliares:  
Ninguna  
|#


(define (valor-carta carta)
  (let ((valor (car carta)))
    (cond
      ((equal? valor 'A) 11)
      ((equal? valor 'T) 10)
      ((member valor '(J Q K)) 10)
      (else (string->number (number->string valor))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: valor-mano  
Descripción: Calcula el valor total de una mano de blackjack considerando las reglas para los Ases y actualiza visualmente el puntaje.  
Parámetros:  
- `mano`: Lista de cartas en la mano, donde cada carta es una lista que contiene su valor y palo.  
- `tipo`: Determina si la mano pertenece al jugador o al crupier ('jugador' o 'crupier').  
Devuelve:  
- El valor total de la mano según las reglas del blackjack:  
  - Los Ases cuentan inicialmente como 11, pero si el total supera 21, cada As puede contar como 1 hasta evitar el exceso.  
  - Actualiza el valor visualmente en la pantalla, en diferentes posiciones según el tipo de jugador.  
Descripción de la solución:  
1. Se calcula la suma inicial de los valores de las cartas en la mano usando `valor-carta`.  
2. Se cuenta la cantidad de Ases en la mano.  
3. Se ajusta la suma iterativamente, reduciendo 10 por cada As si el total supera 21.  
4. Según el tipo de jugador, se posiciona el valor visual en el tablero.  
5. La función devuelve el valor ajustado de la mano.  
Funciones auxiliares:  
- `valor-carta`: Calcula el valor individual de una carta.  
- `count`: Cuenta los elementos en una lista que cumplen un predicado.  
|#


(define (valor-mano mano tipo)
  ; Función auuxiliar
  (define (aux)
  (let
      ; Variables del let
      (
       ; Suma los valores de las cartas
       (suma (apply + (map valor-carta mano)))
       ; Cuenta los ases de la mano
        (ases (count (lambda (carta) (equal? (car carta) 'A)) mano)))
    ; Cuerpo del let
    (let loop
      ; Variables iterativas
      ((suma suma) (ases ases))
      ; Suma beneficiosa por ases
      (if (and (> suma 21) (> ases 0))
          (loop (- suma 10) (- ases 1))
          suma))))
  (let
      ; Variables del let
      (
       ; Resultado de la función auxiliar
       (resultado (aux))
       ; Posición de la caja
       (pos-y
        (cond
          ((eq? tipo 'crupier) 250)
          (else 400)
          ))
       )
    ; Cuerpo del let
    ((draw-solid-polygon v1)(lista-a-posn (list (list 60 (- pos-y 30))(list 120 (- pos-y 30))(list 120 (+ pos-y 30))(list 60 (+ pos-y 30)))) (make-posn 0 0) negro)
    ((draw-solid-polygon v1)(lista-a-posn (list (list 65 (- pos-y 25))(list 115 (- pos-y 25))(list 115 (+ pos-y 25))(list 65 (+ pos-y 25)))) (make-posn 0 0) blanco)
    (dibujar-texto (number->string resultado) 73 (- pos-y 10) 10 negro)
    
    resultado
      )
  
  )

;                                   FUNCIÓNES DE IMPRESIÓN (PARA DEPURAR)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: mostrar-estado  
Descripción: Muestra el estado actual del juego, incluyendo la apuesta, el valor de la mano del jugador y el valor de la mano del crupier.  
Parámetros:  
- `jugador`: Mano actual del jugador, una lista de cartas.  
- `crupier`: Mano actual del crupier, una lista de cartas.  
- `apuesta`: Valor numérico de la apuesta actual.  
Devuelve:  
- void (imprime en la consola los valores actuales del juego).  
Descripción de la solución:  
1. Imprime el valor de la apuesta.  
2. Muestra el valor de la mano del jugador junto con las cartas que la componen.  
3. Muestra el valor de la mano del crupier junto con sus cartas.  
Funciones auxiliares:  
- `valor-mano`: Calcula el valor total de una mano según las reglas del blackjack. 
|#

(define (mostrar-estado jugador crupier apuesta)
  (displayln (string-append "Apuesta: " (number->string apuesta)))
  (displayln (string-append "Jugador: " (number->string (valor-mano jugador 'jugador)) " - " (format "~a" jugador)))
  (displayln (string-append "Crupier: " (number->string (valor-mano crupier 'crupier)) " - " (format "~a" crupier))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: mostrar-jugador  
Descripción: Imprime el estado de un jugador en la consola, mostrando su mano y su valor total.  
Parámetros:  
- `jugador`: Indica si es 'jugador' o 'crupier'.  
- `mano`: Lista de cartas en la mano del jugador o del crupier.  
Devuelve:  
- La mano del jugador o crupier (sin cambios).  
Descripción de la solución:  
1. Comprueba si el jugador es 'crupier' o 'jugador'.  
2. Imprime el valor total de la mano y las cartas que la componen.  
3. Retorna la mano para reutilización.  
Funciones auxiliares:  
- `valor-mano`: Calcula el valor total de una mano.  
|#

(define (mostrar-jugador jugador mano)
  (cond
    ((eq? jugador 'crupier) (printf "Crupier: ~a (~a)\n" mano (valor-mano mano 'jugador)
                                    ) mano)
    ((eq? jugador 'jugador) (printf "Jugador: ~a (~a)\n" mano (valor-mano mano 'crupier)
                                    ) mano)
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: apostar-fichas  
Descripción: Solicita al jugador que introduzca una cantidad de fichas para apostar y valida la entrada.  
Parámetros:  
- `fichas-disponibles`: Número total de fichas que el jugador tiene disponibles para apostar.  
Devuelve:  
- Un número que representa la cantidad de fichas apostadas si es válido.  
Descripción de la solución:  
1. Muestra al jugador las fichas disponibles y solicita una cantidad de fichas a apostar.  
2. Valida la entrada:  
   - Comprueba que la cantidad ingresada sea uno de los valores permitidos (20, 50, 100, 200, 500, 1000).  
   - Verifica que el jugador tenga suficientes fichas disponibles para cubrir la apuesta.  
3. Si la entrada es válida, devuelve la cantidad apostada.  
4. Si la entrada es inválida, informa al jugador y repite el proceso hasta que se ingrese una cantidad válida.  
Funciones auxiliares:  
- Ninguna.  
|#


(define (apostar-fichas fichas-disponibles)
  (let loop ()
    (displayln "¿Cuantas fichas quieres apostar? (20, 50, 100, 200, 500, 1000): \n")
    (printf "Disponibles: ~a\n" fichas-disponibles)
    (let 
        ((fichas (string->number (read-line))))    
      (cond
        ;; el número de fichas es correcto
        ((and (or
          (= 20 fichas)
          (= 50 fichas)
          (= 100 fichas)
          (= 200 fichas)
          (= 500 fichas)
          (= 1000 fichas)
          ) (<= fichas fichas-disponibles)) fichas)
        (else (display "Fichas insuficientes o erroneas\n") (loop))
     )
    ))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: cantidad-fichas!  
Descripción: Solicita al jugador que ingrese una cantidad de fichas para jugar y valida la entrada.  
Parámetros:  
- Ninguno.  
Devuelve:  
- Un número que representa la cantidad de fichas ingresadas por el jugador, si la entrada es válida.  
Descripción de la solución:  
1. Solicita al jugador que ingrese una cantidad de fichas para jugar.  
2. Valida la entrada:  
   - Comprueba que la cantidad ingresada sea un número real y mayor que 0.  
3. Si la entrada es válida, devuelve el número de fichas ingresadas.  
4. Si la entrada es inválida, informa al jugador y repite el proceso hasta que se ingrese una cantidad válida.  
Funciones auxiliares:  
- Ninguna.  
|#


(define (cantidad-fichas!)
  (let loop ()
    (displayln "¿Con cuantas fichas quieres jugar?")
    (let
        (
         (fichas (string->number (read-line))))    
      (cond
        ;; el número de fichas es correcto
        ((and
          (real? fichas)
          (> fichas 0)
          ) fichas)
        (else (display "Fichas erroneas\n") (loop))
     )
    ))
  )

;                                   TIPOS DE DATO ABSTRACTO
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tipo de dato JUGADA

#|
Nombre: crear-jugada  
Descripción: Crea una jugada con la mano, fichas disponibles y la apuesta del jugador.  
Parámetros:  
- mano: La mano del jugador, representada como una lista de cartas.  
- fichas-disponibles: La cantidad de fichas disponibles para el jugador.  
- apuesta: La cantidad de fichas apostadas por el jugador.  
Devuelve:  
- Una lista de asociaciones que contiene la mano, las fichas disponibles y la apuesta.  
Descripción de la solución:  
1. Crea una lista de asociaciones con tres elementos:  
   - 'mano: la mano del jugador.  
   - 'fichas-disponibles: las fichas disponibles para el jugador.  
   - 'apuesta: la apuesta realizada por el jugador.  
2. Devuelve la lista de asociaciones.  
Funciones auxiliares:  
- Ninguna.  
|#

(define (crear-jugada mano fichas-disponibles apuesta)
  (list
     (list 'mano mano)
     (list 'fichas-disponibles fichas-disponibles)
     (list 'apuesta apuesta)
   )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: mano?  
Descripción: Devuelve la mano de una jugada.  
Parámetros:  
- jugada: Una lista de asociaciones que contiene información sobre la jugada.  
Devuelve:  
- La mano asociada a la jugada.  
Descripción de la solución:  
1. Utiliza la función `assoc` para obtener la asociación con la clave 'mano'.  
2. La función `cadr` se usa para devolver el valor de la mano, que es el segundo elemento de la lista de la asociación.  
Funciones auxiliares:  
- `assoc`: Busca una clave dentro de una lista de asociaciones.  
|#


(define (mano? jugada)
  (cadr (assoc 'mano jugada))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: fichas-disponibles?  
Descripción: Devuelve las fichas disponibles en una jugada.  
Parámetros:  
- jugada: Una lista de asociaciones que contiene información sobre la jugada.  
Devuelve:  
- Las fichas disponibles asociadas a la jugada.  
Descripción de la solución:  
1. Utiliza la función `assoc` para obtener la asociación con la clave 'fichas-disponibles'.  
2. La función `cadr` se usa para devolver el valor de las fichas disponibles, que es el segundo elemento de la lista de la asociación.  
Funciones auxiliares:  
- `assoc`: Busca una clave dentro de una lista de asociaciones.  
|#

(define (fichas-disponibles? jugada)
  (cadr (assoc 'fichas-disponibles jugada))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: apuesta?  
Descripción: Devuelve la apuesta realizada en una jugada.  
Parámetros:  
- jugada: Una lista de asociaciones que contiene información sobre la jugada.  
Devuelve:  
- La apuesta asociada a la jugada.  
Descripción de la solución:  
1. Utiliza la función `assoc` para obtener la asociación con la clave 'apuesta'.  
2. La función `cadr` se usa para devolver el valor de la apuesta, que es el segundo elemento de la lista de la asociación.  
Funciones auxiliares:  
- `assoc`: Busca una clave dentro de una lista de asociaciones.  
|#

(define (apuesta? jugada)
  (cadr (assoc 'apuesta jugada))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tipo de dato RONDA

#|
Nombre: crear-ronda  
Descripción: Crea una nueva ronda con el estado actual del juego.  
Parámetros:  
- ganador: El jugador que ha ganado la ronda.  
- fichas-jugador: El número de fichas del jugador al inicio de la ronda.  
- fichas-crupier: El número de fichas del crupier al inicio de la ronda.  
- mazo: El mazo de cartas actual.  
Devuelve:  
- Una lista de asociaciones que contiene los datos de la ronda.  
Descripción de la solución:  
1. Se crea una lista de asociaciones que almacena los valores del ganador, las fichas del jugador y el crupier, y el mazo de cartas.  
2. Cada elemento de la lista está asociado a una clave correspondiente.  
Funciones auxiliares:  
- Ninguna.  
|#

(define (crear-ronda ganador fichas-jugador fichas-crupier mazo)
  (list
     (list 'ganador ganador)
     (list 'fichas-jugador fichas-jugador)
     (list 'fichas-crupier fichas-crupier)
     (list 'mazo mazo)
   )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: ganador?  
Descripción: Obtiene el ganador de una ronda.  
Parámetros:  
- ronda: La ronda del juego representada como una lista de asociaciones.  
Devuelve:  
- El valor asociado a la clave 'ganador' de la ronda, que indica quién ha ganado.  
Descripción de la solución:  
1. Se utiliza `assoc` para buscar el valor asociado a la clave 'ganador' en la lista de asociaciones.  
2. La función devuelve ese valor, que puede ser 'jugador', 'crupier', o cualquier otro valor asignado como ganador.  
Funciones auxiliares:  
- Ninguna.  
|#

(define (ganador? ronda)
  (cadr (assoc 'ganador ronda))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: mazo?  
Descripción: Obtiene el mazo de cartas de una ronda.  
Parámetros:  
- ronda: La ronda del juego representada como una lista de asociaciones.  
Devuelve:  
- El valor asociado a la clave 'mazo' de la ronda, que contiene el mazo de cartas.  
Descripción de la solución:  
1. Se utiliza `assoc` para buscar el valor asociado a la clave 'mazo' en la lista de asociaciones de la ronda.  
2. La función devuelve ese valor, que es el mazo de cartas de la ronda actual.  
Funciones auxiliares:  
- Ninguna.  
|#

(define (mazo? ronda)
  (cadr (assoc 'mazo ronda))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: fichas-jugador?  
Descripción: Obtiene las fichas disponibles del jugador en una ronda.  
Parámetros:  
- ronda: La ronda del juego representada como una lista de asociaciones.  
Devuelve:  
- El valor asociado a la clave 'fichas-jugador' de la ronda, que contiene las fichas del jugador.  
Descripción de la solución:  
1. Se utiliza `assoc` para buscar el valor asociado a la clave 'fichas-jugador' en la lista de asociaciones de la ronda.  
2. La función devuelve ese valor, que representa la cantidad de fichas disponibles para el jugador en la ronda actual.  
Funciones auxiliares:  
- Ninguna.  
|#

(define (fichas-jugador? ronda)
  (cadr (assoc 'fichas-jugador ronda))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: fichas-crupier?  
Descripción: Obtiene las fichas disponibles del crupier en una ronda.  
Parámetros:  
- ronda: La ronda del juego representada como una lista de asociaciones.  
Devuelve:  
- El valor asociado a la clave 'fichas-crupier' de la ronda, que contiene las fichas del crupier.  
Descripción de la solución:  
1. Se utiliza `assoc` para buscar el valor asociado a la clave 'fichas-crupier' en la lista de asociaciones de la ronda.  
2. La función devuelve ese valor, que representa la cantidad de fichas disponibles para el crupier en la ronda actual.  
Funciones auxiliares:  
- Ninguna.  
|#

(define (fichas-crupier? ronda)
  (cadr (assoc 'fichas-crupier ronda))
  )


;                                 IMPLEMENTACIÓN DE LOS TURNOS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: turno-jugador
Descripción: Gestiona el turno del jugador, permitiéndole pedir carta, plantarse o doblar la apuesta.
Parámetros:
- mano-mazo: La mano del jugador y el mazo restante.
- fichas-disponibles: Las fichas que tiene el jugador disponibles para apostar.
- apuesta: La cantidad apostada en la ronda.
- pidio?: Si el jugador ya ha pedido una carta.
- tipo: El tipo de acción que se está realizando ('fichas para apuesta, etc).
Devuelve:
- Una nueva jugada con la mano del jugador, fichas restantes y apuesta actualizada.
Descripción de la solución:
1. El jugador ve su mano y puede optar por pedir carta, plantarse o doblar.
2. Si el jugador supera 21 puntos, termina su turno y se actualizan las fichas disponibles.
3. Si el jugador opta por pedir carta, se le agrega una nueva carta de la parte superior del mazo.
4. Si el jugador opta por plantarse, se termina su turno.
5. Si el jugador decide doblar, verifica si puede hacerlo, duplicando su apuesta y recibiendo una carta adicional.
Funciones auxiliares:
- add-carta-mano
- turno-jugador
|#

(define (turno-jugador mano-mazo fichas-disponibles apuesta pidio? tipo)
  (mover-patita 750 550 750 550 0.4 0.01 tapete)
  (limpiar-figura (lista-a-posn (list (list 650 200) (list 750 200) (list 750 450) (list 650 450))) tapete)
  (let
    (
     (valor-mano-actual (valor-mano (car mano-mazo) 'jugador))
     (mazo (cdr mano-mazo))
     (mano (car mano-mazo))
     (fichas-disponibles fichas-disponibles)
     (apuesta apuesta))
     ;(printf "Jugador: ~a (~a)\n" mano valor-mano-actual)
     (cond
       ; La mano ya supera o iguala el valor de 21
       ((>= valor-mano-actual 21)
        (limpiar-figura (lista-a-posn (list (list 710 510)(list 800 510)(list 800 590)(list 710 590))) tapete)
        (cons (crear-jugada mano (- fichas-disponibles apuesta) apuesta)
              mazo))
       (else
        ;(display "Qué prefieres?\n 1. Pedir\n 2. Plantarte\n 3. Doblar\n")
        (let
         (
          (eleccion
           (do
               ((click (get-mouse-click v1) (get-mouse-click v1))
               (x 0 (posn-x (mouse-click-posn click)))
               (y 0 (posn-y (mouse-click-posn click)))
               )
             ((and (<= 520 y 580)
                   (or
                    (and (<= 240 x 500)(eq? tipo 'fichas))
                    (<= 520 x 600)
                    (<= 620 x 700)))
              (cond
                ((and (<= 240 x 500)(eq? tipo 'fichas)) 3)
                ((<= 520 x 600) 1)
                ((<= 620 x 700) 2)
                                  ))
           ))
          )
          
          (cond
            ; Pedir carta
            ((eq? eleccion 1)
             ;(display "Pide carta.\n")
             (turno-jugador (add-carta-mano mano mazo 'jugador) fichas-disponibles apuesta #t 'fichas))
            ; Plantarse
            ((eq? eleccion 2)
             ;(display "Se planta.\n")
             (limpiar-figura (lista-a-posn (list (list 710 510)(list 800 510)(list 800 590)(list 710 590))) tapete)
             (cons
              (crear-jugada mano (- fichas-disponibles apuesta) apuesta) mazo))
            ; Doblar 
            ((and (eq? eleccion 3))
             (cond
               ; Si ya pidió, no puede doblar
               (pidio?
                 (display "No puedes doblar una vez pides.\n")
                 (turno-jugador (cons mano mazo) fichas-disponibles apuesta #t 'fichas))
               ; Hay suficientes fichas
               ((>= fichas-disponibles (* 2 apuesta))
                  (contador-jugador (- fichas-disponibles (* 2 apuesta)) 'fichas)
                  ;(printf "Doblar la apuesta ~a * 2 = ~a\n" apuesta (* 2 apuesta))
                  (let*
                      ((resultado (add-carta-mano mano mazo 'jugador))
                       (mano (car resultado))
                       (mazo (cdr resultado)))
                  (limpiar-figura (lista-a-posn (list (list 650 200) (list 750 200) (list 750 450) (list 650 450))) tapete)
                  (limpiar-figura (lista-a-posn (list (list 710 510)(list 800 510)(list 800 590)(list 710 590))) tapete)
                  ;(printf "Jugador: ~a (~a)\n" mano (valor-mano mano 'jugador))
                  
                  (cons (crear-jugada mano (- fichas-disponibles (* 2 apuesta)) (* 2 apuesta))
                        mazo))
                  )
               ; No hay suficientes fichas
               (else
                (display "No hay suficientes fichas para doblar.\n")
                (limpiar-figura (lista-a-posn (list (list 710 510)(list 800 510)(list 800 590)(list 710 590))) tapete)
                (turno-jugador (cons mano mazo) fichas-disponibles apuesta #t 'fichas))
                ))
            (else (display "FUERA"))
             )
            )
        ))
       ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: turno-crupier
Descripción: Gestiona el turno del crupier, tomando cartas hasta que su mano supere 16 puntos.
Parámetros:
- mano-mazo: La mano actual del crupier y el mazo restante.
- fichas-disponibles: Las fichas disponibles para el crupier.
- apuesta: La apuesta realizada en la ronda.
Devuelve:
- Una nueva jugada con la mano del crupier, fichas restantes y la apuesta actualizada.
Descripción de la solución:
1. El crupier evalúa el valor de su mano.
2. Si su valor es mayor a 16, termina su turno y actualiza las fichas y apuesta.
3. Si su valor es menor o igual a 16, el crupier pide una carta adicional.
Funciones auxiliares:
- add-carta-mano
|#

(define (turno-crupier mano-mazo fichas-disponibles apuesta)
  (limpiar-figura (lista-a-posn (list (list 650 200) (list 750 200) (list 750 450) (list 650 450))) tapete)
  (let
      (
       (valor-mano-actual (valor-mano (car mano-mazo) 'crupier))
       (mazo (cdr mano-mazo))
       (mano (car mano-mazo))
       (fichas-disponibles fichas-disponibles)
       (apuesta (if (> apuesta fichas-disponibles) fichas-disponibles apuesta)))
      ;(printf "Crupier: ~a (~a)\n" mano valor-mano-actual)
      (cond
        ((> valor-mano-actual 16)
         (cons (crear-jugada mano (- fichas-disponibles apuesta) apuesta)
               mazo)
         )
        (else (turno-crupier (add-carta-mano mano mazo 'crupier) fichas-disponibles apuesta))
        ))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: reparto-inicial
Descripción: Reparte las cartas iniciales al crupier y al jugador, moviendo las cartas en la pantalla.
Parámetros:
- mazo: El mazo de cartas que contiene todas las cartas por repartir.
Devuelve:
- Una lista con la mano del crupier, la mano del jugador y el mazo restante.
Descripción de la solución:
1. Se asigna la primera carta del mazo al crupier y las siguientes dos al jugador.
2. Se mueve la carta del crupier a su lugar y se dibuja en la pantalla.
3. Se mueve la carta del jugador a su lugar y se dibuja en la pantalla.
4. Se actualiza la mano del crupier y del jugador y se devuelve el mazo restante.
Funciones auxiliares:
- mover-patita-carta
- dibujar-carta
- limpiar-figura
|#

(define (reparto-inicial mazo)
  (let*
      (
       (mano-crupier (list (car mazo)))
       (mano-jugador (list (cadr mazo) (caddr mazo)))
       )
    ; Carta crupier
    (mover-patita-carta 700 250 200 250 0.3 1. tapete)
    (dibujar-carta 200 250 0.3 (cadar mano-crupier) (caar mano-crupier) valores)
    (mover-patita 300 250 700 250 0.4 1. tapete)
    
    (limpiar-figura (lista-a-posn (list (list 650 200) (list 750 200) (list 750 450) (list 650 450))) tapete)
    ; Carta jugador
    (mover-patita-carta 700 400 200 400 0.3 1. tapete)
    (dibujar-carta 200 400 0.3 (cadar mano-jugador) (caar mano-jugador) valores)
    (mover-patita 300 400 700 400 0.4 1. tapete)
    (limpiar-figura (lista-a-posn (list (list 650 200) (list 750 200) (list 750 450) (list 650 450))) tapete)
    (mover-patita-carta 700 400 290 400 0.3 1. tapete)
    (dibujar-carta 290 400 0.3 (cadadr mano-jugador) (caadr mano-jugador) valores)
    (mover-patita 400 400 700 400 0.4 1. tapete)
    (limpiar-figura (lista-a-posn (list (list 650 200) (list 750 200) (list 750 450) (list 650 450))) tapete)
    (append (list mano-crupier) (list mano-jugador) (list (cdddr mazo)))
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: ronda
Descripción: Ejecuta una ronda de juego entre el jugador y el crupier, actualizando las manos y las apuestas.
Parámetros:
- mazo: El mazo de cartas para repartir.
- fichas-crupier: Las fichas disponibles del crupier.
- fichas-jugador: Las fichas disponibles del jugador.
- tipo: El tipo de jugada, que puede ser 'fichas'.
Devuelve:
- Una ronda con el resultado de la mano, el ganador, las fichas actualizadas y el mazo restante.
Descripción de la solución:
1. Se realiza el reparto inicial de cartas entre el crupier y el jugador.
2. Se solicita la apuesta del jugador si es necesario.
3. Se actualiza la mesa con las manos del jugador y del crupier.
4. Se manejan los turnos de ambos jugadores.
5. Se calculan los valores de las manos y se verifica el resultado de la ronda:
    - Si el jugador gana, se actualizan las fichas.
    - Si el crupier gana, también se actualizan las fichas.
    - Si hay empate, no hay cambios.
    - Si algún jugador se pasa de 21, se determina el ganador.
Funciones auxiliares:
- reparto-inicial
- apostar
- actualizar-mesa
- turno-jugador
- turno-crupier
- valor-mano
- crear-ronda
|#

(define (ronda mazo fichas-crupier fichas-jugador tipo)
  (let*
      (
       ; Reparto inicial
       (reparto (reparto-inicial mazo))
       ; Definición de las manos
       (mano-crupier (car reparto))
       (mano-jugador (cadr reparto))
       ; Definición del mazo
       (mazo (caddr reparto))
       ; Pedir apuesta
       (apuesta (if (eq? tipo 'fichas) (apostar fichas-jugador) 0))
       ; Actualizar la mesa
       (upload- (actualizar-mesa mano-crupier mano-jugador fichas-crupier fichas-jugador tipo))
       ; Turnos
       (resultado-jugador (turno-jugador (cons mano-jugador mazo) fichas-jugador apuesta #f tipo))
       (resultado-crupier (turno-crupier (cons mano-crupier (cdr resultado-jugador)) fichas-crupier (apuesta? (car resultado-jugador))))
       ; Valores de las manos
       (valor-jugador (valor-mano (mano? (car resultado-jugador)) 'jugador))
       (valor-crupier (valor-mano (mano? (car resultado-crupier)) 'crupier))
       ; Mazo resultante
       (mazo-final (cdr resultado-crupier))
       ; Fichas actualizadas
       (fichas-jugador-a (fichas-disponibles? (car resultado-jugador)))
       (fichas-crupier-a (fichas-disponibles? (car resultado-crupier)))
       ; Apuesta final por si dobla
       (apuesta-final (apuesta? (car resultado-jugador))) 
       )
    
    (sleep 2)
    (cond
      ; No empate y debajo o igual a 21
      ((and (<= valor-jugador 21) (<= valor-crupier 21) (not (= valor-jugador valor-crupier)))
       (if (> valor-jugador valor-crupier)
       (crear-ronda 'jugador (+ fichas-jugador-a (* apuesta-final 2)) fichas-crupier-a mazo-final)
       (crear-ronda 'crupier fichas-jugador-a (+ fichas-crupier-a (* apuesta-final 2)) mazo-final)))
      ; Ambos se pasan o empate
      ((or
        (and (> valor-jugador 21) (> valor-crupier 21))
        (= valor-jugador valor-crupier)) (crear-ronda 'empate fichas-jugador fichas-crupier mazo-final))
      ; Se pasa el crupier y gana jugador
      ((and (<= valor-jugador 21) (> valor-crupier 21)) (crear-ronda 'jugador (+ fichas-jugador-a (* apuesta-final 2)) fichas-crupier-a mazo-final))
      ; Se pasa el jugador y gana crupier
      ((and (> valor-jugador 21) (<= valor-crupier 21)) (crear-ronda 'crupier fichas-jugador-a (+ fichas-crupier-a (* apuesta-final 2)) mazo-final))    
    )
  ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: blackjack-fichas
Descripción: Función que ejecuta un juego de Blackjack utilizando fichas.
Parámetros:
- Ninguno.
Devuelve:
- Ninguno.
Descripción de la solución:
1. Se inicia el juego con una mesa vacía.
2. Se solicita al jugador la cantidad de fichas con las que desea jugar.
3. Se inicia la primera ronda, con las fichas del jugador y crupier, y el mazo barajado.
4. El resultado de la ronda se evalúa:
    - Si las fichas del jugador son menores a 20, el crupier gana la partida.
    - Si las fichas del crupier son menores a 20, el jugador gana la partida.
5. Si hay un ganador en la ronda, se muestra el mensaje correspondiente.
6. Si hay empate, se indica el empate.
7. El ciclo de rondas continúa hasta que no haya más fichas suficientes para seguir jugando.
Funciones auxiliares:
- mesa
- cantidad
- ronda
- barajar
- crear-mazo
- mensaje-ganador
|#

(define (blackjack-fichas)
  ; Ficha inicial
  (mesa 0 0 'fichas)  
  (let
    (
     ; Pide las fichas a usar
     (fichas (cantidad))
     )
    ; Actualiza mesa
    (mesa fichas fichas 'fichas)
    ; Bucle del juego
    (let juego
    (
     ; Obtención de la ronda
     (resultado-ronda (ronda (barajar (crear-mazo)) fichas fichas 'fichas))
    )
      
      (cond
        ; Gana crupier: jugador no puede apostar
        ((< (fichas-jugador? resultado-ronda) 20) (mensaje-ganador 'partida 'crupier))
        ; Gana jugador: crupier no puede apostar
        ((< (fichas-crupier? resultado-ronda) 20) (mensaje-ganador 'partida 'jugador))
        
        (else
         (cond
           ; Gana jugador
           ((eq? (ganador? resultado-ronda) 'jugador) (mensaje-ganador 'ronda 'jugador))
           ; Gana crupier
           ((eq? (ganador? resultado-ronda) 'crupier) (mensaje-ganador 'ronda 'crupier))
           ; Empate
           (else (display "Empate\n")))
         ; Actualización de la mesa
         (mesa (fichas-crupier? resultado-ronda) (fichas-jugador? resultado-ronda) 'fichas)
         ; Nuevo bucle del juego
         (juego
          (ronda (mazo? resultado-ronda) (fichas-crupier? resultado-ronda) (fichas-jugador? resultado-ronda) 'fichas))))
  )))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: blackjack-ganar
Descripción: Función que ejecuta el ciclo de rondas de un juego de Blackjack hasta que uno de los jugadores (jugador o crupier) gane una cantidad de rondas establecida.
Parámetros:
- rondas: Número total de rondas que se deben jugar.
Devuelve:
- Ninguno.
Descripción de la solución:
1. Se inicia el juego con la mesa en un estado 'ganar'.
2. Se baraja un nuevo mazo para cada ronda y se inicia el ciclo de rondas.
3. Se lleva un conteo de las rondas ganadas por el jugador y el crupier.
4. Si el crupier gana más de la mitad de las rondas, se declara el crupier como ganador de la partida.
5. Si el jugador gana más de la mitad de las rondas, se declara el jugador como ganador de la partida.
6. Si no se cumple ninguna de las condiciones anteriores, se continúa con la siguiente ronda y el resultado de la ronda se evalúa:
    - Si el jugador gana la ronda, se incrementa el contador de rondas ganadas por el jugador.
    - Si el crupier gana la ronda, se incrementa el contador de rondas ganadas por el crupier.
7. El ciclo de rondas continúa hasta que uno de los jugadores gane más de la mitad de las rondas.
Funciones auxiliares:
- mesa
- ronda
- mensaje-ganador
- barajar
- crear-mazo
|#

(define (blackjack-ganar rondas)
  ; Mesa inicial
  (mesa 0 0 'ganar)
  ; Bucle juego
  (let juego
    (
     ; Resultados de ronda
     (resultado-ronda (ronda (barajar (crear-mazo)) 0 0 'ganar))
     (rondas-jugador 0)
     (rondas-crupier 0)
     )
      (let
           (
            ; Rondas actualizadas tras jugar
            (rondas-jugador (+ rondas-jugador (if (eq? (ganador? resultado-ronda) 'jugador) 1 0)))
            (rondas-crupier (+ rondas-crupier (if (eq? (ganador? resultado-ronda) 'crupier) 1 0)))
            )
    (cond
      ; Gana crupier: más de la mitad de rondas ganadas
      ((> rondas-crupier (/ rondas 2)) (mensaje-ganador 'partida 'crupier))
      ; Gana jugador más de la mitad de rondas ganadas
      ((> rondas-jugador (/ rondas 2)) (mensaje-ganador 'partida 'jugador))
      (else
       (cond
         ; Gana jugador la ronda
         ((eq? (ganador? resultado-ronda) 'jugador) (mensaje-ganador 'ronda 'jugador))
         ; Gana crupier la ronda
         ((eq? (ganador? resultado-ronda) 'crupier) (mensaje-ganador 'ronda 'crupier))
         (else (display "Empate\n")))
       
       ; Actualizar mesa
       (mesa rondas-crupier
             rondas-jugador 'ganar)
       ; Lanzar bucle de nuevo
       (juego
        (ronda (mazo? resultado-ronda)
               rondas-crupier
               rondas-jugador
               'ganar)
        rondas-jugador
        rondas-crupier))))
  ))