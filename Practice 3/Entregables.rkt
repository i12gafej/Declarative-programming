;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1. a. y b.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   collatz-recursivo, collatz-iterativo
Objetivo:
   Imprime la sucesión de números según al conjetura de Collatz
Parámetros:
 - n: número de entrada
Resultado:
   Impresión de los números de la sucesión
Descripción de la solucion:
   Dado un número, se calcula cada uno de los número según la conjetura de collatz.
   Esta conjetura dice que
   - Dada una función f(n) = n/2 si n es par ; 3n+1 si n es impar y una sucesión numérica
   para un número n, ai = n si i = 0; ai = f(ai-1) si i > 0.

   • La conjetura de Lothar Collatz afirma que la sucesión numérica siempre se
   repite indefinidamente cuando alcanza los términos 4, 2, 1,
   independientemente del valor de “n”.
   • Por ejemplo
   o Para n = 1, se genera la siguiente sucesión numérica
      ▪ 1, 4, 2, 1.
   o Para n = 2, se genera la siguiente sucesión numérica
      ▪ 2, 1, 4, 2, 1.
   o Para n = 3, se genera la siguiente sucesión numérica
      ▪ 3, 10, 5, 16, 8, 4, 2, 1.
   o Para n = 4, se genera la siguiente sucesión numérica
      ▪ 4, 2, 1.
   o Para n = 5, se genera la siguiente sucesión numérica
      ▪ 5, 16, 8, 4, 2, 1.
   o Para n = 6, se genera la siguiente sucesión numérica
      ▪ 6, 3, 10, 5, 16, 8, 4, 2, 1.
Funciones auxiliares a las que llama:
   ninguno
|#

(define (collatz-recursivo n)
   (display n)(display ", ")
   (cond
     ;; 
     ((= n 4) (display "2, 1")(newline))
      ((even? n) (collatz-recursivo (/ n 2)))
      ((odd? n) (collatz-recursivo (+ (* 3 n) 1)))
   )
)
;(collatz-recursivo 1)

(define (collatz-iterativo n)
  (do
      (
       ;; Variable n con paso par o impar
       (n n (if (even? n) (/ n 2) (+ (* 3 n) 1)))
       )
      ;; Condición de parada
      ((= n 4) (display "4, 2, 1")(newline))
    ;; Cuerpo del bucle
    (display n) (display ", ") 
   )
)


;(collatz-iterativo 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2. a.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   primoIterativo?
Objetivo:
   Devuleve si el número es primo o no.
Parámetros:
 - n: número de entrada
Resultado:
   Booleano.
Descripción de la solucion:
   Un número es primo si no tiene divisores propios menores o iguales que
   su raíz cuadrada. 
   Partimos de un número, por ejemplo 20
   La raiz cuadrada de 20 es 4,472135955
   Ahora, vamos dividiendo 20 entre los números del 1 al 4 (porque es natural)
   Si no se cuenta más que 1, entonces es primo. Devuelve #t.
Funciones auxiliares a las que llama:
   ninguno
|#

(define (primoIterativo? n)
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


;(primoIterativo? 23)
;(primoIterativo? 21)

#|Resultados
#t
#f
|#


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2. b.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   primoRecursivo?
Objetivo:
   Devuleve si el número es primo o no.
Parámetros:
 - n: número de entrada
 - contar: contador de divisores (inizializa en 0)
 - i: iterador para calcular si es divisor (inizializa en 1)
Resultado:
   Booleano.
Descripción de la solucion:
   Un número es primo si no tiene divisores propios menores o iguales que
   su raíz cuadrada. 
   Partimos de un número, por ejemplo 20
   La raiz cuadrada de 20 es 4,472135955
   Ahora, vamos dividiendo 20 entre los números del 1 al 4 (porque es natural)
   Si no se cuenta más que 1, entonces es primo. Devuelve #t
Funciones auxiliares a las que llama:
   primoRecursivo?
|#

(define (primoRecursivo? n contar i)
  ;; Si i es mayor a la raiz de n, devuelve si es primo o no
  (if (> i (sqrt n))
      (<= contar 1)
      (primoRecursivo? n (if (= (modulo n i) 0) (+ contar 1) contar) (+ i 1)))
)

;(primoRecursivo? 13 0 1)
;(primoRecursivo? 16 0 1)

#|Resultados
 #t
 #f
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   numeroAfortunadoEuler?
Objetivo:
   Devuleve si el número es un número afortunado de Euler
Parámetros:
 - n: número de entrada
Resultado:
   Booleano.
Descripción de la solucion:
   • Un número natural “n” es un número afortunado de Euler si son primos
     todos los números de la forma k² – k + n, donde 1 ≤ k < n.
   • Solamente existen seis números afortunados de Euler: 2, 3, 5, 11, 17 y
     41.
   • Codifica una función iterativa que permita generar todos los números
     primos usando el polinomio de Euler k² – k + n, donde “n” es un número
     afortunado de Euler.
Funciones auxiliares a las que llama:
   primoIterativo?
|#

(define (numeroAfortunadoEuler? n)
  (if (<= n 1)
      #f
   (do
      ;; Variables
      (
       (k 1 (+ k 1))
       (resultado #t (primoIterativo? (+ (- (sqr k) k) n)))
       )
      
      ;;Condición de parada
      ((or (= k n)
           (not resultado)
           ) resultado
             )
    )))

;(numeroAfortunadoEuler? 5)
;(numeroAfortunadoEuler? 1)
;(numeroAfortunadoEuler? 11)
;(numeroAfortunadoEuler? 13)

#|Resultados:
  #t
  #f
  #t
  #f
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4. a,
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   terminoNumeroE
Objetivo:
   Calcula el término n-ésimo de la sucesión numérica.
Parámetros:
 - n: término n-ésimo
Resultado:
   Numérico.
Descripción de la solucion:
   Considera el término general de una sucesión numérica que converge al número e: 2.718281...
   a_n = (1 + 1/n)^n
   La función calcula el termino n-ésimo de dicha sucesión.
Funciones auxiliares a las que llama:
   ninguno
|#

(define (terminoNumeroE n)
  (do
      ;; Variables
      ((i 2  (+ i 1))
      (termino 2. (expt (+ 1 (/ 1. i)) i)))
      ;; Condición de parada
      ((= i n) termino)
      ;; No hay cuerpo 
   )
)

;(terminoNumeroE 20)
;(terminoNumeroE 200)
;(terminoNumeroE 1000)

#|
Resultados:
2.650034326640442
2.7114832852438147
2.7169225742266474
|#


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4. b.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   limiteSucesionNumeroE
Objetivo:
   Calcula el límite de la sucesión numérica que converge al número e.
Parámetros:
 - cota: cota de error.
Resultado:
   Numérico.
Descripción de la solucion:
   Considera el término general de una sucesión numérica que converge al número e: 2.718281...
   a_n = (1 + 1/n)^n
   La cota de error permite terminar la función cuando dos elementos
   consecutivos de la sucesión disten menos que dicha cota de
   error: |a_n+1 - a_n | < cota
Funciones auxiliares a las que llama:
   ninguno
|#

(define (limiteSucesionNumeroE cota)
   (do
       ;; Variables
       ((i 2  (+ i 1))
        (a_n 2. (expt (+ 1 (/ 1. i)) i))
        (a_n+1 (expt (+ 1 (/ 1. 2)) 2) (expt (+ 1 (/ 1. (+ i 1))) (+ i 1))))
       ;; Condición de parada
       ((< (- a_n+1 a_n) cota) a_n)
       ;; No hay cuerpo 
    )

)

;(limiteSucesionNumeroE 0.00001)
;(limiteSucesionNumeroE 0.0001)
;(limiteSucesionNumeroE 0.001)

#|
Resultado:
2.7145976867972696
2.706656929981162
2.6814644203008586
|#


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 5. a.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   sumaAureo-recursiva
Objetivo:
   Calcula el número aureo según el número de sumas realizadas
Parámetros:
 - n: número de sumas realizadas.
Resultado:
   Numérico.
Descripción de la solucion:
   Calcula el número áureo usando la siguiente suma infinita:
   (raiz 1 + (raiz 1 + (raiz 1+ ... )))
Funciones auxiliares a las que llama:
   ninguno
|#

(define (sumaAureo-recursiva n)
  (cond
    ((= n 0) 0)
    (else (sqrt (+ 1 (sumaAureo (- n 1)))))
  )
)

;(sumaAureo-recursiva 0)
;(sumaAureo-recursiva 1)
;(sumaAureo-recursiva 2)
;(sumaAureo-recursiva 10)
;(sumaAureo-recursiva 100)

#|
Resultados:
0
1
1.4142135623730951
1.6180165422314876
1.618033988749895
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 5. b.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   sumaAureo-iterativa
Objetivo:
   Calcula el número aureo según el número de sumas realizadas
Parámetros:
 - n: número de sumas realizadas.
Resultado:
   Numérico.
Descripción de la solucion:
   Calcula el número áureo usando la siguiente suma infinita:
   (raiz 1 + (raiz 1 + (raiz 1+ ... )))
Funciones auxiliares a las que llama:
   ninguno
|#

(define (sumaAureo-iterativa n)
   (do
       ;; Variables
       (
        (i n (- i 1))
        (resultado 0 (sqrt (+ 1 resultado)))
       )
       ;; Condición de parada
       ((= i 0) resultado)
       ;; No hay cuerpo
   )
)

;(sumaAureo-iterativa 0)
;(sumaAureo-iterativa 1)
;(sumaAureo-iterativa 2)
;(sumaAureo-iterativa 10)
;(sumaAureo-iterativa 100)

#|
Resultados:
0
1
1.4142135623730951
1.6180165422314876
1.618033988749895
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 6. a.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   fraccion-continua-iterativa
Objetivo:
   Calcula una fracción continua infinita.
Parámetros:
 - N: función de un argumento que calcula el valor de N(k)
 - D: función de un argumento que calcula el valor de D(k)
 - k: número de términos de la fracción continua
Resultado:
   Numérico.
Descripción de la solucion:
   Calcula una fracción infinita de la siguiente forma:
   f = (N1 / (D1 + (N2 / (D2 + (N3 / D3 + ...))))) donde
   N_k se calcula mediante una función N(x) y
   D_k se calcula mediante una función D(x).   
Funciones auxiliares a las que llama:
   ninguno
|#

(define (fraccion-continua-iterativa N D k)
  (cond
    ((= k 0) 0)
  (else (do
       ;; Variables
       (
        (i 2 (+ i 1))
        (resultado 1. (/ (N i) (+ (D i ) resultado)))
       )
       ;; Condición de parada
       ((> i k) resultado)
       ;; No hay cuerpo
    )))
)

;(fraccion-continua-iterativa (lambda (x) 1.0) (lambda (x) 1.0) 1)
;(fraccion-continua-iterativa (lambda (x) 1.0) (lambda (x) 1.0) 2)
;(fraccion-continua-iterativa (lambda (x) 1.0) (lambda (x) 1.0) 3)
;(fraccion-continua-iterativa (lambda (x) 1.0) (lambda (x) 1.0) 4)
;(fraccion-continua-iterativa (lambda (x) 1.0) (lambda (x) 1.0) 5)
;(fraccion-continua-iterativa (lambda (x) 1.0) (lambda (x) 1.0) 100)

;(fraccion-continua-iterativa (lambda (x) (* x x)) (lambda (x) (* x x)) 3)


#|
Resultados:
1
0.5
0.6666666666666666
0.6000000000000001
0.625
0.6180339887498948
0.9183673469387754
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 6. b.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   fraccion-continua-recursiva
Objetivo:
   Calcula una fracción continua infinita.
Parámetros:
 - N: función de un argumento que calcula el valor de N(k)
 - D: función de un argumento que calcula el valor de D(k)
 - k: número de términos de la fracción continua
Resultado:
   Numérico.
Descripción de la solucion:
   Calcula una fracción infinita de la siguiente forma:
   f = (N1 / (D1 + (N2 / (D2 + (N3 / D3 + ...))))) donde
   N_k se calcula mediante una función N(x) y
   D_k se calcula mediante una función D(x).
   
Funciones auxiliares a las que llama:
   ninguno
|#

;; Tener en cuenta que empieza por 1 y termina por n. Al principio si fuese 9, es 1 (k - (k -1), 2, 3, 4, 5, 6, 7, 8, 9
(define (fraccion-continua-recursiva N D k)
  (cond
    ;; Criterio de finalización
    ((= k 0) 0)
    ;; Caso genérico
    (else (/ (N k) (+ (D k) (fraccion-continua-recursiva N D (- k 1.)))))
))

;(fraccion-continua-recursiva (lambda (x) 1.0) (lambda (x) 1.0) 1)
;(fraccion-continua-recursiva (lambda (x) 1.0) (lambda (x) 1.0) 2)
;(fraccion-continua-recursiva (lambda (x) 1.0) (lambda (x) 1.0) 3)
;(fraccion-continua-recursiva (lambda (x) 1.0) (lambda (x) 1.0) 4)
;(fraccion-continua-recursiva (lambda (x) 1.0) (lambda (x) 1.0) 5)
;(fraccion-continua-recursiva (lambda (x) 1.0) (lambda (x) 1.0) 100)
;(fraccion-continua-recursiva (lambda (x) (* x x)) (lambda (x) (* x x)) 3)

#|
Resultados:
1.0
0.5
0.6666666666666666
0.6000000000000001
0.625
0.6180339887498948
0.9183673469387754
|#


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 7.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   limiteIterativa
Objetivo:
   Calcula una aproximación al límite de cualquier sucesión numérica convergente.
Parámetros:
 - f: función que represente el término general de la sucesión numérica convergente.
 - cota: permitirá terminar la función cuando dos elementos consecutivos de la sucesión disten menos que
   dicha cota de error
Resultado:
   Numérico.
Descripción de la solucion:
   Para una serie convergente, dada la cota de error, esta función devuelve el valor del límite para cuando
   se da con una cota de error igual a la dada.
Funciones auxiliares a las que llama:
   ninguno
|#

(define (limiteIterativa f cota)
   (do
       ;; Variables
       (
        (i 1 (+ i 1))
        (a_n 0 (f i))
        (a_n+1 (f 1) (f (+ i 1)))
        )
       ;; Criterio de parada
       ((< (abs (- a_n a_n+1)) cota) a_n)
       ;; No hay cuerpo
    )
)

;(limiteIterativa (lambda (x) (expt (+ 1 (/ 1. x)) x)) 0.001)
;(limiteSucesionNumeroE 0.001)

#|
Resultados:
2.6814644203008586
2.6814644203008586
|#


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 8.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   integral
Objetivo:
   Calcula  la aproximación a la integral definida según el método de los trapecios.
Parámetros:
 - a: extremo inicial
 - b: extremo final
 - f: función que sea positiva en [a, b]
 - n: número de particiones
Resultado:
   Numérico.
Descripción de la solucion:
   Dado un itnervalo y una función positiva en dicho intervalo, que devuelva la aproximación de la
   integral definida por dicho intervalo con el método de los trapecios. Se hacen n particiones y
   se calcula: ∑(f(xi) + f(xi-1) / 2))∗ h desde i = 0 a i = n-1
Funciones auxiliares a las que llama:
   ninguno
|#

(define (integral a b f n)
  (if (and (< (f a) 0) (< (f b) 0))
      "No es positiva"
      (do
          ;; Variable
          (
           (i 1 (+ i 1))
           (h (/ (- b a) n))
           (xi (+ a (* 1 (/ (- b a) n))) (+ a (* i h)))
           (xi-1 a xi)
           (resultado 0 (+ (* (/ (+ (f xi) (f xi-1)) 2.) h) resultado))
           )
           ;; Criterio de parada
           ((> xi b) resultado)
        ;; No hay cuerpo
      )
   )
)

;(integral 0 4 (lambda (x) x) 2)
;(integral 0 4 (lambda (x) (* x x)) 10)
;(integral 1 2 (lambda (x) (/ 1 x)) 10000)

#|
Resultados:
- x [0,4] = 
Valor real:      8
Valor calculado: 8
- x^2 [0,4] = 
Valor real:      21.333
Valor calculado: 21.44
- 1/x [1,2] =
Valor real:      0.6931471805599453
Valor calculado: 0.6932471711859476
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 9. a.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   serie-iterativa
Objetivo:
   Calcula la suma de cualquier serie numérica convergente teniendo en cuenta
   una cota de error.
Parámetros:
 - f: a función que represente el término general de la serie
 - inicial: El índice del primer término
 - siguiente: función que permite pasar al siguiente términode la serie
 - cota: Una cota de error de forma que la suma de la serie finalizará
 cuando el valor absoluto del término actual que se vaya a
 sumar sea menor que dicha cota de error
Resultado:
   Numérico.
Descripción de la solucion:
   Calcula el sumatorio de cualquier serie numérica convergente teniendo
   en cuenta la cota de error. Empezando por le valor inicial, la serie
   continua hasta que el valor absoluto del término actual a sumar sea menor
   a la cota.
Funciones auxiliares a las que llama:
   ninguna
|#

(define (serie-iterativa f inicial siguiente cota)
   (do
       ;; Variables
       (
        (i inicial (siguiente i))
        (f_i 0 (f i))
        (resultado 0. (+ f_i resultado))
        )
       ;; Condición de parada
       ((and (< f_i cota) (not (= i inicial)))  resultado)
       ;; No hay cuerpo
    )
)

(define (fact n)
   (cond ((or (= n 0 ) (= n 1)) 1)
         (else (* n (fact (- n 1)))))
)

;(serie-iterativa (lambda (x) (/ 1 (fact x))) 0 (lambda (x) (+ x 1)) 0.001)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 9. b.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   serie-recursiva
Objetivo:
   Calcula la suma de cualquier serie numérica convergente teniendo en cuenta
   una cota de error.
Parámetros:
 - f: a función que represente el término general de la serie
 - inicial: El índice del primer término
 - siguiente: función que permite pasar al siguiente términode la serie
 - cota: Una cota de error de forma que la suma de la serie finalizará
 cuando el valor absoluto del término actual que se vaya a
 sumar sea menor que dicha cota de error
Resultado:
   Numérico.
Descripción de la solucion:
   Calcula el sumatorio de cualquier serie numérica convergente teniendo
   en cuenta la cota de error. Empezando por le valor inicial, la serie
   continua hasta que el valor absoluto del término actual a sumar sea menor
   a la cota.
Funciones auxiliares a las que llama:
   ninguna
|#

(define (serie-recursiva f inicial siguiente cota)
  (cond
    ;; La imagen actual de la función es menor a la cota y no es la primera iteración
    ((and (< (abs (f inicial)) cota) (not (= (f inicial) inicial)) 0.))
    ;; Caso genérico
    (else (+ (f inicial) (serie-recursiva f (siguiente inicial) siguiente cota)))
  )
)

;(serie-recursiva (lambda (x) (/ 1 (fact x))) 0 (lambda (x) (+ x 1)) 0.001)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 10.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   suavizar
Objetivo:
   Calcular la función suavizada.
Parámetros:
 - f: función dada
 - dx: pequeña cantidad positiva
Resultado:
   Numérico.
Descripción de la solucion:
   Dada una función f, se devuelve la función suavizada dada esta expresión:
   (f (x - dx) + f (x) + (x + dx)) / 3
Funciones auxiliares a las que llama:
   ninguna
|#

(define (suavizar f dx)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)
    )
)

;(define suavizar-sqrt (suavizar sqrt 0.01))
;(suavizar-sqrt 2)



