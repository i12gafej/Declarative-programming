;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   provincias
Objetivo:
   Indica el código de las provincias de Andalucía.
Parámetros:
 - nombre: nombre de la provincia.
Resultado:
   Código numérico de la provincia.
Descripción de la solucion:
   Los códigos de las provincias son:
   o Almería: 04
   o Cádiz: 11
   o Córdoba: 14
   o Granada: 18
   o Huelva: 21
   o Jaén: 23
   o Málaga: 29
   o Sevilla: 41
Funciones auxiliares a las que llama:
   ninguno
|#


(define (provincias nombre)
    (case nombre
      (("Almería") "04")
      (("Cádiz") "11")
      (("Córdoba") "14")
      (("Granada") "18")
      (("Huelva") "21")
      (("Jaén") "23")
      (("Málaga") "29")
      (("Sevilla") "41")
      (else (display "Nombre incorrecto") (newline))
    )
  )

;; (provincias "Almería")
;; (provincias "Cádiz")
;; (provincias "Córdoba")
;; (provincias "Huelva")
;; (provincias "Granada")
;; (provincias "Jaén")
;; (provincias "Málaga")
;; (provincias "Castellón")
;; (provincias "sevilla")

#|
Resultado:
"04"
"11"
"14"
"21"
"18"
"23"
"29"
Nombre incorrecto
Nombre incorrecto

|#


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   letra-dni
Objetivo:
   Dado un número de DNI, se devuelve la letra.
Parámetros:
 - n: número del DNI.
Resultado:
   Letra.
Descripción de la solucion:
  La equivalencia del resto con la letra es la siguiente:
   0 -> T          13 -> J
   1 -> R          14 -> Z
   2 -> W          15 -> S
   3 -> A          16 -> Q
   4 -> G          17 -> V
   5 -> M          18 -> H
   6 -> Y          19 -> L
   7 -> F          20 -> C
   8 -> P          21 -> K
   9 -> D          22 -> E
   10 -> X          
   11 -> B          
   12 -> N

Funciones auxiliares a las que llama:
   ninguno
|#

(define (letra-dni n)
    (case (modulo n 23)
       ((0) "T")
       ((1) "R")
       ((2) "W")
       ((3) "A")
       ((4) "G")
       ((5) "M")
       ((6) "Y")
       ((7) "F")
       ((8) "P")
       ((9) "D")
       ((10) "X")
       ((11) "B")
       ((12) "N")
       ((13) "J")
       ((14) "Z")
       ((15) "S")
       ((16) "Q")
       ((17) "V")
       ((18) "H")
       ((19) "L")
       ((20) "C")
       ((21) "K")
       ((22) "E")
    )
  )

;; (letra-dni 46072145)
;; (letra-dni 46072154)
;; (letra-dni 46072147)
;; (letra-dni 46072150)

#|
Resultado:
"V"
"A"
"L"
"E"
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 5.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   angulo
Objetivo:
   Dados 4 puntos P 1 , P 2 , P 3 y P 4 y calcule el ángulo que forman
   los vectores definidos por dichos puntos.
Parámetros:
 - x1: coordenada x del punto P1.
 - y1: coordenada y del punto P1.
 - x2: coordenada x del punto P2.
 - y2: coordenada y del punto P2.
 - x3: coordenada x del punto P3.
 - y3: coordenada y del punto P3.
 - x4: coordenada x del punto P4.
 - y4: coordenada y del punto P4.
Resultado:
   Ángulo en radianes.
Descripción de la solucion:
  Para dos vectores tangentes, el ángulo es pi / 2.
  Para dos vectores paralelos, el ángulo es 0.
  Para el resto de vectores, el angulo es mayor a 0. 
Funciones auxiliares a las que llama:
   ninguno
|#

(define (angulo x1 y1 x2 y2 x3 y3 x4 y4)
  (let
     (
       (u1 (- x2 x1))
       (u2 (- y2 y1))
       (v1 (- x4 x3))
       (v2 (- y4 y3))
     )
    
     (acos (/
              (+ (* u1 v1) (* u2 v2))
              (* (sqrt (+ (sqr u1) (sqr u2))) (sqrt (+ (sqr v1) (sqr v2)))))
     )
  )
)

;; (angulo 0 0 3 0 0 1 3 1)
;; (angulo 0 0 3 0 0 1 0 0)
;; (angulo 0 3 3 7 8 9 1 1)

#|
Resultados:
0
1.5707963267948966
3.0662637627614506
|#