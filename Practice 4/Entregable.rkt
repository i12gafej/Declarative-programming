;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   modulo
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

(define (modulo v)
  (do
      ;; Variables
      (
       (i 0 (+ i 1))
       (resultado (vector-ref v 0) (+ (vector-ref v i) resultado))
       )
      ;; Condición de parada
      ((> i (lenght)))
   )
)
