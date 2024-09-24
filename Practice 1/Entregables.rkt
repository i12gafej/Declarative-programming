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
 - C: Cantidad de unidades monetarias.
 - i: porcentaje de interés.
Resultado:
   Valor real. Cantidad de u.m. con el interés añadido acumulada en los n años.
Descripción de la solucion:
   Introduciendo: 
   (serie1 numero-de-años cantidad-dinero interes)
   El valor devuelto es la cantidad de dinero mas intereses.
Funciones auxiliares a las que llama:
   ninguna
|#

(define (serie1 n c i)
  (*
     c
     (expt (+
      1.
      (/
       i
       100
       )
      ) n )
   )

  )

;; (serie1 55. 5 8)
;; Resultado => 344.56...

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
   Número natural (con decimales por la precisión). Valor n de la sucesión de Fibonacci.
Descripción de la solucion:
   Para serie2 el valor de 2 es 1, de 3 es 2, de 4 es 3, de 5 es 5, ...
Funciones auxiliares a las que llama:
   ninguna
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
;; Resultado => 8.0...

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
   Valor real. Aproximación del número aureo.
Descripción de la solucion:
   Para valores mayores, la precisión del valor aumenta.
   Para 10, el resultado es 1.6181818181818184.
   Para 40, el resultado es 1.6180339887498951
Funciones auxiliares a las que llama:
   serie2
|#

(define (serie3 n)
  (let ((an (serie2 n))(an+1 (serie2 (+ n 1))))
    (/ an+1 an)
    )
  )

;; (serie3 10)
;; Resultado => 1.6181818181818184
;; (serie3 40)
;; Resultado => 1.6180339887498951

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 8. a.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   conversion1
Objetivo:
   Convertir de millas a kilómetros.
Parámetros:
 - m: Cantidad de millas.
Resultado:
   Valor real. Valor en kilómetros de las millas introducidas.
Descripción de la solucion:
   Una milla son 1.60934 kilómetros. Para 10 millas, el valor es 16.0934 km.
Funciones auxiliares a las que llama:
   ninguna
|#

(define (conversion1 m)
  (* m 1.60934)
  )

;; (conversion1 2)
;; Resultado => 3.21868 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 8. b.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   conversion2
Objetivo:
   Convertir de kilómetros a millas
Parámetros:
 - km: Cantidad de kilómetros.
Resultado:
   Valor real. Valor en millas de los kilómetros introducidos.
Descripción de la solucion:
   1.60934 kilómetros son 1 milla. Para 16.0934 km, el valor es 10 millas.
Funciones auxiliares a las que llama:
   ninguna
|#

(define (conversion2 km)
  (/ km 1.60934)
  )

;; (conversion2 1.60934)
;; Resultado => 1.0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 8. c.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   conversion3
Objetivo:
   Convertir de grados Celsius a grados Fahrenheit.
Parámetros:
 - c: grados Celsius.
Resultado:
   Valor real. Valor en grados Fahrenheit de los grados Celsius introducidos. 
Descripción de la solucion:
   Para 5 grados Celsius, la conversión es 41 grados  Fahrenheit.
Funciones auxiliares a las que llama:
   ninguna
|#

(define (conversion3 c)
  (+ (* c (/ 9 5)) 32)
  )

;; (conversion3 5)
;; Resultado => 41

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 8. d.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   conversion4
Objetivo:
   Convertir de grados Fahrenheit a grados Celsius.
Parámetros:
 - f: grados Fahrenheit.
Resultado:
   Valor real. Valor en grados Celsius de los grados Fahrenheit introducidos.  
Descripción de la solucion:
   Para 41 grados Fahrenheit, la conversión es 5 grados Celsius.
Funciones auxiliares a las que llama:
   ninguna
|#

(define (conversion4 f)
  (* (- f 32) (/ 5 9))
  )

;; (conversion4 41)
;; Resultado => 5

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 9. a.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   perimetro
Objetivo:
   Calcula el perímetro de un polígono regular.
Parámetros:
 - n: número de lados.
 - l: longitud de los lados.
Resultado:
   Valor real. Valor en unidades de medida del perímetro del polígono dado.
Descripción de la solucion:
   Si tenemos un cuadrado de 4 cm de lado, el perímetro será 16 cm.
Funciones auxiliares a las que llama:
   ninguna
|#

 (define perimetro (lambda (n l) (* n l))
   )

;; (perimetro 5 2)
;; Resultado => 10

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 9. b.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   angulo-central
Objetivo:
   Calcula el angulo central de un polígono regular.
Parámetros:
 - n: número de lados.
Resultado:
   Valor en radianes. Ángulo central de un polígono.
Descripción de la solucion:
   Para un pentágono, obtenemos el ángulo de los triángulos formados por las resctas de sus vertices
   a su centro.
Funciones auxiliares a las que llama:
   ninguna
|#

 (define angulo-central (lambda (n) (* (/ (/ 360 n) 180) pi))
   )

;; (angulo-central 3)
;; Resultado => 2.0943951023931953

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 9. c.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   apotema
Objetivo:
   Calcula el apotema de un polígono regular.
Parámetros:
 - n: número de lados.
 - l: longitud de los lados.
Resultado:
   Valor real. Aponema del polígono.
Descripción de la solucion:
   Para un cuadrado, obtenemos la distancia del centro a la mediana de alguno de sus lados.
Funciones auxiliares a las que llama:
   angulo-central
|#

 (define (apotema n l)
   (/ l (* 2 (tan (/ (angulo-central n) 2))))
   )

;; (apotema 5 5)
;; Resultado => 3.44

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 9. d.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   area
Objetivo:
   Calcula el area de un polígono regular.
Parámetros:
 - n: número de lados.
 - l: longitud de los lados.
Resultado:
   Valor real. Area del polígono.
Descripción de la solucion:
   Dado un cuadrádo (4 lados) de 20 centímetros, tenemos 400 cm².
Funciones auxiliares a las que llama:
   aponema, perimetro
|#

 (define (area n l)
   (/ (* (perimetro n l) (apotema n l)) 2)
   )

;; (area 4 2)
;; Resultado => 4.0...

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 10. a.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   areaTriangulo
Objetivo:
   Calcula el area de un triángulo a partir de sus lados usando la fórmula de Herón.
Parámetros:
 - a: lado a.
 - b: lado b.
 - c: lado c.
Resultado:
   Valor real. Area del triángulo.
Descripción de la solucion:
   Dado un triángulo de lados 3, 4 y 5, el área es 6.
Funciones auxiliares a las que llama:
   ninguna
|#

 (define (areaTriangulo a b c)
   (define s (/ (+ a b c) 2))
   (sqrt (* s (- s a)(- s b)(- s c)))
   )

;; (areaTriangulo 3 4 5)
;; Resultado => 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 10. b.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   areaRombo
Objetivo:
   Calcula el area de un rombo a partir de sus diagonales.
Parámetros:
 - d1: diagonal d1.
 - d2: diagonal d2.
Resultado:
   Valor real. Area del rombo.
Descripción de la solucion:
   Dado un rombo de diagonales 4 y 5, el área es 10.
Funciones auxiliares a las que llama:
   ninguna
|#

 (define (areaRombo d1 d2)
   (/ (* d1 d2) 2)
   )

;; (areaRombo 4 5)
;; Resultado => 2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 10. c.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   areaTrapecio
Objetivo:
   Calcula el area del trapecio a partir de sus bases y altura.
Parámetros:
 - b1: base b1.
 - b2: base b2.
 - h: altura.
Resultado:
   Valor real. Area del trapecio.
Descripción de la solucion:
   Dado un trapecio de bases 8 y 4 y altura 3, el área es 18.
Funciones auxiliares a las que llama:
   ninguna
|#

 (define (areaTrapecio b1 b2 h)
   (* (/ (+ b1 b2) 2) h)
   )

;; (areaTrapecio 8 4 3)
;; Resultado => 4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 11. a.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   D2
Objetivo:
   Calcula la distancia euclidiana o distancia L2 entre dos puntos P1 = (x1, y1) y P2 = (x2, y2).
Parámetros:
 - x1: coordenada x P1.
 - y1: coordenada y P1.
 - x2: coordenada x P2.
 - y2: coordenada y P2.
Resultado:
   Valor real. Distancia euclidiana.
Descripción de la solucion:
   Para los puntos 0 0 y 1 1 la distancia es 1.41..
Funciones auxiliares a las que llama:
   ninguna
|#

 (define (D2 x1 y1 x2 y2)
   (sqrt (+ (expt (- x2 x1) 2) (expt (- y2 y1) 2)))
   )

;; (D2 0 0 1 1)
;; Resultado => 1.41..

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 11. b.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   D1
Objetivo:
   distancia de Manhattan, distancia de la ciudad de los bloques o distancia L1.
Parámetros:
 - x1: coordenada x P1.
 - y1: coordenada y P1.
 - x2: coordenada x P2.
 - y2: coordenada y P2.
Resultado:
   Valor real. Distancia de Manhattan.
Descripción de la solucion:
   Para los puntos 0 0, 1 1, la distancia es 2.
Funciones auxiliares a las que llama:
   ninguna
|#

 (define (D1 x1 y1 x2 y2)
   (+ (abs (- x2 x1)) (abs (- y2 y1)))
   )

;; (D1 0 0 1 1)
;; Resultado => 2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 11. c.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   Dmax
Objetivo:
   Calcula la distancia de ajedrez, distancia de Chebyshev o distancia L00.
Parámetros:
 - x1: coordenada x P1.
 - y1: coordenada y P1.
 - x2: coordenada x P2.
 - y2: coordenada y P2.
Resultado:
   Valor real. Distancia de ajedrez.
Descripción de la solucion:
   Para los puntos 0 0 y 1 2 la distancia es 2.
Funciones auxiliares a las que llama:
   ninguna
|#

 (define (Dmax x1 y1 x2 y2)
   (max (abs (- x2 x1)) (abs (- y2 y1)))
   )

;; (Dmax 0 0 1 2)
;; Resultado => 2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 12.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   areaTrianguloVertices
Objetivo:
   Calcula el área del triángulo a partir de sus vértices.
Parámetros:
 - x1: coordenada x P1.
 - y1: coordenada y P1.
 - x2: coordenada x P2.
 - y2: coordenada y P2.
 - x3: coordenada x P3.
 - y3: coordenada y P3.
Resultado:
   Valor real. Area del triángulo.
Descripción de la solucion:
   Dados los puntos 0 0 , 3 0 y 0 4 el área es 6.
Funciones auxiliares a las que llama:
   areaTriangulo, D2
|#

(define (areaTrianguloVertices x1 y1 x2 y2 x3 y3)
  (let ((A (D2 x1 y1 x2 y2))
        (B (D2 x2 y2 x3 y3))
        (C (D2 x3 y3 x1 y1)))
    (areaTriangulo A B C)))

;; (areaTrianguloVertices 0 0 4 0 0 3)
;; Resultado => 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 13.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   areaRomboVerticesLet
Objetivo:
   Calcula el área del rombo a partir de sus vértices.
Parámetros:
 - x1: coordenada x P1 (Primer punto Diagonal d1).
 - y1: coordenada y P1 (Primer punto Diagonal d1).
 - x2: coordenada x P2 (Segundo punto Diagonal d1).
 - y2: coordenada y P2 (Segundo punto Diagonal d1).
 - x3: coordenada x P3 (Primer punto Diagonal d2).
 - y3: coordenada y P3 (Primer punto Diagonal d2).
 - x4: coordenada x P4 (Segundo punto Diagonal d2).
 - y4: coordenada y P4 (Segundo punto Diagonal d2).
Resultado:
   Valor real. Area del rombo.
Descripción de la solucion:
   Dados los puntos 0 0, 4 0, 2 3 y 2 -3, el área es 12.
Funciones auxiliares a las que llama:
   areaRombo, D2
|#

(define (areaRomboVerticesLet x1 y1 x2 y2 x3 y3 x4 y4)
  (let ((d1 (D2 x1 y1 x2 y2))
        (d2 (D2 x3 y3 x4 y4))
        )
    (areaRombo d1 d2)))

;; (areaRomboVerticesLet 0 0 4 0 2 3 2 -3)
;; Resultado => 12

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 14. a.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   distanciaPuntoRecta
Objetivo:
   Calcula la distancia que hay entre un punto y una recta.
Parámetros:
 - x0: coordenada x del punto P.
 - y0: coordenada y del punto P. 
 - a: coeficiente de x.
 - b: coeficiente de y.
 - c: término independiente.
Resultado:
   Valor real.  Distancia entre el punto y la recta.
Descripción de la solucion:
   Dada la recta definida por x + y + 4 = 0, y el punto 0 0, la distancia es 2.82..
Funciones auxiliares a las que llama:
   ninguna
|#

(define (distanciaPuntoRecta x0 y0 a b c)
  (/ (abs (+ (* a x0) (* b y0) c)) (sqrt (+ (sqr a) (sqr b))))
  )

;; (distanciaPuntoRecta 0 0 1 1 4)
;; Resultado => 2.82...

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 14. b.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   distanciaPuntoRecta2
Objetivo:
   Calcula la distancia que hay entre un punto y una recta que pasa por lo spunto P1 y P2.
Parámetros:
 - x0: coordenada x del punto P0. 
 - y0: coordenada y del punto P0.
 - x1: coordenada x del punto P1.
 - y1: coordenada y del punto P1.
 - x2: coordenada x del punto P2.
 - y2: coordenada y del punto P2.
Resultado:
   Valor real. Distancia entre el punto y la recta dado por los puntos P1 y P2.
Descripción de la solucion:
   Dado el punto 0 0, y la recta que pasa por 2 1 y 2 3, la distancia es 2. 
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
;; Resultado => 2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 15.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   areaTrapecioLetVertices
Objetivo:
   Calcula el área de un trapecio a partir de sus vértices.
Parámetros:
   Introducción en sentido horario, empezando por el superior izquierdo.
 - x0: coordenada x del punto A. 
 - y0: coordenada y del punto A.
 - x1: coordenada x del punto B.
 - y1: coordenada y del punto B.
 - x2: coordenada x del punto C.
 - y2: coordenada y del punto C.
 - x3: coordenada x del punto D.
 - y3: coordenada y del punto D.

               A----B
              /      \
             D--------C

Resultado:
   Valor real. Área del trapecio dados sus vértices.
Descripción de la solucion:
   Dados los puntos consecutivos en orden horario empezando por el superior izquierdo
   2 4, 5 4, 7 0 y 0 0, el área es 20.
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
;; Resultado => 20

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
   Valor real. Cuota mensual del préstamo hipotecario.
Descripción de la solucion:
   Dada una cantidad de dinero, interés anual y años de hipoteca, se devuelve la cuota mensual.
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
;; Resultado => 554.59...

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
   Valor real. Interes mensual del préstamo hipotecario.
Descripción de la solucion:
   Se devuelve el interes mensual dado el capital y tipo de interés.
Funciones auxiliares a las que llama:
   
|#

(define (interes-mensual c i)
  (* c (/ i 1200))
  )

;; (interes-mensual 100000 3.0)
;; Resultado => 250.0

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
   Valor real. Amortización mensual del préstamo hipotecario.
Descripción de la solucion:
   Dadas la cuota mensual y el interés, se puede calcular la amortización mensual.
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
;; Resultado => 304.59...