;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 7. a.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   serie1
Objetivo:
   Esta sucesión numérica permite calcular la cantidad que se obtiene al depositar
una cantidad C durante n años con un interés del i%.
Parámetros:
 - n: número de años.
 - C: Cantidad de unidades monetarias
 - i: porcentaje de interés
Resultado:
   Valor real 
Descripción de la solucion:
   Cantidad de u.m. con el interés añadido acumulada en los n años.
Funciones auxiliares a las que llama:
   expt
|#

(define (serie1 n c i)
  (*
     c
     (expt (+
      1
      (/
       i
       100
       )
      ) n )
   )

  )

;; (serie1 55. 5 8)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 7. b.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   serie2
Objetivo:
   Comprueba que an es el n-ésimo término de la sucesión de Fibonacci.
Parámetros:
 - n: término n-ésimo a calcular de la sucesión de Fibonacci.
Resultado:
   Número natural
Descripción de la solucion:
   Valor n de la sucesión de Fibonacci.
Funciones auxiliares a las que llama:
   sqrt, expt
|#

(define (serie2 n)
  (/
    (-
      (expt (/
       (+ 1 (sqrt 5))
       2
      ) n)
      (expt (/
       (- 1 (sqrt 5))
       2
      ) n)
     )
    (sqrt 5)
   )
  )

;; (serie2 6)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 7. c.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   serie3
Objetivo:
   Comprueba que bn converge hacia el número áureo: phi = 1.6180339887...
Parámetros:
 - n: término n-ésimo a calcular de la sucesión de Fibonacci.
Resultado:
   Valor real
Descripción de la solucion:
   Aproximación del número aureo.
Funciones auxiliares a las que llama:
   serie2
|#

(define (serie3 n)
  (let ((an (serie2 n))(an+1 (serie2 (+ n 1))))
    (/ an+1 an)
    )
  )

;; (serie3 10)
;; (serie3 40)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 8. a.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   conversion1
Objetivo:
   Convertir de millas a kilómetros
Parámetros:
 - m: Cantidad de millas
Resultado:
   Valor real
Descripción de la solucion:
   Valor en kilómetros de las millas introducidas
Funciones auxiliares a las que llama:
   
|#

(define (conversion1 m)
  (* m 1.60934)
  )

;; (conversion1 2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 8. b.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   conversion2
Objetivo:
   Convertir de kilómetros a millas
Parámetros:
 - km: Cantidad de kilómetros
Resultado:
   Valor real
Descripción de la solucion:
   Valor en millas de los kilómetros introducidos
Funciones auxiliares a las que llama:
   ninguna
|#

(define (conversion2 km)
  (/ km 1.60934)
  )

;; (conversion2 1.60934)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 8. c.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   conversion3
Objetivo:
   Convertir de grados Celsius a grados Fahrenheit
Parámetros:
 - c: grados Celsius
Resultado:
   Valor real
Descripción de la solucion:
   Valor en grados Fahrenheit de los grados Celsius introducidos. 
Funciones auxiliares a las que llama:
   ninguna
|#

(define (conversion3 c)
  (+ (* c (/ 9 5)) 32)
  )

;; (conversion3 5) ==> 41

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 8. d.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   conversion4
Objetivo:
   Convertir de grados Fahrenheit a grados Celsius
Parámetros:
 - f: grados Fahrenheit
Resultado:
   Valor real
Descripción de la solucion:
   Valor en grados Celsius de los grados Fahrenheit introducidos. 
Funciones auxiliares a las que llama:
   ninguna
|#

(define (conversion4 f)
  (* (- f 32) (/ 5 9))
  )

;; (conversion4 41) ==> 5

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 9. a.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   perimetro
Objetivo:
   Calcula el perímetro de un polígono regular
Parámetros:
 - n: número de lados
 - l: longitud de los lados
Resultado:
   Valor real
Descripción de la solucion:
   Valor en unidades de medida del perímetro del polígono dado
Funciones auxiliares a las que llama:
   ninguna
|#

 (define perimetro (lambda (n l) (* n l))
   )

;; (perimetro 5 2) ==> 10

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 9. b.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   angulo-central
Objetivo:
   Calcula el angulo central de un polígono regular
Parámetros:
 - n: número de lados
Resultado:
   Angulo en grados
Descripción de la solucion:
   Ángulo central de un polígono
Funciones auxiliares a las que llama:
   ninguna
|#

 (define angulo-central (lambda (n) (/ 360 n))
   )

;; (angulo-central 3)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 9. c.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   apotema
Objetivo:
   Calcula el apotema de un polígono regular
Parámetros:
 - n: número de lados
 - l: longitud de los lados
Resultado:
   Distancia en unidades de medida
Descripción de la solucion:
   Aponema del polígono
Funciones auxiliares a las que llama:
   angulo-central, tan
|#

 (define (apotema n l)
   ;; (/ l (* 2 (tan (/ (angulo-central n) 2))))
   ;; esto es lo que pone que hagamos,
   ;; pero no me da el resultado correcto
   (/ l (* 2 (tan (/ pi n))))
   )

;; (apotema 5 5)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 9. d.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   area
Objetivo:
   Calcula el area de un polígono regular
Parámetros:
 - n: número de lados
 - l: longitud de los lados
Resultado:
   Valor real
Descripción de la solucion:
   Area del polígono
Funciones auxiliares a las que llama:
   aponema, perimetro
|#

 (define (area n l)
   (/ (* (perimetro n l) (apotema n l)) 2)
   )

;; (area 3 3)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 10. a.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   areaTriangulo
Objetivo:
   Calcula el area de un triángulo a partir de sus lados usando la fórmula de Herón.
Parámetros:
 - a: lado a
 - b: lado b
 - c: lado c
Resultado:
   Valor real
Descripción de la solucion:
   Area del triángulo
Funciones auxiliares a las que llama:
   sqrt
|#

 (define (areaTriangulo a b c)
   (define s (/ (+ a b c) 2))
   (sqrt (* s (- s a)(- s b)(- s c)))
   )

;; (areaTriangulo 3 3 3)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 10. b.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   areaRombo
Objetivo:
   Calcula el area de un rombo a partir de sus diagonales.
Parámetros:
 - d1: diagonal d1
 - d2: diagonal d2
Resultado:
   Valor real
Descripción de la solucion:
   Area del rombo
Funciones auxiliares a las que llama:
   ninguna
|#

 (define (areaRombo d1 d2)
   (/ (* d1 d2) 2)
   )

;; (areaRombo 2 2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 10. c.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   areaTrapecio
Objetivo:
   Calcula el area del trapecio a partir de sus bases y altura.
Parámetros:
 - b1: base b1
 - b2: base b2
 - h: altura
Resultado:
   Valor real
Descripción de la solucion:
   Area del trapecio
Funciones auxiliares a las que llama:
   ninguna
|#

 (define (areaTrapecio b1 b2 h)
   (* (/ (+ b1 b2) 2) h)
   )

;; (areaTrapecio 2 2 2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 11. a.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   D2
Objetivo:
   Calcula la distancia euclidiana o distancia L2 entre dos puntos P1 = (x1, y1) y P2 = (x2, y2)
Parámetros:
 - x1: coordenada x P1
 - y1: coordenada y P1
 - x2: coordenada x P2
 - y2: coordenada y P2
Resultado:
   Valor real
Descripción de la solucion:
   Distancia euclidiana
Funciones auxiliares a las que llama:
   sqrt, expt
|#

 (define (D2 x1 y1 x2 y2)
   (sqrt (+ (expt (- x2 x1) 2) (expt (- y2 y1) 2)))
   )

;; (D2 0 0 1 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 11. b.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   D1
Objetivo:
   distancia de Manhattan, distancia de la ciudad de los bloques o distancia L1
Parámetros:
 - x1: coordenada x P1
 - y1: coordenada y P1
 - x2: coordenada x P2
 - y2: coordenada y P2
Resultado:
   Valor real
Descripción de la solucion:
   Distancia de Manhattan
Funciones auxiliares a las que llama:
   abs
|#

 (define (D1 x1 y1 x2 y2)
   (+ (abs (- x2 x1)) (abs (- y2 y1)))
   )

;; (D1 0 0 1 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 11. c.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   Dmax
Objetivo:
   Calcula la distancia de ajedrez, distancia de Chebyshev o distancia L00
Parámetros:
 - x1: coordenada x P1
 - y1: coordenada y P1
 - x2: coordenada x P2
 - y2: coordenada y P2
Resultado:
   Valor real
Descripción de la solucion:
   Distancia de ajedrez
Funciones auxiliares a las que llama:
   max, abs
|#

 (define (Dmax x1 y1 x2 y2)
   (max (abs (- x2 x1)) (abs (- y2 y1)))
   )

;; (Dmax 0 0 1 9)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 12.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   areaTrianguloVertices
Objetivo:
   Calcula el área del triángulo a partir de sus vértices
Parámetros:
 - x1: coordenada x P1
 - y1: coordenada y P1
 - x2: coordenada x P2
 - y2: coordenada y P2
 - x3: coordenada x P3
 - y3: coordenada y P3
Resultado:
   Valor real
Descripción de la solucion:
   Area del triángulo
Funciones auxiliares a las que llama:
   areaTriangulo, D2
|#

(define (areaTrianguloVertices x1 y1 x2 y2 x3 y3)
  (let ((A (D2 x1 y1 x2 y2))
        (B (D2 x2 y2 x3 y3))
        (C (D2 x3 y3 x1 y1)))
    (areaTriangulo A B C)))

;; (areaTrianguloVertices 0 0 4 0 0 3)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 13.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   areaRomboVerticesLet
Objetivo:
   Calcula el área del rombo a partir de sus vértices
Parámetros:
 - x1: coordenada x P1 (Primer punto Diagonal d1)
 - y1: coordenada y P1 (Primer punto Diagonal d1)
 - x2: coordenada x P2 (Segundo punto Diagonal d1)
 - y2: coordenada y P2 (Segundo punto Diagonal d1)
 - x3: coordenada x P3 (Primer punto Diagonal d2)
 - y3: coordenada y P3 (Primer punto Diagonal d2)
 - x4: coordenada x P4 (Segundo punto Diagonal d2)
 - y4: coordenada y P4 (Segundo punto Diagonal d2)
Resultado:
   Valor real
Descripción de la solucion:
   Area del rombo
Funciones auxiliares a las que llama:
   areaRombo, D2
|#

(define (areaRomboVerticesLet x1 y1 x2 y2 x3 y3 x4 y4)
  (let ((d1 (D2 x1 y1 x2 y2))
        (d2 (D2 x3 y3 x4 y4))
        )
    (areaRombo d1 d2)))

;; (areaRomboVerticesLet 0 0 4 0 2 3 2 -3)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 14. a.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   distanciaPuntoRecta
Objetivo:
   Calcula la distancia que hay entre un punto y una recta
Parámetros:
 - x0: coordenada x del punto P 
 - y0: coordenada y del punto P 
 - a: coeficiente de x
 - b: coeficiente de y
 - c: término independiente
Resultado:
   Valor real
Descripción de la solucion:
   Distancia entre el punto y la recta
Funciones auxiliares a las que llama:
   abs, sqrt, sqr
|#

(define (distanciaPuntoRecta x0 y0 a b c)
  (/ (abs (+ (* a x0) (* b y0) c)) (sqrt (+ (sqr a) (sqr b))))
  )

;; (distanciaPuntoRecta 0 0 1 1 4)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 14. b.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   distanciaPuntoRecta2
Objetivo:
   Calcula la distancia que hay entre un punto y una recta que pasa por lo spunto P1 y P2
Parámetros:
 - x0: coordenada x del punto P0 
 - y0: coordenada y del punto P0
 - x1: coordenada x del punto P1
 - y1: coordenada y del punto P1
 - x2: coordenada x del punto P2
 - y2: coordenada y del punto P2
Resultado:
   Valor real
Descripción de la solucion:
   Distancia entre el punto y la recta dado por los puntos P1 y P2
Funciones auxiliares a las que llama:
   distanciaPuntoRecta
|#

(define (distanciaPuntoRecta2 x0 y0 x1 y1 x2 y2)
  (let ((a (- y2 y1))
         (b (- x1 x2))
         (c (- (* x2 y1) (* x1 y2))))
    (distanciaPuntoRecta x0 y0 a b c)
    )
  )

;; (distanciaPuntoRecta2 0 0 2 1 2 3)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 15.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   areaTrapecioLetVertices
Objetivo:
   Calcula el área de un trapecio a partir de sus vértices
Parámetros:
   Introducción en sentido horario, empezando por el superior izquierdo.
 - x0: coordenada x del punto A 
 - y0: coordenada y del punto A
 - x1: coordenada x del punto B
 - y1: coordenada y del punto B
 - x2: coordenada x del punto C
 - y2: coordenada y del punto C
 - x3: coordenada x del punto D 
 - y3: coordenada y del punto D

               A----B
              /      \
             D--------C

Resultado:
   Valor real
Descripción de la solucion:
   Área del trapecio dados sus vértices
Funciones auxiliares a las que llama:
   D2, distanciaPuntoRecta2, areaTrapecio
|#

(define (areaTrapecioLetVertices x0 y0 x1 y1 x2 y2 x3 y3)
  (let ((base1 (D2 x0 y0 x1 y1))
        (base2 (D2 x3 y3 x2 y2))
        (h (distanciaPuntoRecta2 x3 y3 x0 y0 x1 y1)))
    (areaTrapecio base1 base2 h)
    )
  )

;; (areaTrapecioLetVertices 2 4 5 4 7 0 0 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 16. a.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   cuota-mensual
Objetivo:
   Calcula la cuota mensual del préstamo hipotecario: incluye el interés y la amortización mensuales.
Parámetros:
 - c: capital cantidad de dinero pendiente de pago en la hipoteca.
 - i: tipo de interés anual de la hipoteca.
 - a: número de años de la hipoteca.
Resultado:
   Valor real en unidades monetarias.
Descripción de la solucion:
   Cuota mensual del préstamo hipotecario.
Funciones auxiliares a las que llama:
   expt
|#

(define (cuota-mensual c i a)
  (/
   (* c (/ i 12))
   (* 100 (- 1 (expt (+ 1 (/ i 1200)) (- (* 12 a)))))
   )
  )

;; (cuota-mensual 100000 3.0 20)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 16. b.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   interes-mensual
Objetivo:
   Calcula la cantidad de intereses que se paga mensualmente en el préstamo hipotecario.
Parámetros:
 - c: capital cantidad de dinero pendiente de pago en la hipoteca.
 - i: tipo de interés anual de la hipoteca.
Resultado:
   Valor real en unidades monetarias.
Descripción de la solucion:
   Interes mensual del préstamo hipotecario.
Funciones auxiliares a las que llama:
   
|#

(define (interes-mensual c i)
  (* c (/ i 1200))
  )

;; (interes-mensual 100000 3.0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 16. c.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   amortizacion-mensual
Objetivo:
   Calcula la cantidad de capital que se paga mensualmente en el préstamo. 
Parámetros:
 - c: capital cantidad de dinero pendiente de pago en la hipoteca.
 - i: tipo de interés anual de la hipoteca.
 - a: número de años de la hipoteca.
Resultado:
   Valor real en unidades monetarias.
Descripción de la solucion:
   Amortización mensual del préstamo hipotecario.
Funciones auxiliares a las que llama:
   cuota-mensual, interes-mensual
|#

(define (amortizacion-mensual c i a)
  (let ((cuota (cuota-mensual c i a))
        (interes (interes-mensual c i)))
    (- cuota interes)
    )
  )

;; (amortizacion-mensual 100000 3.0 20)