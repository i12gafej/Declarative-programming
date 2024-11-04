;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   modulo-vector
Objetivo:
   Calcula el módulo de un vectos
Parámetros:
 - v: vector
Resultado:
   Numérico.
Descripción de la solucion:
   Dado un vector, te devuelve el módulo calculado como:
   |v| = (sqrt x1^2 + x2^2 + x3^2 .... + xn^2)
Funciones auxiliares a las que llama:
   ninguno
|#

(define (modulo-vector v)
  (do
      ;; Variables iterativas
      (
       (i 1 (+ i 1))
       (resultado (sqr (vector-ref v 0)) (+ (sqr (vector-ref v i)) resultado))
       )
      ;; Condición de parada
      ((= i (vector-length v)) (sqrt resultado))
   )
)

;(modulo-vector #(4 4 4 4))
;(modulo-vector #(3 4))
;(modulo-vector #(3 3 3 3))

#|
Resultados
8
5
6
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   media-aritmetica
Objetivo:
   Calcula la media aritmetica de un vectos
Parámetros:
 - v: vector
Resultado:
   Numérico.
Descripción de la solucion:
   Dado un vector, te devuelve la media aritmética:
   |v| = (x1 + x2 + x3 .... + xn)/n
Funciones auxiliares a las que llama:
   ninguno
|#

(define (media-aritmetica v)
  (do
      ;; Variables iterativas
      (
       (i 1 (+ i 1))
       (resultado (vector-ref v 0) (+ (vector-ref v i) resultado 0.))
       )
      ;; Condición de parada
      ((= i (vector-length v)) (/ resultado (vector-length v)))
   )
)

;(media-aritmetica #(2 2 3 1 2 4 0 6 -2))
;(media-aritmetica #(1 2 3 4 5 6 7 8 9))
;(media-aritmetica #(0 2 4 6 8 10 12 14 16 18 20))

#|
Resultados:
2.0
5.0
10.0
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   extraer-columna
Objetivo:
   Dada una matriz de dos dimensiones, extrae la columna indicada
Parámetros:
 - m: matriz
 - col: columna a extraer
Resultado:
   Vector de la columna.
Descripción de la solucion:
   Dada una matriz
    1. 2. 3. 2.
    4. 5. 6. 4.
    7. 8. 9. 7.
   la columna 1 sería la siguiente: (2. 5. 8.)
Funciones auxiliares a las que llama:
   ninguno
|#


(define (extraer-columna m col) 
   ;; Cuerpo Let * 
  (cond
    ;; Es un vector
   ((not (vector? m)) "No es un vector")
   ;; Comprobar que es un vector de vectores
   (
    (do
        (
         (tam (vector-length m))
         (i 1 (+ i 1))
         (actual (vector-ref m 0) (vector-ref m i))
        )
      ((or (not (vector? actual)) (= i tam)) (not (vector? actual)))
      )
    "No es un vector de vectores")
   ;; Comprobar que todas las filas sean iguales de tamaño
   (
    (do
        (
         (tam (vector-length m))
         (i 2 (+ i 1))
         (actual (vector-length (vector-ref m 0)) siguiente)
         (siguiente (vector-length (vector-ref m 1)) (vector-length (vector-ref m i)))
        )
      ((or (not (= actual siguiente)) (= i tam)) (not (= actual siguiente)))
      )
    "Filas desiguales")
   ;; Comprobar si la columna está en el rango posible
   ((< (- (vector-length (vector-ref m 0)) 1) col) "Fuera de rango")
   ;; Si todo lo demás está correcto
   (else
    (let*
   ;; Variables let * 
   (
    (fil-size (vector-length m))
    (col-size (vector-length (vector-ref m 0)))
    (resultado (make-vector fil-size))
    )
    (do
     ;; Variables iterativas
     (
      ;; Incrementa cuando se llega al final de la fila
      (i 0 (if (= (+ j 1) col-size) (+ i 1) i))
      ;; Incrementa mientras que no llegue al final de la fila
      ;; , si no se pone a 0 y sigue
      (j 0 (if (= (modulo (+ j 1) col-size) 0) 0 (+ j 1)))
     )
     ;; Condición parada
     ((and (= i fil-size)) resultado)
      ;; Cuerpo do
       (if (= j col)
         (vector-set! resultado i (vector-ref (vector-ref m i) j))
         #f
        )
    )))))

;(extraer-columna #(#(1. 2. 3. 2.) #(4. 5. 6. 4.) #(7. 8. 9. 7.)) 0)
;(extraer-columna #(#(1. 2. 3. 2.) #(4. 5. 6. 4.) #(7. 8. 9. 7.)) 4)
;(extraer-columna #(#(1. 2. 3. 2.) #(4. 5. 6. 4. 8.) #(7. 8. 9. 7.)) 0)
;(extraer-columna #("cadema" "Cadena" #(7. 8. 9. 7.)) 0)
;(extraer-columna 'matriz 0)

#|
Resultado:
#(1.0 4.0 7.0)
"Fuera de rango"
"Filas desiguales"
"No es un vector de vectores"
"No es un vector"
|#


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   maxiMin
Objetivo:
   Dada una matriz de dos dimensiones, devuelva el máximo de
   los valores mínimos de las columnas de la matriz
Parámetros:
 - m: matriz
Resultado:
   Numérico.
Descripción de la solucion:
   Dada una matriz
    1. 2. 3. 2.
    4. 5. 6. 4.
    7. 8. 9. 7.
   los valores mínimos de cada matriz son: 1 2 3 2,
   El valor máximo de estos mínimos es 3.
Funciones auxiliares a las que llama:
   extraer-columna, minimo
|#
(define (minimo v)  
   (let
       ;; Variables locales
       ((minimo (vector-ref v 0))
        (tam (vector-length v))
        )
     ;; Cuerpo del let
    (do
       ;; Variables iterativas
       (
         (j 1 (+ j 1))
       )
      ;; Condición de parada
      ((= tam j) minimo)
      ;; Cuerpo del DO
      (if (> minimo (vector-ref v j))
          (set! minimo (vector-ref v j))
          0)
      )
   )
 )

(define (maxiMin m)
  (cond
    ;; m no es un vector
    ((not (vector? m)) "No es un vector")
    ;; m no es un vector de vectores
    (
    (do
        (
         (tam (vector-length m))
         (i 1 (+ i 1))
         (actual (vector-ref m 0) (vector-ref m i))
        )
      ((or (not (vector? actual)) (= i tam)) (not (vector? actual)))
      )
    "No es un vector de vectores")
    ;; Comprobar que todas las filas sean iguales de tamaño
   (
    (do
        (
         (tam (vector-length m))
         (i 2 (+ i 1))
         (actual (vector-length (vector-ref m 0)) siguiente)
         (siguiente (vector-length (vector-ref m 1)) (vector-length (vector-ref m i)))
        )
      ((or (not (= actual siguiente)) (= i tam)) (not (= actual siguiente)))
      )
    "Filas desiguales")
   ;; Todo está bien
   (else
     (let*
      ;; Variables secuenciales locales
      (
       (fil-size (vector-length m))
       (col-size (vector-length (vector-ref m 0)))
       (resultado (make-vector col-size))
       (valor (minimo (extraer-columna m 0)))
       )
       ;; Cuerpo  del Let*
       (do
           (
            (i 2 (+ i 1))
            
            ;; Valor minimo de la columna siguiente
            (actual
                (minimo (extraer-columna m 1))
                (minimo (extraer-columna m i)))
            )
            ;; Condición de parada
            ((= i col-size) valor)
            ;; Cuerpo del DO
            
            (if (< valor actual)
                (set! valor actual)
                0
                )
        )
      )
    )
  )  
 )

;(maxiMin #(#(1. 2. 3. 2.) #(4. 5. 6. 4.) #(7. 8. 9. 7.)))
;(maxiMin #(#(1. 2. 3. 2.) #(4. 5. 6. 4. 7.) #(7. 8. 9. 7.)))
;(maxiMin #("cadena" #(4. 5. 6. 4.) #(7. 8. 9. 7.)))
;(maxiMin '(#(1. 2. 3. 2.) #(4. 5. 6. 4.) #(7. 8. 9. 7.)))

#|
Resultado:
3.0
"Filas desiguales"
"No es un vector de vectores"
"No es un vector"
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 5. a.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   determinante
Objetivo:
   Dada una matriz cuadrada 3x3 calcula el determinante
Parámetros:
 - m: matriz
Resultado:
   Numérico.
Descripción de la solucion:
   Dada una matriz
    
    x1 y1 z1 
    x2 y2 z2     = x1y2z3 + x2y3z1 + x3y1z2 - x1y3z2 - x2y1z3 - x3y2z1 
    x3 y3 z3

Funciones auxiliares a las que llama:
   extraer-columna
|#

;; x = 0, 1, 2
;; y = 1, 2, 0 y 2, 0, 1
;; z = 2, 0, 1 y 1, 2, 0

(define (determinante m)
  (let
      ;; Variables locales
      ((det 0)
      (x (extraer-columna m 0))
      (y (extraer-columna m 1))
      (z (extraer-columna m 2)))
      ;; Cuerpo de Let
      (do
          ;;Variables iterativas
          (
           (i 0 (+ i 1))
           )
         ;; Condición de parada
        ((= i 3) det)
        ;; Cuerpo del DO
        (set! det (+ det      ;; Se le suma al determinante
         (*(vector-ref x i)   ;; x_i donde i = i
           (vector-ref y (modulo (+ i 1) 3)) ;; y_i donde i = ((i+1)%3)
           (vector-ref z (modulo (+ i 2) 3)));; z_i donde i = ((i+2)%3)
         (- (* (vector-ref x i) ;; x_i donde i = i
           (vector-ref y (modulo (+ i 2) 3)) ;; y_i donde i = ((i+2)%3)
           (vector-ref z (modulo (+ i 1) 3)))))) ;; z_i donde i = ((i+1)%3)
       )
      )
 )
;(determinante #(#(1. 2. 3. ) #(4. 5. 6. ) #(7. 8. 9. )))
;(determinante #(#(1. 0 0 ) #(0 1 0 ) #(0 0 1 )))
;(determinante #(#(1 2 3 ) #(3 1 2 ) #(2 3 1 )))

#|
Resultados:
0.0
1.0
18
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 5. b.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   area-triangulo
Objetivo:
   Dados tres vertices, se obtiene el area de un triangulo
Parámetros:
 - x1: coordenada x del P1
 - y1: coordenada y del P1
 - x2: coordenada x del P2
 - y2: coordenada y del P2
 - x3: coordenada x del P3
 - y3: coordenada y del P3
Resultado:
   Numérico.
Descripción de la solucion:
   Dados los puntos P1(x1,y1), P2(x2,y2) y P3(x3,y3)
   El area viene dada por:
   
   área(P1, P2, P3) = valor_absoluto (
 
             |x1 y1 1|
       1/2 · |x2 y2 1|
             |x3 y3 1|
)

Funciones auxiliares a las que llama:
   determinante
|#

(define (area-triangulo x1 y1 x2 y2 x3 y3)
  (abs (* (/ 1 2)(determinante (vector (vector x1 y1 1)(vector x2 y2 1)(vector x3 y3 1)))))
  )

;(area-triangulo 0 0 0 4 5 0)
;(area-triangulo 7 2 9 4 5 2)

#|
Resultados:
10
2
|#


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 6.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   construir-lista
Objetivo:
   Devuelve una lista con n elementos procesados
   mediante la función indicada
Parámetros:
 - n: número de elementos de la lista
 - f: proceso que aplicarle
Resultado:
   Lista.
Descripción de la solucion:
   Dados un número y un procedimiento se crea una nueva lista
   compuesta por los resultados obtenidos al aplicar el procedimiento a los
   valores comprendidos entre 0 y n-1.
   (construir-lista n f) --> (f(0) f(1) f(2) ... f(n-1))

Funciones auxiliares a las que llama:
   ninguno
|#

(define (construir-lista n f)
  (cond
    ;; Condición de parada: es el final de la lista
    ((= n 1) (list (f (- n 1))))
    ;; Si no, une con los demás elementos
    (else
       (append
        (construir-lista (- n 1) f)
        (list (f (- n 1))) ;; n-1 porque es de 0 a n - 1
       )
     )))


;(construir-lista 4 sqrt)
;(construir-lista 4 (lambda (x) (* x x)))

#|
Resultados:
(0 1 1.4142135623730951 1.7320508075688772)
(0 1 4 9)
|#


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 7.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   primos-menores
Objetivo:
   Dado un número, se devuelve una lista con los
   primos menores o iguales a dicho número
Parámetros:
 - n: número del que calcular los primos menores
Resultado:
   Lista.
Descripción de la solucion:

Funciones auxiliares a las que llama:
   primo?
|#

(define (primo? n)
  (do
      ;; Variables
      (
       (i 1 (+ i 1))
       (contar 0 (if (= (modulo n i) 0) (+ contar 1) contar) )
       )
      ;;Condición de parada
      ((> i (sqrt n)) (<= contar 1))
      ;; Cuerpo 
   ) 
)



(define (primos-menores n)
  (cond
    ;; Error
    ((< n 2) "Número menor o igual a 1")
    ; Condición de parada: n es 2
    ((= n 2) (list 2))
    ;; Pasa al n - 1 número
    ((primo? n) (append (primos-menores (- n 1)) (list n)))
    ;; Si no es primo, pasa al siguiente
    (else
     (primos-menores (- n 1))
     )
   )
)

;(primos-menores 4)
;(primos-menores 2)
;(primos-menores 9)
;(primos-menores 11)
;(primos-menores 1)


#|
Resultados:
(2 3)
(2)
(2 3 5 7)
(2 3 5 7 11)
"Número menor o igual a 1"
|#


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 8.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   descomposicion-en-primos
Objetivo:
   Dado un número, genera una lista con
   su descomposición en números primos.
Parámetros:
 - n: número del que calcular los primos menores
Resultado:
   Lista.
Descripción de la solucion:
   Descomposición de 2: 2
   Descomposición de 12: 2 2 3
   ; 2, 15, ()
   ; 3, 15, ()
   ; 3, 5, (3)
   ; 3, 5, (3)
   ; 4, 5, (3)
   ; 5, 5, (3)
   ; 5, 1, (3 5)
Funciones auxiliares a las que llama:
   primo?
|#

(define (descomposicion-en-primos n)
  (let ((lista '())        
        (valor-actual n))  
    (cond
      ((< n 2) "Número no descomponible") 
      (else
       (do
           ;; Varaibles iterativas
           ((primo-actual 2 (if (and (primo? primo-actual) (= (modulo valor-actual primo-actual) 0))
                                primo-actual     
                                (+ primo-actual 1)))
            )
           ;; Condición de parada: cuando el valor actual sea 1
           ((= valor-actual 1) lista)  
         (when (and (primo? primo-actual) (= (modulo valor-actual primo-actual) 0))  ;; Si es divisible
           (set! valor-actual (/ valor-actual primo-actual))  ;; Dividimos el valor actual por el primo
           (set! lista (append lista (list primo-actual)))))))))

;(descomposicion-en-primos 9)
;(descomposicion-en-primos 12)
;(descomposicion-en-primos 60)

#|
Resultados:
(3 3)
(2 2 3)
(2 2 3 5)
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 9.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   filtrar-lista-primos
Objetivo:
   Dada una lista de números naturales
   Devuelve una lista con los números primos
Parámetros:
 - l: lista con números primos
Resultado:
   Lista.
Descripción de la solucion:
   Dada la lista (1 2 3 4 5 6 7), devuelve (2 3 5 7)
Funciones auxiliares a las que llama:
   primo?
|#

(define (filtrar-lista-primos l)
  (cond
    ((not (list? l)) "Error con dato de entrada")
    ((null? l) ())
    ((= (car l) 1) (filtrar-lista-primos (cdr l)))
    ((primo? (car l)) (append (list (car l)) (filtrar-lista-primos (cdr l))))
    (else (filtrar-lista-primos (cdr l)))
    )
 )
 
;(filtrar-lista-primos (list 2 3 4 5 6 7))
;(filtrar-lista-primos (list 5 11 13 17 23 77))
;(filtrar-lista-primos (list 4 34 45 33 93 23))

#|
Resultados:
(2 3 5 7)
(5 11 13 17 23)
(23)
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 10.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   filtrar-primos
Objetivo:
   Dada una serie de números naturales
   Devuelve una lista con los números primos
Parámetros:
 - l: lista con números primos
Resultado:
   Lista.
Descripción de la solucion:
   Dada la lista 1 2 3 4 5 6 7, devuelve (2 3 5 7)
Funciones auxiliares a las que llama:
   filtrar-lista-primos
|#

(define filtrar-primos
(lambda lista
     (filtrar-lista-primos lista))
     )

;(filtrar-primos 1 2 3 4 5 6 7 8 9)
;(filtrar-primos 1 3 4 5 6)
;(filtrar-primos )

#|
Resultados:
(2 3 5 7)
(3 5)
()
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 11.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   filtrar-primos-delimitados
Objetivo:
   Dada una serie de números naturales
   Devuelve una lista con los números primos
   delimitados por un rango (sin incuir dichos valores)
Parámetros:
 - l: lista con números primos y delimitadores
Resultado:
   Lista.
Descripción de la solucion:
   Dada la lista 1 2 3 4 5 6 7 y limite 3 7, devuelve (5)
Funciones auxiliares a las que llama:
   filtrar-primos
|#

(define filtrar-primos-delimitados
  (lambda (inicio fin . l)
  (cond
    ((not (list? l)) "Error con dato de entrada")
    ((null? l) ())
    (else
    (let ((lista (list)))
      (do
        ((i 1 (+ i 1)))
         
        ((= (length l) i) (filtrar-lista-primos lista))
        (if (> fin (list-ref l i) inicio)
            (set! lista (append lista (list (list-ref l i)))))
      
        )))
    ))
 )

;(filtrar-primos-delimitados 3 7 1 2 3 4 5 6 7)
;(filtrar-primos-delimitados 2 10 1 2 3 4 5 6 7)
;(filtrar-primos-delimitados 2 10 1 2 3 4 5 6 7)
;(filtrar-primos-delimitados 2 10)

#|
Resultados:
(5)
(3 5 7)
(3 5 7)
()
|#


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 12.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   separar
Objetivo:
   Dada una lista, se devuelve una lista con
   dos sublistas que separan por la mitad los
   valores en posiciones pares e impares.
Parámetros:
 - l: lista
Resultado:
   Lista.
Descripción de la solucion:
   Dada la lista (1 2 3), devuelve ((1 2) (3))
Funciones auxiliares a las que llama:
   ninguna
|#

(define (separar l)
  (cond
    ;; Caso base: lista vacía
    ((null? l) (list '() '()))
    ;; Caso: lista con un solo elemento
    ((null? (cdr l)) (list (list (car l)) '())) 
    (else
     ;; Separación recursiva de cddr de la lista
     (let
         ; Variables del Let
         (
          ; Esta variable se encarga de separar la lista a partir del segundo elemento
          (subseparar (separar (cddr l)))
         )
       ; Se concatena
       (list
        ; el primero elemento de dicha separación
        (cons (car l) (car subseparar))
        ; el segundo elemento de dicha separación
        (cons (cadr l) (cadr subseparar)))
      )
    )
  )
) 
;(separar '(1 2 3 4 5 6))
;(separar '())
;(separar '(1))

#|
Resultados:
((1 3 5) (2 4 6))
(() ())
((1) ())
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 13.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   unir
Objetivo:
   Dadas dos listas, devuelve lso valores ordenados
   en una lista.
Parámetros:
 - l1: lista impares
 - l2: lista pares
Resultado:
   Lista.
Descripción de la solucion:
   o (unir '() '()) → ()
   o (unir '(1) '()) → (1)
   o (unir '(1) '(2)) → (1 2)
   o (unir '(1 3) '(2)) → (1 2 3)
   o (unir '(1 3) '(2 4 5)) → (1 2 3 4 5)
   o (unir '(1 3 5) '(2 4)) → (1 2 3 4 5)
Funciones auxiliares a las que llama:
   ninguna
|#

(define (unir l1 l2)
  (cond
    ;; L1 vacio, devuelve l2
    ((null? l1) l2)
    ;; L2 vacio, develve l1
    ((null? l2) l1)
    ;; Si el primer elemento de l1 es menor igual a l2
    ((<= (car l1) (car l2))
     ;; lo une en ese orden
     (cons (car l1) (unir (cdr l1) l2)))
    ;; Si no al reves
    (else
     (cons (car l2) (unir l1 (cdr l2)))))) 
  
;(unir '() '())
;(unir '(1) '())
;(unir '(1) '(2))
;(unir '(1 3) '(2))
;(unir '(1 3) '(2 4 5))
;(unir '(1 5 50) '(2 4))
;(unir '() '(1 2 5 4 3))

#|
Resultados:
()
(1)
(1 2)
(1 2 3)
(1 2 3 4 5)
(1 2 4 5 50)
(1 2 5 4 3)
|#


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 14.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   mergeSort
Objetivo:
   Dada una lista de números, estos son fragmentados en sublistas hasta no poderse dividir más.
   Una vez divididos, se ordenan en dichas sublistas en cada estrato, hasta unirse al final
   de forma ordenada.
Parámetros:
 - lista: lista de números a ordenar
Resultado:
   Lista.
Descripción de la solucion:
  o Datos de entrada: 5 4 1 3 2
     ▪ División
        ✓ Primera: 5 1 2 | 4 3
        ✓ Segunda: 5 2 | 1 || 4 | 3
        ✓ Tercera: 5 | 2 || 1 ||| 4 | 3
     ▪ Fusión:
        ✓ Primera: 2 5 | 1 || 3 4
        ✓ Segunda: 1 2 5 | 3 4
        ✓ Tercera: 1 2 3 4 5 
Funciones auxiliares a las que llama:
  unir, separar
|#


(define (mergeSort lista)
  (cond
    ;; Caso nulo: cadena vacia
    ((null? lista) '())
    ;; Caso de un solo elemento
    ((null? (cdr lista)) lista)
    ;; Caso general
    (else
     (let*
         ;; Variables secuenciales LET
         (
          ;; Listas separadas
          (sublistas (separar lista))
          ;; Lista izquierda
          (izquierda (car sublistas))
          ;; Lista derecha
          (derecha (cadr sublistas))
         )
       ;; Unir derecha con izquierda ordenadamente
       (unir (mergeSort izquierda) (mergeSort derecha)))))) 


;(mergeSort '(5 4 1 3 2))
;(mergeSort '(10 8 2 4 3 19 6)) 


#|
Resultados:
(1 2 3 4 5)
(2 3 4 6 8 10 19)
|#


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 15.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   mergeSortDatos
Objetivo:
   Dados una cantidad variable de números, estos son ordenados mediante
   mergeSort
Parámetros:
 - Números a ordenar (cantidad variable)
Resultado:
   Lista.
Descripción de la solucion:
  o Datos de entrada: 5 4 1 3 2
     ▪ División
        ✓ Primera: 5 1 2 | 4 3
        ✓ Segunda: 5 2 | 1 || 4 | 3
        ✓ Tercera: 5 | 2 || 1 ||| 4 | 3
     ▪ Fusión:
        ✓ Primera: 2 5 | 1 || 3 4
        ✓ Segunda: 1 2 5 | 3 4
        ✓ Tercera: 1 2 3 4 5 
Funciones auxiliares a las que llama:
  mergeSort
|#


(define mergeSortDatos
  (lambda lista (mergeSort lista)))

;(mergeSortDatos ) 
;(mergeSortDatos 2)
;(mergeSortDatos 1 3 2)
;(mergeSortDatos 5 4 1 3 2)

#|
Resultados:
()
(2)
(1 2 3)
(1 2 3 4 5)
|#