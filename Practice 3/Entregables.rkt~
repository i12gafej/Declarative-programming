;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   collatz-recursivo, collatz-iterativo
Objetivo:
   Imprime la sucesión de números según al conjetura de Collatz
Parámetros:
 - n: número de entrada
Resultado:
   Números en formato texto
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
(collatz-recursivo 1)

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


(collatz-iterativo 1)