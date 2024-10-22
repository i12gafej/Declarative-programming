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
    ;; Casos
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
     ;; Casos
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
       ;; Variables locales
       (u1 (- x2 x1))
       (u2 (- y2 y1))
       (v1 (- x4 x3))
       (v2 (- y4 y3))
     )
     ;; Cuerpo del Let
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 6.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   posicionRelativaRectas
Objetivo:
   Dados los coeficientes de dos rectas, se determina la posición relativa de las rectas.
Parámetros:
 - a1: coeficiente a de la recta 1.
 - b1: coeficiente b de la recta 1.
 - c1: coeficiente c de la recta 1.
 - a2: coeficiente a de la recta 2.
 - b2: coeficiente b de la recta 2.
 - c2: coeficiente c de la recta 2.
Resultado:
   Posicion relativa de las rectas.
Descripción de la solucion:
  Iguales: si son la misma recta proporcional (a1/a2 = b1/b2 = c1/c2)
  Paralelas: si son la misma recta desplazada en el eje x (a1/a2 = b1/b2 != c1/c2)
  Perpendiculares: si son secantes con 90º (a1/a2 = -b1/b2)
  Secantes: si se cortan sin tener 90º (a1/a2 != b1/b2)
Funciones auxiliares a las que llama:
   ninguno
|#

(define (posicionRelativaRectas a1 b1 c1 a2 b2 c2)
  (let
    (
      ;; Variables locales
      (determinante (- (* a1 b2) (* a2 b1)))
    )
    ;; Cuerpo del Let
    (cond
      ;; Los productos de los coeficientes son inversos
      ((= (* a1 a2) (- (* b1 b2))) "Perpendiculares")
      ;; Determinante 0 y diferente corte con eje y 
      ((and (= determinante 0)
            (not (= (/ c1 a1) (/ c2 a2))))
       "Paralelas")
      ;; Mismos coeficientes y cortes con eje y
      ((and (= (/ a1 a2) (/ b1 b2))
            (= (/ c1 c2) (/ b1 b2)))
       "Iguales")
      ;; Diferentes
      ((not (= determinante 0)) "Secantes")
    )
  )
)


;; Ejemplo de iguales
;; (posicionRelativaRectas 1 1 1 1 1 1)
;; Ejemplo de paralelas
;; (posicionRelativaRectas 1 1 1 1 1 2)
;; Ejemplo de secantes
;; (posicionRelativaRectas 1 1 1 2 1 2)
;; Ejemplo de perpendiculares
;; (posicionRelativaRectas 1 1 1 -1 1 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 7.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   posicionRelativaCircunferencias
Objetivo:
   Dadas las coordenadas de los centros y los radios, se determina la posición relativa de las circunferencias.
Parámetros:
   - x1: coordenada x del centro de la circunferencia 1.
   - y1: coordenada y del centro de la circunferencia 1.
   - r1: radio de la circunferencia 1.
   - x2: coordenada x del centro de la circunferencia 2.
   - y2: coordenada y del centro de la circunferencia 2.
   - r2: radio de la circunferencia 2.
Resultado:
   Posicion relativa de las circunferencias.
Descripción de la solucion:
   - 1. Iguales: si son la misma circunferencia (x1 = x2 y y1 = y2 y r1 = r2)
   - 2. Concentricas: si tienen el mismo centro (x1 = x2 y y1 = y2 y r1 != r2)
   - 3. Tangentes por dentro: si la distancia entre los centros es igual a la diferencia de los radios
   - 4. Tangentes por fuera: si la distancia entre los centros es igual a la suma de los radios
   - 5. Exteriores: si la distancia entre los centros es mayor a la suma de los radios
   - 6. Interiores: si la distancia entre los centros es menor a la diferencia de los radios
   - 7. Secantes por dentro: Distancia de los centros menor al mayor de los radios y menor a la distancia entre los centros
   - 8. Secantes por fuera: Distancia de los centros mayor al mayor de los radios y menor a la distancia entre los centros
Funciones auxiliares a las que llama:
   ninguna
|#

(define (posicionRelativaCircunferencias x1 y1 r1 x2 y2 r2)
  (let
    (
      ;; Variables locales
      (distanciaCentros (sqrt (+ (sqr (- x2 x1)) (sqr (- y2 y1)))))
    )
    ;; Cuerpo del Let
    (cond
      ;; La misma circunferencia con el mismo radio
      ((and (= x1 x2) (= y1 y2) (= r1 r2)) 1)
      ;; Mismo centro distinto radio
      ((and (= x1 x2) (= y1 y2) (not (= r1 r2))) 2)
      ;; Distancia dentro igual a suma de los radios
      ((= distanciaCentros (+ r1 r2)) 4)
      ;; Distancia centro igual a resta de los radios
      ((= distanciaCentros (abs (- r1 r2))) 3)
      ;; Distancia centro mayor a la suma de los radios
      ((> distanciaCentros (+ r1 r2)) 5)
      ;; Distancia centro menor a la suma de los radios
      ((< distanciaCentros (abs (- r1 r2))) 6)
      ;; Distancia de los centros menor al mayor de los radios y menor a la distancia entre los centros
      ((and (< distanciaCentros (max r1 r2)) (< distanciaCentros (+ r1 r2))) 7)
      ;; Distancia de los centros mayor al mayor de los radios y menor a la distancia entre los centros
      ((and (> distanciaCentros (max r1 r2)) (< distanciaCentros (+ r1 r2))) 8)
      (else 8)
    )
  )
)


;; Ejemplo de iguales
 ;;(posicionRelativaCircunferencias 0 0 1 0 0 1)
;; Ejemplo de concentricas
 ;;(posicionRelativaCircunferencias 0 0 1 0 0 2)
;; Ejemplo de tangentes por dentro
 ;;(posicionRelativaCircunferencias 0 0 1 1 0 2)
;; Ejemplo de tangentes por fuera
 ;;(posicionRelativaCircunferencias 0 0 1 2 0 1)
;; Ejemplo de exteriores
;; (posicionRelativaCircunferencias 0 0 1 4 0 1)
;; Ejemplo de interiores
;; (posicionRelativaCircunferencias 0 0 1 0 1 4)
;; Ejemplo de secantes por dentro
;;(posicionRelativaCircunferencias 0 0 3 2 1 1)
;; Secante por fuera
;;(posicionRelativaCircunferencias 0 0 3 3 -2 1)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 8.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   posicionPunto
Objetivo:
   Determinar la posición de un punto (x, y) en relación con un círculo, un cuadrado y un rombo.
Parámetros:
 - x: Coordenada x del punto.
 - y: Coordenada y del punto.
Resultado:
   Un valor indicando la posición relativa del punto (pertenece a la circunferencia o a los lados del cuadrado/rombo, dentro del círculo, dentro del cuadrado, etc.)
Descripción de la solución:
   Según la posición del punto, se calcula la categoría a la que pertenece el punto. Las sitancias utilizadas son la D1 o distancia de Manhattan, D2 o distancia Euclidea, y Dmax
   o distancia de ajedrez. Si la distancia entre el punto y el centro de cada figura es mayor a uno, el punto  está fuera de la figura. Si es menor o igual a 1, el punto está dentro
   de la figura. Combinando esta operación entre los distintos tipos de distancia, obtenemos un resultado. 
   Categorías:
 - 1: El punto pertenece a la circunferencia o a los lados del cuadrado/rombo
 - 2: El punto está dentro del círculo y fuera del cuadrado
 - 3: El punto está dentro del círculo y del cuadrado
 - 4: El punto está dentro del cuadrado y fuera del círculo y del rombo
 - 5: El punto está dentro del cuadrado y del rombo
 - 6: El punto está dentro del rombo y fuera del cuadrado
 - 7: En otro caso
Funciones auxiliares a las que llama:
   Dmax, D1, D2
|#

;; Distancia Ajedrez
(define (Dmax x1 y1 x2 y2)
   (max (abs (- x2 x1)) (abs (- y2 y1)))
)
;; Distancia Manhattan
(define (D1 x1 y1 x2 y2)
   (+ (abs (- x2 x1)) (abs (- y2 y1)))
)
;; Distancia Euclidea
(define (D2 x1 y1 x2 y2)
   (sqrt (+ (expt (- x2 x1) 2) (expt (- y2 y1) 2)))
)

(define (posicionPunto x y)
  (cond
    ;; Dentro de la circunferencia y fuera del cuadrado
    ((and (<= (D2 x y -1 0) 1) (> (D1 x y 0 0) 1)) 2)
    ;; Dentro de la circunferencia y del cuadrado 
    ((and (<= (D2 x y -1 0) 1) (<= (D1 x y 0 0) 1)) 3)
    ;; Dentro de la circunferencia o en los lados del rombo o cuadrado. Se pone aquí por ser más restrintiva
    ((or (< (D2 x y -1 0) 1) (or (= (D1 x y 0 0) 1) (= (Dmax x y 1 0) 1))) 1)
    ;; Dentro del cuadrado y fuera del circulo y del rombo
    ((and (> (D2 x y -1 0) 1) (<= (D1 x y 0 0) 1) (> (Dmax x y 1 0) 1)) 4)
    ;; Dentro del cuadrado y del rombo
    ((and (<= (D1 x y 0 0) 1) (<= (Dmax x y 1 0) 1)) 5)
    ;; Fuera del cuadrado y dentro del rombo
    ((and (> (D1 x y 0 0) 1) (< (Dmax x y 1 0) 1)) 6)
    ;; Otro
    (else 7)
  )
)

;; Ejemplo 1: El punto pertenece a la circunferencia o a los lados del cuadrado/rombo
;;(posicionPunto 1 0)

;; Ejemplo 2: El punto está dentro del círculo y fuera del cuadrado
;;(posicionPunto -1.1 0)

;; Ejemplo 3: El punto está dentro del círculo y del cuadrado
;;(posicionPunto -0.5 0)

;; Ejemplo 4: El punto está dentro del cuadrado y fuera del círculo y del rombo
;;(posicionPunto 0 0.7)

;; Ejemplo 5: El punto está dentro del cuadrado y del rombo
;;(posicionPunto 0.5 0)

;; Ejemplo 6: El punto está dentro del rombo y fuera del cuadrado
;;(posicionPunto 1.5 0)

;; Ejemplo 7: En otro caso
;;(posicionPunto 2 2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;; 9.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|

Nombre:
   tipoTrianguloPorAngulos
Objetivo:
   Dadas las coordenadas de los vértices de un triángulo y devuelva el
valor que le corresponde según su tipo.
Parámetros:
 - x1: coordenada x del vértice 1.
 - y1: coordenada y del vértice 1.
 - x2: coordenada x del vértice 2.
 - y2: coordenada y del vértice 2.
 - x3: coordenada x del vértice 3.
 - y3: coordenada y del vértice 3.
Resultado:
   Tipo de triángulo
Descripción de la solucion:
   Dados tres puntos desordenados, primero se calcula la distancia entre los puntos para determinar si es un triángulo. Luego se calcula el ángulo entre los puntos para determinar
   el tipo de triángulo. Si la suma de los ángulos es igual a 180º, es un triángulo. Si uno de los ángulos es igual a 90º, es un triángulo rectángulo. Si todos los ángulos son menores
   a 90º, es un triángulo acutángulo. Si uno de los ángulos es mayor a 90º y menor a 180º, es un triángulo obtusángulo. Si los tres vértices están alineados, es un triángulo nulo.

 - Recto: tiene un ángulo de 90º, es decir, p/2 radianes.
 - Acutángulo: todos sus ángulos son menores que 90º.
 - Obtusángulo: tiene un ángulo mayor de 90º y menor de 180º.
 - Nulo: los tres vértices están alineados.

Funciones auxiliares a las que llama:
   
|#



(define (tipoTrianguloPorAngulos x1 y1 x2 y2 x3 y3)
  ;; Let secuencial
  (let* (
         ;; Variables locales
         (angulo1 (angulo x1 y1 x2 y2 x1 y1 x3 y3)) 
         (angulo2 (angulo x2 y2 x1 y1 x2 y2 x3 y3)) 
         (angulo3 (angulo x3 y3 x1 y1 x3 y3 x2 y2)) 
         (sumaAngulos (+ angulo1 angulo2 angulo3))
        )
    (cond
       ;; Si dos ángulos son cercanos a 0 y el otro cercano a pi (180o)
      ((or (< angulo1 1e-6) (< angulo2 1e-6) (< angulo3 1e-6)) "Triángulo nulo")
      ;; Verificar si es un triángulo rectángulo (uno de los ángulos es 90o o pi/2)
      ((or (and (> angulo1 (- (/ pi 2) 1e-6)) (< angulo1 (+ (/ pi 2) 1e-6)))
           (and (> angulo2 (- (/ pi 2) 1e-6)) (< angulo2 (+ (/ pi 2) 1e-6)))
           (and (> angulo3 (- (/ pi 2) 1e-6)) (< angulo3 (+ (/ pi 2) 1e-6))))
       "Triángulo rectángulo")
      ;; Verificar si es un triángulo obtusángulo (un ángulo mayor de 90o)
      ((or (> angulo1 (/ pi 2)) (> angulo2 (/ pi 2)) (> angulo3 (/ pi 2)))
       "Triángulo obtusángulo")
      ;; Si todos los ángulos son menores a 90o, es un triángulo acutángulo
      (else "Triángulo acutángulo")
    )
  )
)

;; Prueba con un triángulo rectángulo
;;(tipoTrianguloPorAngulos 3 0 0 0 0 4)  

;; Prueba con un triángulo donde los puntos están alineados
;;(tipoTrianguloPorAngulos 0 0 1 1 2 2)  

;; Prueba con un triángulo acutángulo
;;(tipoTrianguloPorAngulos 0 0 2 1 1 2)  

;;Prueba con un triangulo obtusangulo
;;(tipoTrianguloPorAngulos 0 0 -2 1 2 0)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;; 10.a.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|

Nombre:
   ladosParalelos?
Objetivo:
   Dados los puntos P1, P2, P3 Y P4, devuelve si las rectas r = P1P2 y s = P3P4 son
   paralelas.
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
   Booleano. 
Descripción de la solucion:
   Primero, calcula las pendientes, y luego las compara. Si son la misma pendiente
   devuelve verdadero.
Funciones auxiliares a las que llama:
   pendiente
|#

;; Función secundaria para calcular la pendiente dados 2 puntos
 (define (pendiente x1 y1 x2 y2)
   (if (= x1 x2)
      'infinito ;; Si son rectas paralelas, devuelve infinito
      (/ (- y2 y1) (- x2 x1))) ;; Si no, se devuelve el valor de la pendiente
   )

(define (ladosParalelos? x1 y1 x2 y2 x3 y3 x4 y4)
  (let
    (
     ;; Variables locales
     (m1 (pendiente x1 y1 x2 y2))
     (m2 (pendiente x3 y3 x4 y4))
     )
  (cond
    ;; Si las pendientes son las dos infinitas
    ((and (eq? m1 'infinito) (eq? m2 'infinito)) #t)
    ;; O iguales, es verdad
    ((and (and (number? m1) (number? m2)) (= m1 m2)) #t) 
    (else #f) ;; Si no es falso
    )
  )
)

;;(if (ladosParalelos? 0 0 0 -4 1 1 1 -4) "Son paralelos")
;;(if (ladosParalelos? 0 0 1 2 1 0 2 2) "Son paralelos")
;;(if (not (ladosParalelos? 0 0 1 0 0 0 1 1)) "No son paralelos")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;; 10.b.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|

Nombre:
   perpendiculares?
Objetivo:
   Dados los puntos P1, P2, P3 Y P4, devuelve si las rectas r = P1P2 y s = P3P4 son
   perpendiculares.
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
   Booleano. 
Descripción de la solucion:
   Primero, calcula las pendientes, y luego las compara. Si son las pendientes
   son opuestas devuelve verdadero (que sean 0 o infinito, o que el producto seaa igual a -1).
Funciones auxiliares a las que llama:
   pendiente
|#
(define (perpendiculares? x1 y1 x2 y2 x3 y3 x4 y4)
  (let
    (
     ;; Variables locales
     (m1 (pendiente x1 y1 x2 y2))
     (m2 (pendiente x3 y3 x4 y4))
     )
  (cond
    ;; Si las pendientes son paralelas al eje x e y (infinito y 0)
    ((or (and (eq? m1 'infinito) (<= m2 1e-6))
         (and (eq? m2 'infinito) (<= m1 1e-6))) #t)
    ;; Si el producto de las pendientes es -1 
    ((and (number? m1) (number? m2) (= (* m1 m2) -1)) #t)
    ;; Si no, es falso
    (else #f) 
    )
  )
)

;;(if (perpendiculares? 0 0 1 0 0 0 0 1) "Son perpendiculares")
;;(if (perpendiculares? 0 0 1 2 -2 1 0 0) "Son perpendiculares")
;;(if (not (perpendiculares? 0 0 1 0 0 1 1 1)) "No son perpendiculares")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;; 11.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|

Nombre:
   areaTrapecio
Objetivo:
   Calcular el área de un trapecio dados los vértices de sus cuatro puntos, sin necesidad de que los puntos estén ordenados. La función identifica las bases paralelas del trapecio y calcula el área usando la fórmula estándar.
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
   Devuelve el área del trapecio. Si no se encuentran lados paralelos, la función devuelve 0.
Descripción de la solucion:
   1. Calcula los 6 posibles lados que pueden formarse entre los 4 puntos dados, utilizando la fórmula de la distancia euclidiana.
   2. Identifica cuáles de los lados son paralelos usando la función `ladosParalelos?`. Busca combinaciones de dos lados paralelos y los define como las bases del trapecio.
   3. Calcula la altura del trapecio como la distancia perpendicular entre las dos bases paralelas.
   4. Aplica la fórmula del área del trapecio:  A = (B_1 + B_2)/2, donde B_1 y B_2 son las longitudes de las bases y h es la altura.
Funciones auxiliares a las que llama:
   D2, ladosParalelos?, pendiente, distanciaPuntoRecta, areaTrapecioLetVertices
|#

;; Función Auxiliar distanciaPuntoRecta
(define (distanciaPuntoRecta x0 y0 x1 y1 x2 y2)
  
  (let
      ;; Variables locales
      ((a (- y2 y1))
        (b (- x1 x2))
        (c (- (* x2 y1) (* x1 y2))))
    ;; Cuerpo del let
    (/ (abs (+ (* a x0) (* b y0) c)) (sqrt (+ (expt a 2) (expt b 2))))))

;; Función de la práctica 1 areaTrapecioLetVertices
(define (areaTrapecioLetVertices x0 y0 x1 y1 x2 y2 x3 y3)
  (let
      ;;Variables locales
      ((base1 (D2 x0 y0 x1 y1))
        (base2 (D2 x3 y3 x2 y2))
        (h (distanciaPuntoRecta x3 y3 x0 y0 x1 y1)))
    ;; Cuerpo del let
    (* (/ (+ base1 base2) 2.) h)))

(define (areaTrapecio x1 y1 x2 y2 x3 y3 x4 y4)
  (let
      ;; VAraibles localres
      ((paralelo12-34 (ladosParalelos? x1 y1 x2 y2 x3 y3 x4 y4))
        (paralelo13-24 (ladosParalelos? x1 y1 x3 y3 x2 y2 x4 y4))
        (paralelo14-23 (ladosParalelos? x1 y1 x4 y4 x2 y2 x3 y3)))
    ;;Cuerpo del let
    (cond
      ;; Si los lados 1-2 y 3-4 son paralelos se calcula el area con estos
      (paralelo12-34 (areaTrapecioLetVertices x1 y1 x2 y2 x3 y3 x4 y4))
      ;; Si los lados 1-3 y 2-4 son paralelos se calcula el area con estos
      (paralelo13-24 (areaTrapecioLetVertices x1 y1 x3 y3 x2 y2 x4 y4))
      ;; Si los lados 1-4 y 2-3 son paralelos se calcula el area con estos
      (paralelo14-23 (areaTrapecioLetVertices x1 y1 x4 y4 x2 y2 x3 y3))
      )))

;; Ejemplo 1: Trapecio con bases paralelas horizontales
;;(areaTrapecio 0 0 4 0 3 3 -1 3)
;; Salida esperada: 12

;; Ejemplo 2: Trapecio rotado, con bases paralelas inclinadas
;;(areaTrapecio 0 0 3 3 6 3 9 0)
;; Salida esperada: 18

;; Ejemplo 3: Trapecio donde los puntos no están en orden
;;(areaTrapecio 1 1 4 1 3 5 0 5)
;; Salida esperada: 16

;; Ejemplo 4: Trapecio muy angosto
;;(areaTrapecio 0 0 2 0 1 0.1 1 -0.1)
;; Salida esperada: 0.2

;; Ejemplo 5: Caso inválido (no se forma un trapecio)
;;(areaTrapecio 0 0 1 1 2 2 3 3)
;; Salida esperada: No es un trapecio válido


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;; 12.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|

Nombre:
   areaRombo
Objetivo:
   Calcular el área de un rombo dados los vértices de sus cuatro puntos, sin necesidad de que los puntos estén ordenados. La función identifica las diagonales perpendiculares del rombo y calcula el área usando la fórmula estándar.
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
   Devuelve el área del rombo. Si la fiura indicada no es un rombo, la función devuelve 0.
Descripción de la solucion:
   1. Calcula las 6 posibles diagonales que pueden formarse entre los 4 puntos dados, utilizando la fórmula de la distancia euclidiana.
   2. Identifica cuáles de las diagonales son perpendiculares usando la función `perpendiculares?`. Busca combinaciones de las diagonales perpendiculares y los define como las diagonales del rombo.
   4. Aplica la fórmula del área del rombo: A = (d1 * d2) / 2, donde `d1` y `d2` son las longitudes de las diagonales perpendiculares.
Funciones auxiliares a las que llama:
   D2, perpendiculares?, pendiente, distanciaPuntoRecta, areaRomboVerticesLet
|#

;; Función que calcula el área del rombo dado por las diagonales
(define (areaRomboVerticesLet x1 y1 x2 y2 x3 y3 x4 y4)
  (let
      ;;Variables locales
      ((d1 (D2 x1 y1 x2 y2)) 
        (d2 (D2 x3 y3 x4 y4)))
    ;;Cuerpo del let
    (/ (* d1 d2) 2))) 

;; Función principal que calcula el área del rombo
(define (areaRombo x1 y1 x2 y2 x3 y3 x4 y4)
  (let
      ;,Variables locales
      ((diag12-34 (perpendiculares? x1 y1 x2 y2 x3 y3 x4 y4))
        (diag13-24 (perpendiculares? x1 y1 x3 y3 x2 y2 x4 y4))
        (diag14-23 (perpendiculares? x1 y1 x4 y4 x2 y2 x3 y3)))
    ;; Cuerpo del let
    (cond
      ;; Si los lados 1-2 y 3-4 son perpendiculares se calcula el area con estos
      (diag12-34 (areaRomboVerticesLet x1 y1 x2 y2 x3 y3 x4 y4))
      ;; Si los lados 1-3 y 2-4 son perpendiculares se calcula el area con estos
      (diag13-24 (areaRomboVerticesLet x1 y1 x3 y3 x2 y2 x4 y4))
      ;; Si los lados 1-4 y 2-3 son perpendiculares se calcula el area con estos
      (diag14-23 (areaRomboVerticesLet x1 y1 x4 y4 x2 y2 x3 y3))
      ;; Si no es un rombo, devuelve 0
      (else 0)))) 


;; Ejemplo 1: Rombo con diagonales perpendiculares
;;(areaRombo 0 0 4 0 2 3 2 -3) ;; Salida esperada: 12

;; Ejemplo 2: Rombo con diagonales perpendiculares
;;(areaRombo 1 2 2 1 1 0 0 1) ;; Salida esperada: 2

;; Ejemplo 3: Caso inválido (no es un rombo)
;;(areaRombo 0 0 1 1 2 2 3 3) ;; Salida esperada: 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 13.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|

Nombre:
   clasificarCuadrilatero
Objetivo:
   Codificar una función que reciba las coordenadas de cuatro puntos del plano 
   y determine qué tipo de cuadrilátero convexo forman.
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
   Devuelve el tipo de cuadrilátero formado por los cuatro puntos dados. El resultado puede ser uno de los siguientes tipos:
     - "Cuadrado":             Todos los lados iguales // ángulos rectos.
     - "Rectángulo":           Lados desiguales        // ángulos rectos.
     - "Rombo":                Lados iguales           // ángulos opuestos iguales.
     - "Romboide":             Lados opuestos          // ángulos opuestos iguales.
     - "Trapecio rectangular": Dos lados paralelos     // un ángulo recto.
     - "Trapecio isósceles":   Dos lados paralelos     // otros dos lados iguales.
     - "Trapecio escaleno":    Dos lados paralelos     // otros dos lados desiguales.
     - "Cometa":               Lados contiguos iguales dos a dos.
     - "Cometa oblicuo":       Un solo par de lados contiguos iguales.
     - "Trapezoide":           Todos los lados distintos.

Descripción de la solución:
   1. Se calcula la longitud de los lados y las diagonales del cuadrilátero utilizando la fórmula de la distancia euclidiana `D2`.
   2. Se verifican cuáles lados son paralelos utilizando la función `ladosParalelos?`.
   3. Se calculan los ángulos formados por los lados, y se determina si los ángulos son rectos.
   4. Dependiendo de las propiedades de los lados y los ángulos (si son iguales, desiguales, o si son paralelos), la función clasifica el cuadrilátero en una de las categorías mencionadas.

   Hay 6 combinaciones de lados posibles (4 lados y 2 diagonales). Serian 12, 13, 14, 23, 24, 34. Cada combinación entre lados es 12-34, 13-24, 23-14,

  Los puntos se meten en orden, da igual el que sea.
Funciones auxiliares a las que llama:
   D2, ladosParalelos?, perpendiculares?, ladosIguales?

|#

;; Función auxiliar para verificar si dos lados tienen la misma longitud
(define (ladosIguales? x1 y1 x2 y2 x3 y3 x4 y4)
  (let
      ;,Variables locales
      ((lado1 (D2 x1 y1 x2 y2))
        (lado2 (D2 x3 y3 x4 y4)))
    ;; Cuerpo del let
    (< (abs (- lado1 lado2)) 1e-6)))

;; Función principal que clasifica el cuadrilátero
(define (clasificarCuadrilatero x1 y1 x2 y2 x3 y3 x4 y4)
  (let
      ;; Variables locales
       (
        ;; Lados paralelos
        (lados-paralelos-12-34 (ladosParalelos? x1 y1 x2 y2 x3 y3 x4 y4))
        (lados-paralelos-14-23 (ladosParalelos? x1 y1 x4 y4 x2 y2 x3 y3))

        ;; Lados iguales
        (lados-iguales-12-14 (ladosIguales? x1 y1 x2 y2 x1 y1 x4 y4))
        (lados-iguales-12-23 (ladosIguales? x1 y1 x2 y2 x2 y2 x3 y3))
        (lados-iguales-23-34 (ladosIguales? x2 y2 x3 y3 x3 y3 x4 y4))
        (lados-iguales-34-14 (ladosIguales? x3 y3 x4 y4 x1 y1 x4 y4))
        (lados-iguales-14-23 (ladosIguales? x1 y1 x4 y4 x2 y2 x3 y3))
        (lados-iguales-12-34 (ladosIguales? x1 y1 x2 y2 x3 y3 x4 y4))
        (lados-iguales-13-24 (ladosIguales? x1 y1 x3 y3 x2 y2 x4 y4))

        ;; Lados perpendiculares
        (perpendiculares-12-14 (perpendiculares? x1 y1 x2 y2 x1 y1 x4 y4))
        (perpendiculares-12-23 (perpendiculares? x1 y1 x2 y2 x2 y2 x3 y3))
        (perpendiculares-23-34 (perpendiculares? x2 y2 x3 y3 x3 y3 x4 y4))
        (perpendiculares-34-14 (perpendiculares? x3 y3 x4 y4 x1 y1 x4 y4))

        ;; Angulos
        (angulo-12-23 (angulo x1 y1 x2 y2 x2 y2 x3 y3))
        (angulo-23-34 (angulo x2 y2 x3 y3 x3 y3 x4 y4))
        (angulo-34-14 (angulo x3 y3 x4 y4 x4 y4 x1 y1))
        (angulo-12-14 (angulo x4 y4 x1 y1 x1 y1 x2 y2))
        )
    ;; Cuerpo del let
    (cond
      
      
      ;; Rectángulo: Ángulos rectos pero lados no necesariamente iguales
      ((and perpendiculares-12-14 perpendiculares-12-23 perpendiculares-23-34 perpendiculares-34-14 lados-iguales-12-34 lados-iguales-14-23 (not lados-iguales-12-23)) "Rectángulo")
      
      ;; Rombo: Todos los lados iguales, pero no ángulos rectos
      ((and lados-iguales-12-34 lados-iguales-14-23 lados-iguales-12-23
            (<= (- angulo-12-23 angulo-34-14) 1e-6)
            (<= (- angulo-12-14 angulo-23-34) 1e-6)
            (> (- angulo-12-14 angulo-12-23) 1e-6)
            (not (and perpendiculares-12-14 perpendiculares-12-23 perpendiculares-23-34 perpendiculares-34-14))) "Rombo")

      ;; Cuadrado: Todos los lados iguales y ángulos opuestos iguales
      ((and lados-iguales-12-34 lados-iguales-13-24 lados-iguales-12-23 perpendiculares-12-14 perpendiculares-12-23 perpendiculares-23-34 perpendiculares-34-14) "Cuadrado")
      
      ;; Romboide: Lados opuestos iguales y no ángulos rectos
      ((and lados-paralelos-12-34 lados-paralelos-14-23 lados-iguales-12-34 lados-iguales-14-23
            (not lados-iguales-12-23)
            (<= (- angulo-12-23 angulo-34-14) 1e-6)
            (<= (- angulo-12-14 angulo-23-34) 1e-6)
            (> (- angulo-12-14 angulo-12-23) 1e-6)
            (not (and perpendiculares-12-14 perpendiculares-12-23 perpendiculares-23-34 perpendiculares-34-14))) "Romboide")
      
      ;; Trapecio rectangular: Un par de lados paralelos y un ángulo recto
      ((and
        (or
         (and lados-paralelos-12-34 (not lados-paralelos-14-23)) ;; Son paralelos los lados de arriba y abajo
         (and (not lados-paralelos-14-23) lados-paralelos-12-34)
         )
        (or perpendiculares-12-14 perpendiculares-12-23 perpendiculares-23-34 perpendiculares-34-14)) "Trapecio rectangular")
      
      ;; Trapecio isósceles: Un par de lados paralelos y lados iguales
      ((and
        (or
         (and (not lados-paralelos-12-34) lados-paralelos-14-23 lados-iguales-12-34 (not lados-iguales-12-23))
         (and lados-paralelos-12-34 (not lados-paralelos-14-23) lados-iguales-14-23 (not lados-iguales-12-23))
         )
        ) "Trapecio isósceles")
      
      ;; Trapecio escaleno: Un par de lados paralelos y lados desiguales
      ((and
        (or
         (and lados-paralelos-12-34 (not lados-paralelos-14-23))
         (and lados-paralelos-14-23 (not lados-paralelos-12-34)))
        ) "Trapecio escaleno")
      
      ;; Cometa: Dos pares de lados contiguos iguales
      ((or
       (and lados-iguales-12-23 lados-iguales-34-14 (not lados-iguales-23-34) (not lados-iguales-12-14))
       (and (not lados-iguales-12-23) (not lados-iguales-34-14) lados-iguales-23-34 lados-iguales-12-14)
       ) "Cometa")
      
      ;; Cometa oblicuo: Un solo par de lados contiguos iguales
      ((or
        (and lados-iguales-12-23 (not lados-iguales-23-34) (not lados-iguales-34-14) (not lados-iguales-12-14))
        (and (not lados-iguales-12-23) lados-iguales-23-34 (not lados-iguales-34-14) (not lados-iguales-12-14))
        (and (not lados-iguales-12-23) (not lados-iguales-23-34) lados-iguales-34-14 (not lados-iguales-12-14))
        (and (not lados-iguales-12-23) (not lados-iguales-23-34) (not lados-iguales-34-14) lados-iguales-12-14)
       )
       "Cometa oblicuo")
      
      ;; Trapezoide: Todos los lados son diferentes y no paralelos
      ;;((and (not lados-paralelos-12-34) (not lados-iguales-12-34) (not lados-iguales-13-24)) "Trapezoide")
      
      ;; Por defecto, devolver que no se ha podido clasificar
      (else "Trapezoide"))))

;; Ejemplo de Cuadrado: Todos los lados iguales y ángulos rectos
;;(clasificarCuadrilatero 0 0 2 0 2 2 0 2)  ;; Cuadrado

;; Ejemplo de Rectángulo: Lados desiguales y ángulos rectos
;;(clasificarCuadrilatero 0 0 4 0 4 2 0 2)  ;; Rectángulo

;; Ejemplo de Rombo: Todos los lados iguales y ángulos no rectos
;;(clasificarCuadrilatero 0 0 1 2 0 4 -1 2)  ;; Rombo

;; Ejemplo de Romboide: Lados opuestos iguales y ángulos no rectos
;;(clasificarCuadrilatero 0 0 4 1 6 5 2 4)  ;; Romboide

;; Ejemplo de Trapecio Rectangular: Un par de lados paralelos y un ángulo recto
;;(clasificarCuadrilatero 0 0 4 0 3 2 0 2)  ;; Trapecio rectangular

;; Ejemplo de Trapecio Isósceles: Un par de lados paralelos y los lados no paralelos son iguales
;;(clasificarCuadrilatero 0 0 4 0 3 2 1 2)  ;; Trapecio isósceles

;; Ejemplo de Trapecio Escaleno: Un par de lados paralelos y los lados no paralelos son desiguales
;;(clasificarCuadrilatero 0 0 4 0 3 2 2 2)  ;; Trapecio escaleno

;; Ejemplo de Cometa: Dos pares de lados contiguos iguales
;;(clasificarCuadrilatero 0 0 1 1 0 3 -1 1)  ;; Cometa

;; Ejemplo de Cometa Oblicuo: Un solo par de lados contiguos iguales
;;(clasificarCuadrilatero 0 0 1 1 -0.5 3 -1 1)  ;; Cometa oblicuo

;; Ejemplo de Trapezoide: Todos los lados son distintos y no hay lados paralelos
;;(clasificarCuadrilatero 0 0 1 2 3 1 2 3)  ;; Trapezoide
