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
   ninguno
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
   ninguno
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
;; 5.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   sumaAureo
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

(define (sumaAureo n)
  (if (> n 0)
      (sqrt (+ 1 sumaAureo (- n 1)))
      1
   )
)

(sumaAureo 0)

