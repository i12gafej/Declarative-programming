#|
Archivo: graficos.rkt
Descripción: funciones de generación de gráficos y útiles
Autor: Javier García Fernández
|#


;;                           Colores utilizados en el juego
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define blanco (make-rgb 1.0 1.0 1.0))
(define rojo (make-rgb 0.9 0.1 0.2))
(define oro (make-rgb 0.8 0.8 0.03))
(define amarillo (make-rgb 0.9 0.9 0.09))
(define gris (make-rgb 0.5 0.5 0.5))
(define navy (make-rgb 0.04 0.04 0.8))
(define morosa (make-rgb 0.9 0.7 0.85))
(define morado (make-rgb 0.6 0.04 0.85))
(define tapete (make-rgb 0.2 0.8 0.3))
(define naranja (make-rgb 0.9 0.45 0.08))
(define negro (make-rgb 0.0 0.0 0.0))
(define contador (make-rgb 0.3 0.3 0.3))
(define mas (make-rgb 0.07 0.94 0.74))
(define mas-opp (make-rgb 0.06 0.16 0.27))
(define menos (make-rgb 0.94 0.28 0.078))
(define fondo (make-rgb 0.9 0.9 0.9))
(define contador2 (make-rgb 0.8 0.8 0.8))
(define beish (make-rgb 0.925 0.855 0.549))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                                FUNCIONES ÚTILES MATEMÁTICAS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: dibujar-circulo
Descripción: Dibuja un círculo sólido con el tamaño, posición y color indicados.
Parámetros:
- centro: punto que representa el centro del círculo en formato `make-posn`.
- radio: número que indica el radio del círculo.
- color: color del círculo, definido en el entorno gráfico.
Devuelve:
- void
Descripción de la solución:
Calcula las coordenadas necesarias para definir la esquina superior izquierda del rectángulo circunscrito al círculo. Dibuja el círculo como una elipse sólida, donde los lados son iguales al diámetro.
Funciones auxiliares:
- ninguna
|#

(define (dibujar-circulo centro radio color)
  ;; Define las coordenadas del círculo
  (let*
    ;; Variables locales del let secuencial
    (
     ;; Coordenada X del centro
     (cx (posn-x centro))
     ;; Coordenada Y del centro
     (cy (posn-y centro))
     ;; Diámetro es dos veces el radio
     (diametro (* 2 radio))
     ;; Coordenada X de la esquina superior izquierda
     (esquina-x (- cx radio))
     ;; Coordenada Y de la esquina superior izquierda
     (esquina-y (- cy radio))
    )
    ;; Cuerpo de la función
    ;; Dibuja una elipse sólida (círculo si diámetro = altura y anchura)
    ((draw-solid-ellipse v1) 
     (make-posn esquina-x esquina-y) 
     diametro 
     diametro 
     color)
  )
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: lista-a-posn
Descripción: Convierte una lista de pares de coordenadas en una lista de puntos `make-posn`.
Parámetros:
- puntos: lista de pares de coordenadas en formato `(x y)`, donde `x` es la coordenada X e `y` es la coordenada Y.
Devuelve:
- Lista de puntos `make-posn`, cada uno representado por su posición X e Y.
Descripción de la solución:
Aplica una función lambda que convierte cada par `(x y)` en un objeto `make-posn` mediante `map`.
Funciones auxiliares:
- ninguna
|#

(define (lista-a-posn puntos)
  (map (lambda (p) (make-posn (car p) (cadr p))) puntos))
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: D2
Descripción: Calcula la distancia euclidiana entre dos puntos en un plano 2D.
Parámetros:
- x1: Coordenada X del primer punto.
- y1: Coordenada Y del primer punto.
- x2: Coordenada X del segundo punto.
- y2: Coordenada Y del segundo punto.
Devuelve:
- Un número que representa la distancia entre los dos puntos.
Descripción de la solución:
Utiliza la fórmula de distancia euclidiana: 
  √((x2 - x1)2 + (y2 - y1)2)
Funciones auxiliares:
- ninguna
|#

(define (D2 x1 y1 x2 y2)
  (sqrt (+ (sqr (- x1 x2)) (sqr (- y1 y2))))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: lista-cuarto-circulo
Descripción: Genera una lista de puntos que forman un cuarto de círculo en un cuadrante específico, con un sentido de recorrido definido.
Parámetros:
- centrox: Coordenada X del centro del círculo.
- centroy: Coordenada Y del centro del círculo.
- radio: Longitud del radio del círculo.
- num-puntos: Número de puntos que definen el arco del cuarto de círculo.
- cuadrante: Cuadrante del círculo ('arriba-derecha, 'arriba-izquierda, 'abajo-derecha, 'abajo-izquierda).
- sentido: Dirección del recorrido ('horario o 'antihorario).
Devuelve:
- Una lista de puntos (en formato `(list x y)`) que forman el cuarto de círculo.
Descripción de la solución:
La función utiliza trigonometría para calcular los puntos del arco según el radio y un ángulo `theta`. 
El sentido horario o antihorario define cómo se generan los ángulos, y el cuadrante ajusta los signos de las coordenadas.
Funciones auxiliares:
- punto-circulo: Calcula un punto en el arco para un ángulo dado y ajusta las coordenadas según el cuadrante.
|#

(define (lista-cuarto-circulo centrox centroy radio num-puntos cuadrante sentido)
  ;; Definir una función para calcular los puntos de la circunferencia
  (define (punto-circulo r theta)
    (let ((x (* r (cos theta)))
          (y (* r (sin theta))))
      ;; Ajustar los signos según el cuadrante usando cond
      (cond
        ((eq? cuadrante 'arriba-derecha) (list (+ centrox x) (+ centroy (- y))))  ;; Cuadrante 1
        ((eq? cuadrante 'arriba-izquierda) (list (+ centrox (- x)) (+ centroy (- y))))  ;; Cuadrante 2
        ((eq? cuadrante 'abajo-izquierda) (list (+ centrox (- x)) (+ centroy y)))  ;; Cuadrante 3
        ((eq? cuadrante 'abajo-derecha) (list (+ centrox x) (+ centroy y)))  ;; Cuadrante 4
        (else (error "Cuadrante no válido")))))

  ;; Generar la lista de puntos en función del sentido
  (build-list num-puntos
              (lambda (i)
                (let ((theta (if (eq? sentido 'horario)
                                 (* (- num-puntos i 1) (/ pi 2 (- num-puntos 1)))  ;; Sentido horario
                                 (* i (/ pi 2 (- num-puntos 1))))))
                  (punto-circulo radio theta)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: calcular-centroide
Descripción: Calcula el centroide de un triángulo definido por tres vértices dados.
Parámetros:
- x1, y1: Coordenadas del primer vértice del triángulo.
- x2, y2: Coordenadas del segundo vértice del triángulo.
- x3, y3: Coordenadas del tercer vértice del triángulo.
Devuelve:
- Un vector con las coordenadas `(x, y)` del centroide.
Descripción de la solución:
El centroide de un triángulo es el punto de intersección de sus medianas. Se calcula promediando las coordenadas X e Y de los tres vértices.
Funciones auxiliares:
- Ninguna.
|#

(define (calcular-centroide x1 y1 x2 y2 x3 y3)
  (vector (/ (+ x1 x2 x3) 3) (/ (+ y1 y2 y3) 3)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: escalar-y-desplazar  
Descripción: Escala y desplaza un punto en función de un centro de referencia y un factor de escala.  
Parámetros:  
- x: Coordenada X del punto inicial.  
- y: Coordenada Y del punto inicial.  
- centrox: Coordenada X del centro de desplazamiento.  
- centroy: Coordenada Y del centro de desplazamiento.  
- escala: Factor de escala aplicado al desplazamiento.  
- centroide-x: Coordenada X del centroide de referencia.  
- centroide-y: Coordenada Y del centroide de referencia.  
Devuelve:  
Un vector con las nuevas coordenadas escaladas y desplazadas.  
Funciones auxiliares:  
Ninguna.  
|#


(define (escalar-y-desplazar x y centrox centroy escala centroide-x centroide-y)
  ;; Calcular desplazamiento en x y y respecto al centroide
  (let ((dx (- x centroide-x))
        (dy (- y centroide-y)))
    ;; Escalar y desplazar respecto al nuevo centro
    (vector (+ centrox (* escala dx)) (+ centroy (* escala dy)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: escalar-desplaza-construye2  
Descripción: Escala y desplaza un conjunto de puntos respecto a un centroide calculado a partir de otro conjunto de puntos de referencia.  
Parámetros:  
- puntos: Lista de puntos a escalar y desplazar.  
- puntos-c: Lista de puntos para calcular el centroide.  
- x: Coordenada X del nuevo centro de desplazamiento.  
- y: Coordenada Y del nuevo centro de desplazamiento.  
- escala: Factor de escala aplicado al desplazamiento.  
Devuelve:  
Una lista de puntos desplazados y escalados como objetos `posn`.  
Funciones auxiliares:  
Ninguna.  
|#


(define (escalar-desplaza-construye2 puntos puntos-c x y escala)
  ;; Calcula el centroide del conjunto de puntos
  (define total-puntos (length puntos-c))
  (define sum-x (apply + (map car puntos-c)))
  (define sum-y (apply + (map cadr puntos-c)))
  (define centroide-x (/ sum-x total-puntos))
  (define centroide-y (/ sum-y total-puntos))

  ;; Escala y desplaza cada punto con respecto al centroide
  (map (lambda (p)
         (make-posn (+ x (* escala (- (car p) centroide-x)))
                    (+ y (* escala (- (cadr p) centroide-y)))))
       puntos))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: tangentes  
Descripción: Calcula los puntos de tangencia de una circunferencia dados su centro, un punto de referencia, y el radio.  
Parámetros:  
- xc1: Coordenada X del centro de la circunferencia.  
- yc1: Coordenada Y del centro de la circunferencia.  
- x-tangente: Coordenada X del punto de referencia para calcular las tangentes.  
- y-tangente: Coordenada Y del punto de referencia para calcular las tangentes.  
- radio: Radio de la circunferencia.  
Devuelve:  
Un vector que contiene dos vectores, cada uno representando un punto de tangencia en coordenadas (X, Y).  
Descripción de la solución:  
Se calcula el punto medio entre el centro y el punto de referencia. A partir de este, se obtienen las distancias necesarias para encontrar los puntos de tangencia usando fórmulas geométricas.  
Funciones auxiliares:  
- punto-medio: Calcula el punto medio entre dos puntos.  
- distance: Calcula la distancia entre dos puntos en el plano cartesiano.  
|#


(define (tangentes xc1 yc1 x-tangente y-tangente radio)
  
;; Definir una función para calcular el punto medio entre dos puntos
(define (punto-medio x1 y1 x2 y2)
  (vector (/ (+ x1 x2) 2) (/ (+ y1 y2) 2)))

;; Función para calcular la distancia entre dos puntos
(define (distance x1 y1 x2 y2)
  (sqrt (+ (expt (- x2 x1) 2.) (expt (- y2 y1) 2))))

;; 1. Punto medio entre el vértice y centro del lóbulo
(define p-m. (punto-medio xc1 yc1 x-tangente y-tangente)) ;; A

;; 2. Calcular d (distancia entre punto medio y el centro del lóbulo)
(define d (distance (vector-ref p-m. 0) (vector-ref p-m. 1) xc1 yc1)) ;; d entre C y A

;; 3. Distancias a y h
(define a (/ (sqr radio) (* 2 d))) ;; Definimos distancia a
(define h (sqrt (- (sqr radio) (sqr a)))) ;; definimos distancia h

;; 4. Punto base
(define x2 (+ xc1 (* a (/ (- (vector-ref p-m. 0) xc1) d))))
(define y2 (+ yc1 (* a (/ (- (vector-ref p-m. 1) yc1) d))))
  
;; 5. Puntos de intersección
(define x3_1 (+ x2 (* h (/ (- (vector-ref p-m. 1) yc1) d))))
(define y3_1 (- y2 (* h (/ (- (vector-ref p-m. 0) xc1) d))))

(define x3_2 (- x2 (* h (/ (- (vector-ref p-m. 1) yc1) d))))
(define y3_2 (+ y2 (* h (/ (- (vector-ref p-m. 0) xc1) d))))

  (vector (vector x3_1 y3_1) (vector x3_2 y3_2))
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;                                 FUNCIONES QUE GENERAN FIGURAS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#|
Nombre: dibujar-corazon  
Descripción: Dibuja un corazón estilizado en el plano utilizando dos lóbulos circulares y un triángulo que los conecta.  
Parámetros:  
- centrox: Coordenada X del centro del corazón.  
- centroy: Coordenada Y del centro del corazón.  
- escala: Factor de escala para ajustar el tamaño del corazón.  
Devuelve:  
void  
Descripción de la solución:  
- Se calculan las coordenadas de los puntos clave del corazón (lóbulos y vértice inferior) utilizando la función `escalar-y-desplazar`.  
- Los puntos de tangencia entre los lóbulos y el triángulo se obtienen con la función `tangentes`.  
- Se dibujan los lóbulos circulares y el triángulo que conecta los lóbulos para completar la figura del corazón.  
Funciones auxiliares:  
- escalar-y-desplazar: Escala y desplaza las coordenadas de un punto respecto a un centroide.  
- tangentes: Calcula los puntos de tangencia de los lóbulos circulares con el triángulo.  
- dibujar-circulo: Dibuja un círculo sólido en el plano.  
|#

(define (dibujar-corazon centrox centroy escala)
  ;; Centro original del triángulo
  (define centroide-x 315)
  (define centroide-y 385)

  ;; Escalar y desplazar las coordenadas de los puntos del corazón
  (define xc1-yc1 (escalar-y-desplazar 350 350 centrox centroy escala centroide-x centroide-y))
  (define xc2-yc2 (escalar-y-desplazar 280 350 centrox centroy escala centroide-x centroide-y))
  (define xv-yv (escalar-y-desplazar 315 455 centrox centroy escala centroide-x centroide-y))

  (define xc1 (vector-ref xc1-yc1 0))
  (define yc1 (vector-ref xc1-yc1 1))
  (define xc2 (vector-ref xc2-yc2 0))
  (define yc2 (vector-ref xc2-yc2 1))
  (define xv (vector-ref xv-yv 0))
  (define yv (vector-ref xv-yv 1))

  (define radio (* escala 50))

  ;; Dibujar el corazón usando las nuevas coordenadas escaladas y desplazadas
  (define der (tangentes xc1 yc1 xv yv radio))
  (define izq (tangentes xc2 yc2 xv yv radio))

  ;; Puntos obtenidos
  (define x3_1 (vector-ref (vector-ref der 0) 0))
  (define y3_1 (vector-ref (vector-ref der 0) 1))
  (define x3_2 (vector-ref (vector-ref izq 1) 0))
  (define y3_2 (vector-ref (vector-ref izq 1) 1))

  ;; Dibujar los lóbulos derecho e izquierdo

  (dibujar-circulo (make-posn xc1 yc1) radio rojo)
  (dibujar-circulo (make-posn xc2 yc2) radio rojo)

  ;; Dibujar el triángulo que une los lóbulos
  ((draw-solid-polygon v1) 
   (list (make-posn xv yv)
         (make-posn x3_1 y3_1)
         (make-posn x3_2 y3_2)) (make-posn 0 0)
   rojo))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: dibujar-trebol  
Descripción: Dibuja un trébol estilizado compuesto por tres círculos superpuestos y un triángulo en la base.  
Parámetros:  
- centrox: Coordenada X del centro del trébol.  
- centroy: Coordenada Y del centro del trébol.  
- escala: Factor de escala para ajustar el tamaño del trébol.  
Devuelve:  
void  
Descripción de la solución:  
- Se calcula el centroide original del trébol basado en los vértices de los círculos y el triángulo.  
- Los puntos correspondientes a los centros de los círculos y los vértices del triángulo son escalados y desplazados en función del `centrox`, `centroy` y el `escala`.  
- Los círculos se dibujan en las posiciones correspondientes, seguidos por el triángulo en la base para completar la figura.  
Funciones auxiliares:  
- calcular-centroide: Calcula el centroide a partir de tres puntos.  
- escalar-y-desplazar: Escala y desplaza las coordenadas de un punto respecto a un centroide.  
- dibujar-circulo: Dibuja un círculo sólido en el plano.  
|#


(define (dibujar-trebol centrox centroy escala)
  ;; Centroide original del trébol
  (define centroide (calcular-centroide 290 270 250 350 330 350))
  (define centroide-x (vector-ref centroide 0))
  (define centroide-y (vector-ref centroide 1))

  ;; Escalar y desplazar los centros de los círculos
  (define xc1-yc1 (escalar-y-desplazar 330 350 centrox centroy escala centroide-x centroide-y))
  (define xc2-yc2 (escalar-y-desplazar 250 350 centrox centroy escala centroide-x centroide-y))
  (define xc3-yc3 (escalar-y-desplazar 290 270 centrox centroy escala centroide-x centroide-y))

  ;; Escalar y desplazar los vértices del triangulito
  (define xv1-yv1 (escalar-y-desplazar 290 380 centrox centroy escala centroide-x centroide-y))
  (define xv2-yv2 (escalar-y-desplazar 250 425 centrox centroy escala centroide-x centroide-y))
  (define xv3-yv3 (escalar-y-desplazar 330 425 centrox centroy escala centroide-x centroide-y))

  ;; Extraer las coordenadas escaladas
  (define xc1 (vector-ref xc1-yc1 0))
  (define yc1 (vector-ref xc1-yc1 1))
  (define xc2 (vector-ref xc2-yc2 0))
  (define yc2 (vector-ref xc2-yc2 1))
  (define xc3 (vector-ref xc3-yc3 0))
  (define yc3 (vector-ref xc3-yc3 1))

  (define xv1 (vector-ref xv1-yv1 0))
  (define yv1 (vector-ref xv1-yv1 1))
  (define xv2 (vector-ref xv2-yv2 0))
  (define yv2 (vector-ref xv2-yv2 1))
  (define xv3 (vector-ref xv3-yv3 0))
  (define yv3 (vector-ref xv3-yv3 1))

  (define radio (* escala 50))

  ;; Dibujar los círculos del trébol
  (dibujar-circulo (make-posn xc1 yc1) radio negro)
  (dibujar-circulo (make-posn xc2 yc2) radio negro)
  (dibujar-circulo (make-posn xc3 yc3) radio negro)

  ;; Dibujar el triangulito inferior
  ((draw-solid-polygon v1) 
   (list (make-posn xv1 yv1)
         (make-posn xv2 yv2)
         (make-posn xv3 yv3)) (make-posn 0 0)
   negro)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: dibujar-pica  
Descripción: Dibuja una figura de pica compuesta por dos círculos superiores y dos polígonos que forman el vértice y la base.  
Parámetros:  
- centrox: Coordenada X del centro de la pica.  
- centroy: Coordenada Y del centro de la pica.  
- escala: Factor de escala para ajustar el tamaño de la pica.  
Devuelve:  
void  
Descripción de la solución:  
- Se definen los radios y se calculan las posiciones escaladas de los círculos y puntos usando `escalar-y-desplazar`.  
- Los círculos superiores son dibujados primero.  
- A partir de las tangentes entre los círculos y el vértice, se construye el polígono que forma la parte superior de la pica.  
- Finalmente, se dibuja la parte baja de la pica usando un polígono inferior basado en tres puntos.  
Funciones auxiliares:  
- escalar-y-desplazar: Escala y desplaza las coordenadas de un punto respecto a un centroide.  
- dibujar-circulo: Dibuja un círculo sólido en el plano.  
- tangentes: Calcula las tangentes entre un círculo y un punto externo.  
|#


(define (dibujar-pica centrox centroy escala)
  ;; Definir el radio de los círculos
  (define radio (* escala 50))

  ;; Escalar y desplazar los centros de los círculos
  (define xc1-yc1 (escalar-y-desplazar 250 350 centrox centroy escala 290 350))
  (define xc2-yc2 (escalar-y-desplazar 330 350 centrox centroy escala 290 350))

  ;; Extraer las coordenadas escaladas
  (define xc1 (vector-ref xc1-yc1 0))
  (define yc1 (vector-ref xc1-yc1 1))
  (define xc2 (vector-ref xc2-yc2 0))
  (define yc2 (vector-ref xc2-yc2 1))

  ;; Punto superior de la pica
  (define xv-yv (escalar-y-desplazar 290 230 centrox centroy escala 290 350))
  (define xv (vector-ref xv-yv 0))
  (define yv (vector-ref xv-yv 1))

  ;; Dibujar los dos círculos de la pica
  (dibujar-circulo (make-posn xc1 yc1) radio negro)
  (dibujar-circulo (make-posn xc2 yc2) radio negro)

  ;; Calcular las tangentes entre los círculos y el vértice
  (define der (tangentes xc1 yc1 xv yv radio))
  (define izq (tangentes xc2 yc2 xv yv radio))

  ;; Puntos de las tangentes
  (define x3_1 (vector-ref (vector-ref der 0) 0))
  (define y3_1 (vector-ref (vector-ref der 0) 1))
  (define x3_2 (vector-ref (vector-ref izq 1) 0))
  (define y3_2 (vector-ref (vector-ref izq 1) 1))

  ;; Dibujar el polígono superior que conecta las tangentes con el vértice
  ((draw-solid-polygon v1) 
   (list (make-posn x3_1 y3_1)
         (make-posn x3_2 y3_2)
         (make-posn xv yv))(make-posn 0 0)
   negro)

  ;; Dibujar el polígono inferior (la parte baja de la pica)
  (define xv1-yv1 (escalar-y-desplazar 290 380 centrox centroy escala 290 350))
  (define xv2-yv2 (escalar-y-desplazar 250 425 centrox centroy escala 290 350))
  (define xv3-yv3 (escalar-y-desplazar 330 425 centrox centroy escala 290 350))

  (define xv1 (vector-ref xv1-yv1 0))
  (define yv1 (vector-ref xv1-yv1 1))
  (define xv2 (vector-ref xv2-yv2 0))
  (define yv2 (vector-ref xv2-yv2 1))
  (define xv3 (vector-ref xv3-yv3 0))
  (define yv3 (vector-ref xv3-yv3 1))

  ((draw-solid-polygon v1) 
   (list (make-posn xv1 yv1)
         (make-posn xv2 yv2)
         (make-posn xv3 yv3)) (make-posn 0 0)
   negro)
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: dibujar-diamante  
Descripción: Dibuja un diamante compuesto por cuatro vértices escalados y desplazados con respecto a un centroide.  
Parámetros:  
- centrox: Coordenada X del centro del diamante.  
- centroy: Coordenada Y del centro del diamante.  
- escala: Factor de escala para ajustar el tamaño del diamante.  
Devuelve:  
void  
Descripción de la solución:  
- Se definen las coordenadas originales de los cuatro vértices del diamante.  
- Las coordenadas son escaladas y desplazadas respecto al centroide del diamante.  
- Se extraen las coordenadas escaladas de los puntos y se utilizan para construir un polígono sólido que forma el diamante.  
Funciones auxiliares:  
- escalar-y-desplazar: Escala y desplaza las coordenadas de un punto respecto a un centroide.  
|#


(define (dibujar-diamante centrox centroy escala)
  ;; Centroide original del diamante (puedes ajustar si es necesario)
  (define centroide-x 300)
  (define centroide-y 200)

  ;; Escalar y desplazar los puntos del diamante
  (define p1 (escalar-y-desplazar 240 200 centrox centroy escala centroide-x centroide-y))
  (define p2 (escalar-y-desplazar 300 100 centrox centroy escala centroide-x centroide-y))
  (define p3 (escalar-y-desplazar 360 200 centrox centroy escala centroide-x centroide-y))
  (define p4 (escalar-y-desplazar 300 300 centrox centroy escala centroide-x centroide-y))

  ;; Extraer las coordenadas escaladas
  (define x1 (vector-ref p1 0))
  (define y1 (vector-ref p1 1))
  (define x2 (vector-ref p2 0))
  (define y2 (vector-ref p2 1))
  (define x3 (vector-ref p3 0))
  (define y3 (vector-ref p3 1))
  (define x4 (vector-ref p4 0))
  (define y4 (vector-ref p4 1))

  ;; Dibujar el diamante
  ((draw-solid-polygon v1)
   (list
    (make-posn x1 y1)
    (make-posn x2 y2)
    (make-posn x3 y3)
    (make-posn x4 y4)) (make-posn 0 0)
   rojo))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: dibujar-lista  
Descripción: Dibuja un polígono representando una letra especificada, escalada y desplazada, a partir de una lista de asociación de puntos.  
Parámetros:  
- lista-asociacion: Lista de asociación que contiene las coordenadas de las letras.  
- letra: Identificador de la letra a dibujar.  
- coordx: Coordenada X para el desplazamiento del dibujo.  
- coordy: Coordenada Y para el desplazamiento del dibujo.  
- escala: Factor de escala aplicado a las coordenadas originales.  
- color: Color del polígono que representa la letra.  
Devuelve:  
void  
Descripción de la solución:  
- Se busca la letra en la lista de asociación para obtener sus puntos originales.  
- Un bucle `do` transforma cada punto aplicando el escalado y desplazamiento, utilizando la función `escalar-y-desplazar`.  
- Los puntos transformados se convierten en objetos `posn` y se agregan a una lista acumulativa.  
- Una vez procesados todos los puntos, se dibuja el polígono utilizando los puntos transformados.  
Funciones auxiliares:  
- escalar-y-desplazar: Escala y desplaza las coordenadas de un punto con respecto a un centroide y coordenadas base.  
|#

(define (dibujar-lista lista-asociacion letra coordx coordy escala color)
  ;; Obtener la lista de puntos de la letra en la lista de asociación
  (let* ((puntos-originales (cdr (assoc letra lista-asociacion)))  ;; Extrae la lista de puntos de la letra
         (puntos-transformados '()))  ;; Inicializamos una lista vacía para los puntos transformados

    (do ((i 0 (+ i 1)))  ;; Inicialización de i en 0, lo incrementamos en cada iteración
        ((= i (length puntos-originales))  ;; Condición de parada: cuando i alcanza la longitud de la lista
         ;; Cuando el bucle termine, dibujamos el polígono con los puntos transformados
         ((draw-solid-polygon v1) puntos-transformados (make-posn 0 0) color))
      
      ;; Cuerpo del bucle
      (let* ((p (list-ref puntos-originales i))  ;; Obtenemos el i-ésimo punto en formato '(x y)
             (x (car p))  ;; Extraemos la coordenada x
             (y (cadr p))  ;; Extraemos la coordenada y
             ;; Aplicamos la transformación de escalado y desplazamiento
             (punto-transformado (escalar-y-desplazar x y coordx coordy escala 100 85))
             ;; Convertimos el vector transformado de vuelta a un `posn`
             (punto-posn (make-posn (vector-ref punto-transformado 0)
                                    (vector-ref punto-transformado 1))))
        
        ;; Agregamos el punto `posn` transformado a la lista
        (set! puntos-transformados (append puntos-transformados (list punto-posn)))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                              FUNCIONES PARA GENERAR CARTAS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: dibujar-carta  
Descripción: Dibuja una carta en la posición, escala, palo y valor especificados, utilizando una lista de asociación para los valores de las cartas.  
Parámetros:  
- cx: Coordenada X del centro de la carta.  
- cy: Coordenada Y del centro de la carta.  
- escala: Factor de escala para ajustar el tamaño de la carta.  
- palo: El palo de la carta (corazon, diamante, pica o trebol).  
- valor: El valor de la carta (número o figura).  
- lista-asociacion: Lista de asociación que contiene las coordenadas de las figuras de las cartas.  
Devuelve:  
void  
Descripción de la solución:  
- Escala y transforma las coordenadas de los bordes, símbolos y números de la carta.  
- Dibuja el contorno de la carta utilizando polígonos y curvas de los bordes.  
- Dibuja el número correspondiente usando la lista de asociación y el palo con sus respectivos símbolos (corazón, trébol, pica, diamante).  
Funciones auxiliares:  
- transformar-coordenadas: Calcula nuevas coordenadas basadas en la escala y posición de la carta.  
- lista-cuarto-circulo: Genera las curvas de los bordes de la carta según la escala.  
- lista-a-posn: Convierte una lista de puntos en objetos posn para gráficos.  
- dibujar-lista: Dibuja las figuras de los números o letras en la carta.  
- dibujar-corazon, dibujar-pica, dibujar-trebol, dibujar-diamante: Dibuja los símbolos de los palos según su forma.  
|#

(define (dibujar-carta cx cy escala palo valor lista-asociacion)
  ;; Función interna para transformar coordenadas según el centro y escala y devolver un par `(x, y)`
  (define (transformar-coordenadas x y esc)
    (list (+ cx (* esc (- x 175)))
          (+ cy (* esc (- y 350)))))

  ;; Variables de escala y color para el palo
  (let* ((escala-objetos (* escala 0.75))
         (color (cond ((or (eq? palo 'corazon) (eq? palo 'diamante)) rojo)
                      ((or (eq? palo 'pica) (eq? palo 'trebol)) negro)
                      (else (error "Palo no válido"))))
         (desplazamiento-numero-x (+ cx (* escala (- 175 175))))
         (desplazamiento-numero-y (+ cy (* escala (- 350 480))))
         (desplazamiento-palo-x (+ cx (* escala (- 175 175))))
         (desplazamiento-palo-y (+ cy (* escala (- 350 530))))
         
         ;; Definir las listas de puntos transformados para el contorno de la carta
         (list-cuerpo
          (append
           (list (transformar-coordenadas 50 100 escala)
                 (transformar-coordenadas 50 400 escala))
           (lista-cuarto-circulo (car (transformar-coordenadas 100 100 escala))
                                 (cadr (transformar-coordenadas 100 100 escala))
                                 (* escala 50) 20 'arriba-izquierda 'antihorario)
           (list (transformar-coordenadas 100 50 escala)
                 (transformar-coordenadas 250 50 escala))
           (lista-cuarto-circulo (car (transformar-coordenadas 250 100 escala))
                                 (cadr (transformar-coordenadas 250 100 escala))
                                 (* escala 50) 20 'arriba-derecha 'horario)
           (list (transformar-coordenadas 300 100 escala)
                 (transformar-coordenadas 300 400 escala))
           (lista-cuarto-circulo (car (transformar-coordenadas 250 400 escala))
                                 (cadr (transformar-coordenadas 250 400 escala))
                                 (* escala 50) 20 'abajo-derecha 'antihorario)
           (list (transformar-coordenadas 100 450 escala)
                 (transformar-coordenadas 250 450 escala))
           (lista-cuarto-circulo (car (transformar-coordenadas 100 400 escala))
                                 (cadr (transformar-coordenadas 100 400 escala))
                                 (* escala 50) 20 'abajo-izquierda 'horario))))

    ;; Dibujar el contorno de la carta
    ((draw-solid-polygon v1) (lista-a-posn list-cuerpo) (make-posn 0 0) blanco)
    ((draw-polygon v1) (lista-a-posn list-cuerpo) (make-posn 0 0) negro)
    
    ;; Dibujar el número de la carta, ajustado con las coordenadas relativas, usando la lista de asociación
    (dibujar-lista lista-asociacion valor desplazamiento-numero-x desplazamiento-numero-y escala-objetos color)

    ;; Dibujar el símbolo del palo, ajustado con las coordenadas relativas
    (cond
      ((eq? palo 'corazon) (dibujar-corazon desplazamiento-palo-x desplazamiento-palo-y escala-objetos))
      ((eq? palo 'pica) (dibujar-pica desplazamiento-palo-x desplazamiento-palo-y escala-objetos))
      ((eq? palo 'trebol) (dibujar-trebol desplazamiento-palo-x desplazamiento-palo-y escala-objetos))
      ((eq? palo 'diamante) (dibujar-diamante desplazamiento-palo-x desplazamiento-palo-y escala-objetos))
      (else (error "Palo no válido")))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: dibujar-carta-por-detras  
Descripción: Dibuja el reverso de una carta en una posición y escala específicas, con un diseño interior distintivo y un símbolo decorativo (como la patita de un gato).  
Parámetros:  
- cx: Coordenada X del centro de la carta.  
- cy: Coordenada Y del centro de la carta.  
- escala: Factor de escala para ajustar el tamaño de la carta y sus elementos.  
Devuelve:  
void  
Descripción de la solución:  
- Escala y transforma las coordenadas de los bordes exteriores e interiores de la carta según el centro y la escala.  
- Dibuja el contorno blanco de la carta y su diseño interior en color morado.  
- Añade un símbolo decorativo centrado en la parte trasera de la carta, ajustado al tamaño deseado mediante un escalado adicional.  
Funciones auxiliares:  
- transformar-coordenadas: Calcula nuevas coordenadas basadas en la posición central y el factor de escala.  
- escalar-desplaza-construye2: Escala y desplaza un conjunto de puntos para dibujar el símbolo decorativo.  
|#

(define (dibujar-carta-por-detras cx cy escala)
  ;; Función interna para transformar coordenadas según el centro y escala
  (define (transformar-coordenadas par esc)
    (make-posn (+ cx (* esc (- (car par) 175)))
               (+ cy (* esc (- (cadr par) 350)))))

  ;; Transformar cada punto en list-cuerpo y list-interior usando transformar-coordenadas
  (let* ((escala-objetos (* escala 1.2))
         (escala2 (* escala 0.9))
         
         (list-cuerpo-transformado
          (map (lambda (p)
                 (transformar-coordenadas p escala))
               list-cuerpo))
         (list-interior-transformado
          (map (lambda (p)
                 (transformar-coordenadas p escala2))
               list-cuerpo)))

    ;; Dibujar el contorno de la carta y el interior
    ((draw-solid-polygon v1) list-cuerpo-transformado (make-posn 0 0) blanco)
    ;((draw-polygon v1) list-cuerpo-transformado (make-posn 0 0) negro)
    ((draw-solid-polygon v1) list-interior-transformado (make-posn 0 0) morosa)

    ;; Dibujar la patita del gato escalada y centrada en la carta
    ((draw-solid-polygon v1)
     (escalar-desplaza-construye2 interior interior
                                  (+ cx (* escala +5))
                                  (+ cy (* escala -100))
                                  escala-objetos)
     (make-posn 0 0) blanco)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: dibujar-ficha  
Descripción: Dibuja una ficha en la posición, escala y color especificados. La ficha consta de círculos concéntricos y triángulos decorativos distribuidos simétricamente alrededor de su centro.  
Parámetros:  
- centrox: Coordenada X del centro de la ficha.  
- centroy: Coordenada Y del centro de la ficha.  
- escala: Factor de escala para ajustar el tamaño de la ficha y sus elementos.  
- color: Color principal de la ficha para los círculos y triángulos.  
Devuelve:  
void  
Descripción de la solución:  
- La ficha se compone de tres círculos concéntricos, donde el color alterna entre el principal (color) y blanco.  
- Se dibujan seis triángulos alrededor del círculo interior, cada uno definido por cuatro puntos y transformados mediante escalado y desplazamiento.  
- La posición y forma de los triángulos están calculadas para mantener simetría y dar un efecto decorativo a la ficha.  
Funciones auxiliares:  
- escalar-y-desplazar: Escala y desplaza puntos en función de un centro y un factor de escala.  
|#

(define (dibujar-ficha centrox centroy escala color)
  ;; Dibujar círculos concéntricos de la ficha
  (dibujar-circulo (make-posn centrox centroy) (* escala 50) color)   ;; Círculo externo negro
  (dibujar-circulo (make-posn centrox centroy) (* escala 44) blanco)   ;; Círculo medio blanco
  (dibujar-circulo (make-posn centrox centroy) (* escala 30) color)   ;; Círculo interno negro
  
  ;; Escalar y desplazar cada uno de los triángulos de la ficha
  ;; Triángulo 1
  (let ((p1 (escalar-y-desplazar 109 72.5 centrox centroy escala 100 100))
        (p2 (escalar-y-desplazar 114.6 56 centrox centroy escala 100 100))
        (p3 (escalar-y-desplazar 129.5 66 centrox centroy escala 100 100))
        (p4 (escalar-y-desplazar 119 78 centrox centroy escala 100 100)))
    ((draw-solid-polygon v1) (list (make-posn (vector-ref p1 0) (vector-ref p1 1))
                                   (make-posn (vector-ref p2 0) (vector-ref p2 1))
                                   (make-posn (vector-ref p3 0) (vector-ref p3 1))
                                   (make-posn (vector-ref p4 0) (vector-ref p4 1))) 
     (make-posn 0 0) color))

  ;; Triángulo 2
  (let ((p1 (escalar-y-desplazar 128.4 94 centrox centroy escala 100 100))
        (p2 (escalar-y-desplazar 144 91 centrox centroy escala 100 100))
        (p3 (escalar-y-desplazar 144 109 centrox centroy escala 100 100))
        (p4 (escalar-y-desplazar 128.4 106 centrox centroy escala 100 100)))
    ((draw-solid-polygon v1) (list (make-posn (vector-ref p1 0) (vector-ref p1 1))
                                   (make-posn (vector-ref p2 0) (vector-ref p2 1))
                                   (make-posn (vector-ref p3 0) (vector-ref p3 1))
                                   (make-posn (vector-ref p4 0) (vector-ref p4 1))) 
     (make-posn 0 0) color))

  ;; Triángulo 3
  (let ((p1 (escalar-y-desplazar 119 122 centrox centroy escala 100 100))
        (p2 (escalar-y-desplazar 129 134 centrox centroy escala 100 100))
        (p3 (escalar-y-desplazar 114 142 centrox centroy escala 100 100))
        (p4 (escalar-y-desplazar 109 127 centrox centroy escala 100 100)))
    ((draw-solid-polygon v1) (list (make-posn (vector-ref p1 0) (vector-ref p1 1))
                                   (make-posn (vector-ref p2 0) (vector-ref p2 1))
                                   (make-posn (vector-ref p3 0) (vector-ref p3 1))
                                   (make-posn (vector-ref p4 0) (vector-ref p4 1))) 
     (make-posn 0 0) color))

  ;; Triángulo 4
  (let ((p1 (escalar-y-desplazar 90.5 127 centrox centroy escala 100 100))
        (p2 (escalar-y-desplazar 85 142.5 centrox centroy escala 100 100))
        (p3 (escalar-y-desplazar 70.5 134 centrox centroy escala 100 100))
        (p4 (escalar-y-desplazar 81 122 centrox centroy escala 100 100)))
    ((draw-solid-polygon v1) (list (make-posn (vector-ref p1 0) (vector-ref p1 1))
                                   (make-posn (vector-ref p2 0) (vector-ref p2 1))
                                   (make-posn (vector-ref p3 0) (vector-ref p3 1))
                                   (make-posn (vector-ref p4 0) (vector-ref p4 1))) 
     (make-posn 0 0) color))

  ;; Triángulo 5
  (let ((p1 (escalar-y-desplazar 71.6 106 centrox centroy escala 100 100))
        (p2 (escalar-y-desplazar 56 109 centrox centroy escala 100 100))
        (p3 (escalar-y-desplazar 56 91 centrox centroy escala 100 100))
        (p4 (escalar-y-desplazar 71.6 94 centrox centroy escala 100 100)))
    ((draw-solid-polygon v1) (list (make-posn (vector-ref p1 0) (vector-ref p1 1))
                                   (make-posn (vector-ref p2 0) (vector-ref p2 1))
                                   (make-posn (vector-ref p3 0) (vector-ref p3 1))
                                   (make-posn (vector-ref p4 0) (vector-ref p4 1))) 
     (make-posn 0 0) color))

  ;; Triángulo 6
  (let ((p1 (escalar-y-desplazar 81 78 centrox centroy escala 100 100))
        (p2 (escalar-y-desplazar 70.6 65.9 centrox centroy escala 100 100))
        (p3 (escalar-y-desplazar 86 57 centrox centroy escala 100 100))
        (p4 (escalar-y-desplazar 91 72.6 centrox centroy escala 100 100)))
    ((draw-solid-polygon v1) (list (make-posn (vector-ref p1 0) (vector-ref p1 1))
                                   (make-posn (vector-ref p2 0) (vector-ref p2 1))
                                   (make-posn (vector-ref p3 0) (vector-ref p3 1))
                                   (make-posn (vector-ref p4 0) (vector-ref p4 1))) 
     (make-posn 0 0) color)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;                                  FUNCIONALIDADES GRÁFICAS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: esLetra?  
Descripción: Verifica si un carácter dado es una letra mayúscula del alfabeto inglés.  
Parámetros:  
- caracter: Carácter a verificar.  
Devuelve:  
- Booleano (#t si el carácter es una letra mayúscula, #f en caso contrario).  
Descripción de la solución:  
- Convierte el carácter a su valor entero ASCII usando `char->integer`.  
- Comprueba si el valor entero se encuentra en el rango de las letras mayúsculas (de 'A' a 'Z').  
- Devuelve `#t` si cumple la condición, y `#f` en caso contrario.  
Funciones auxiliares:  
ninguna  
|#

(define (esLetra? caracter)
  (if (and (>= (char->integer caracter) (char->integer #\A))
            (<= (char->integer caracter) (char->integer #\Z))
       )
      #t
      #f)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: esNumero?  
Descripción: Verifica si un carácter dado es un dígito numérico (0-9).  
Parámetros:  
- caracter: Carácter a verificar.  
Devuelve:  
- Booleano (#t si el carácter es un dígito numérico, #f en caso contrario).  
Descripción de la solución:  
- Convierte el carácter a su valor entero ASCII usando `char->integer`.  
- Comprueba si el valor entero se encuentra en el rango de los dígitos numéricos (de '0' a '9').  
- Devuelve `#t` si cumple la condición, y `#f` en caso contrario.  
Funciones auxiliares:  
ninguna  
|#

(define (esNumero? caracter)
  (if (and (>= (char->integer caracter) (char->integer #\0))
           (<= (char->integer caracter) (char->integer #\9)))
      #t
      #f)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: input-field  
Descripción: Renderiza un campo de entrada interactivo en pantalla que permite al usuario ingresar valores numéricos a través del teclado.  
Parámetros:  
- x: Ancho del campo de entrada.  
- y: Alto del campo de entrada.  
- pos-x: Coordenada X de la esquina superior izquierda del campo.  
- pos-y: Coordenada Y de la esquina superior izquierda del campo.  
Devuelve:  
- El valor numérico ingresado por el usuario tras presionar "Enter".  
Descripción de la solución:  
1. Ajusta el alto del campo para que no sea inferior a 40 píxeles.  
2. Dibuja un rectángulo negro como borde exterior y un rectángulo blanco como fondo interior.  
3. Itera continuamente mientras el usuario ingresa caracteres:  
   - Actualiza la cadena de texto ingresada según las teclas presionadas, limitándola a 10 caracteres.  
   - Muestra el texto actualizado dentro del campo.  
4. Devuelve el valor numérico ingresado una vez que el usuario presiona "Enter".  
Funciones auxiliares:  
- esNumero?  
- esLetra?  

Notas de bloques grandes:  
- Dibujo del campo: Se define el marco del campo de entrada (borde negro y fondo blanco).  
- Bucle de entrada: Maneja la entrada de caracteres hasta que se presiona "Enter".  
- Gestión de texto: Controla límites de longitud, caracteres válidos (letras y números), y acciones como borrar (retroceso).  
|#

(define (input-field x y pos-x pos-y)
  (let*
      ; Variables del let secuencial
      (
       ; El valor mínimo del alto es 40
       (y (if (< y 40) 40 y))
       ; La posición de las letras es a la mitad del ancho
       (letra-pos (- (/ y 2) 10)))
  ; Cuuadrantes de texto
  ((draw-solid-polygon v1)
   (list
    (make-posn pos-x pos-y)
    (make-posn (+ pos-x x) pos-y)
    (make-posn (+ pos-x x) (+ pos-y y))
    (make-posn pos-x (+ pos-y y))) (make-posn 0 0) negro)
  ((draw-solid-polygon v1)
   (list
    (make-posn (+ 5 pos-x) (+ 5 pos-y))
    (make-posn (- (+ pos-x x) 5) (+ 5 pos-y))
    (make-posn (- (+ pos-x x) 5) (- (+ pos-y y) 5))
    (make-posn (+ 5 pos-x) (+ pos-y y -5))) (make-posn 0 0) blanco)
    ; Bucle de ejecución
  (do
      ; Variables iterativas
      (
       (tecla (key-value (get-key-press v1)) (key-value (get-key-press v1)))
       (valores "" (cond
                     ; el tamaño de los valores está dentro del rango permitido
                     ((< (string-length valores) 10)
                      (cond
                        ; Caso captura del "release"
                        ((symbol? tecla) valores)
                        ; Obtiene valor
                        ((char? tecla)
                         (if (eq? tecla #\space)
                             valores           ; No hace nada con el espacio
                             (if (eq? tecla #\backspace)
                                 (cond
                                   ; Devuelve la cadena menos el último elemento
                                   ((> (string-length valores) 0)
                                    (substring valores 0 (sub1 (string-length valores))))
                                   ; Cadena vacía si solo hay uno o ningun valor
                                   ((or (= (string-length valores) 1) (= (string-length valores) 0))
                                    ""
                                    ))
                                 ; Se escribe un número o letra, pues se apendiza
                                 (if (or (esNumero? tecla) (esLetra? tecla))
                                     (string-append valores (string tecla))
                                     valores)
                                 
                              )
                          ))
                     ))
                     ; El tamaño de los valores está fuera del rango permitido
                     ((>= (string-length valores) 10)
                      (if (eq? tecla #\backspace)
                             (substring valores 0 (sub1 (string-length valores)))
                             valores))
                     
                      )))
    ; Pulsa enter para salir
      ((eq? tecla #\return) (string->number valores))
    ((draw-solid-polygon v1)
     (list
      (make-posn pos-x pos-y)
      (make-posn (+ pos-x x) pos-y)
      (make-posn (+ pos-x x) (+ pos-y y))
      (make-posn pos-x (+ pos-y y))) (make-posn 0 0) negro)
    ((draw-solid-polygon v1)
     (list
      (make-posn (+ 5 pos-x) (+ 5 pos-y))
      (make-posn (- (+ pos-x x) 5) (+ 5 pos-y))
      (make-posn (- (+ pos-x x) 5) (- (+ pos-y y) 5))
      (make-posn (+ 5 pos-x) (+ pos-y y -5))) (make-posn 0 0) blanco)
    (dibujar-texto valores (+ 10 pos-x) (+ letra-pos pos-y) 10 negro)
      ;(printf "~a\n" valores)
      ))
  
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: limpiar-figura  
Descripción: Simula el borrado de una figura en pantalla pintándola con el color de fondo.  
Parámetros:  
- puntos: Lista de puntos que definen la figura a borrar.  
- color-fondo: Color utilizado para sobrescribir la figura.  
Devuelve:  
- void  
Descripción de la solución:  
Dibuja la figura dos veces (sólida y con contorno) usando el color de fondo para cubrir completamente la figura original.  
Funciones auxiliares:  
ninguna  
|#


(define (limpiar-figura puntos color-fondo)
  ;; Dibuja la figura con el color de fondo para simular el borrado
  ((draw-solid-polygon v1) puntos (make-posn 0 0) color-fondo)
  ((draw-polygon v1) puntos (make-posn 0 0) color-fondo))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;                       FUNCIONES GENERACIÓN GRÁFICOS MESA DE BALCKJACK
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: contador-jugador  
Descripción: Dibuja un contador visual para un jugador, mostrando un valor numérico y un texto descriptivo según el tipo de contador.  
Parámetros:  
- valor: Número que representa el valor actual del contador (e.g., fichas o partidas ganadas).  
- tipo: Tipo de contador ('fichas o 'ganadas).  
Devuelve:  
- void  
Descripción de la solución:  
Dibuja un contador con un marco externo, un recuadro interior, y un texto descriptivo según el tipo de contador. También muestra el valor numérico en el recuadro.  
Funciones auxiliares:  
- dibujar-texto  
|#

(define (contador-jugador valor tipo)
  ;; Contador
  ((draw-solid-polygon v1)
   (list (make-posn 0 500) (make-posn 220 500) (make-posn 220 600)(make-posn 0 600)) (make-posn 0 0) contador)
     ;; Recuadrito interior
  ((draw-solid-polygon v1)
   (list (make-posn 10 530) (make-posn 210 530) (make-posn 210 590)(make-posn 10 590)) (make-posn 0 0) blanco)
  ((draw-solid-polygon v1)
   (list (make-posn 15 535) (make-posn 205 535) (make-posn 205 585)(make-posn 15 585)) (make-posn 0 0) negro)
  (cond
    ((eq? tipo 'fichas)
     (dibujar-texto "FICHAS" 60 507 8 fondo)
     )
    (else
     (dibujar-texto "GANADAS" 60 507 8 fondo)
     ))
  
  (dibujar-texto (number->string valor) 25 550 8 blanco)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: contador-crupier  
Descripción: Dibuja un contador visual para la banca (crupier), mostrando el número de fichas disponibles.  
Parámetros:  
- fichas: Número que representa la cantidad de fichas del crupier.  
Devuelve:  
- void  
Descripción de la solución:  
Dibuja un contador compuesto por un texto descriptivo "BANCA" en la parte superior, un marco exterior, un recuadro interior, y el número de fichas dentro del recuadro.  
Funciones auxiliares:  
- dibujar-texto  
|#


(define (contador-crupier fichas)
  (dibujar-texto "BANCA" 350 5 10 negro)
  ((draw-solid-polygon v1)
   (list (make-posn 290 30) (make-posn 510 30) (make-posn 510 100)(make-posn 290 100)) (make-posn 0 0) contador2)
  ((draw-solid-polygon v1)
   (list (make-posn 295 35) (make-posn 505 35) (make-posn 505 95)(make-posn 295 95)) (make-posn 0 0) blanco)
  ((draw-solid-polygon v1)
   (list (make-posn 300 40) (make-posn 500 40) (make-posn 500 90)(make-posn 300 90)) (make-posn 0 0) negro)
  (dibujar-texto (number->string fichas) 305 55 10 blanco)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: mesa  
Descripción: Dibuja la mesa de juego con sus componentes visuales, como el tapete, los contadores de jugador y crupier, botones de juego, y áreas de interacción.  
Parámetros:  
- valor-crupier: Número que indica la cantidad de fichas o valor actual del crupier.  
- valor-jugador: Número que indica la cantidad de fichas o valor actual del jugador.  
- tipo: Indica el tipo de juego (por ejemplo, fichas o puntuación).  
Devuelve:  
- void  
Descripción de la solución:  
El tapete y las áreas de juego son dibujados con polígonos, elipses y texto. Dependiendo del tipo de juego, se muestran botones específicos. Los valores del jugador y el crupier son representados mediante contadores visuales.  
Funciones auxiliares:  
- contador-jugador  
- contador-crupier  
- dibujar-texto  
|#

(define (mesa valor-crupier valor-jugador tipo)
  ; Tapete
  ((draw-solid-polygon v1)
   (list (make-posn 0 0) (make-posn 800 0) (make-posn 800 600)(make-posn 0 600)) (make-posn 0 0) fondo)
  ((draw-solid-polygon v1)
   (list (make-posn 0 50)(make-posn 800 50) (make-posn 800 600)(make-posn 0 600)) (make-posn 0 0) tapete)
  ; Linea tapete
  ((draw-ellipse v1)
   (make-posn 0 50) 800 100 oro)
  ((draw-solid-polygon v1)
   (list (make-posn 0 50)(make-posn 800 50) (make-posn 800 100)(make-posn 0 100)) (make-posn 0 0) tapete)

  ; Hueco arriba
  ((draw-solid-ellipse v1)
   (make-posn 0 0) 800 100 fondo)

  ;; Cuadrante de operaciones
  ((draw-polygon v1)
   (list (make-posn 0 500) (make-posn 800 500) (make-posn 800 600)(make-posn 0 600)) (make-posn 0 0) fondo)
  (contador-jugador valor-jugador tipo)

  ;; Botones de juego
  (cond
    ((eq? tipo 'fichas)
     ((draw-solid-polygon v1)
      (list (make-posn 240 520) (make-posn 500 520) (make-posn 500 580)(make-posn 240 580)) (make-posn 0 0) naranja)
     (dibujar-texto "DOBLAR" 250 530 20 fondo)
     ))
  
  ((draw-solid-polygon v1)
   (list (make-posn 520 520) (make-posn 600 520) (make-posn 600 580)(make-posn 520 580)) (make-posn 0 0) mas)
  (dibujar-texto "+" 545 533 20 mas-opp)
  ((draw-solid-polygon v1)
   (list (make-posn 620 520) (make-posn 700 520) (make-posn 700 580)(make-posn 620 580)) (make-posn 0 0) menos)
  (dibujar-texto "-" 645 530 20 mas-opp)
  ;; Cuadrante fichas crupier
  (contador-crupier valor-crupier)
  (dibujar-texto "CRUPIER" 60 200 5 blanco)
  (dibujar-texto "JUGADOR" 60 350 5 blanco)
)

#|
Nombre: actualizar-mesa  
Descripción: Actualiza los elementos visuales de la mesa de juego, incluyendo las cartas del crupier y el jugador, y los valores de las fichas o puntuaciones.  
Parámetros:  
- mano-c: Lista que representa la mano actual del crupier.  
- mano-j: Lista que representa la mano actual del jugador.  
- f-c: Número que indica las fichas o puntuación del crupier.  
- f-j: Número que indica las fichas o puntuación del jugador.  
- tipo: Indica el tipo de juego (por ejemplo, fichas o puntuación).  
Devuelve:  
- void  
Descripción de la solución:  
Llama a la función `mesa` para dibujar el fondo y los contadores. Posteriormente, utiliza `dibujar-carta` para mostrar las cartas del crupier y del jugador en sus respectivas posiciones, escalando y ubicando según corresponda.  
Funciones auxiliares:  
- mesa  
- dibujar-carta  
|#


(define (actualizar-mesa mano-c mano-j f-c f-j tipo)
  (mesa f-c f-j tipo)
  (dibujar-carta 290 400 0.3 (cadadr mano-j) (caadr mano-j) valores)
  (dibujar-carta 200 250 0.3 (cadar mano-c) (caar mano-c) valores)
  (dibujar-carta 200 400 0.3 (cadar mano-j) (caar mano-j) valores)
  
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;                                    CAJAS DE TEXTO DE INPUT O OUTPUT DEL JUEGO
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: apostar  
Descripción: Dibuja la interfaz gráfica para que el jugador seleccione la cantidad de fichas que desea apostar y devuelve el valor de la apuesta seleccionada.  
Parámetros:  
- fichas-jugador: Número de fichas disponibles para el jugador.  
Devuelve:  
- La cantidad seleccionada para la apuesta (20, 50, 100, 200, 500 o 1000).  
Descripción de la solución:  
La función dibuja el marco de selección de apuesta y las fichas correspondientes con sus valores. Utiliza coordenadas predefinidas para ubicar las fichas gráficamente y un bucle `let loop` para detectar clics del usuario. Dependiendo de la posición del clic y la cantidad de fichas disponibles, devuelve el valor de la apuesta. Si el clic no es válido, continúa esperando.  
Funciones auxiliares:  
- D2: Calcula la distancia euclidiana entre dos puntos.  
- dibujar-texto: Dibuja texto en pantalla.  
- dibujar-ficha: Dibuja una ficha con un valor específico.  
|#




(define (apostar fichas-jugador)
  ((draw-solid-polygon v1)
    (list
     (make-posn 140 120)
     (make-posn 140 480)
     (make-posn 660 480)
     (make-posn 660 120)
     ) (make-posn 0 0) morosa)
  ((draw-polygon v1)
   (list
    (make-posn 140 120)
    (make-posn 140 480)
    (make-posn 660 480)
    (make-posn 660 120)
    ) (make-posn 0 0) negro)
  
  (dibujar-texto "ELIGE CUANTO APOSTAR" 198 171 10 blanco)
  (dibujar-texto "ELIGE CUANTO APOSTAR" 199 171 10 blanco)
  (dibujar-texto "ELIGE CUANTO APOSTAR" 200 171 10 blanco)
  (dibujar-texto "ELIGE CUANTO APOSTAR" 200 170 10 blanco)
  (dibujar-texto "ELIGE CUANTO APOSTAR" 200 171 10 blanco)
  (dibujar-texto "ELIGE CUANTO APOSTAR" 200 172 10 blanco)
  (dibujar-texto "ELIGE CUANTO APOSTAR" 200 173 10 blanco)
  ;; Ficha 20
  (dibujar-ficha 200 420 0.8 tapete)
  (dibujar-texto "2O" 183 410 10 blanco)
  ;; FIcha 50
  (dibujar-ficha 250 340 0.8 amarillo)
  (dibujar-texto "5O" 233 330 10 blanco)
  ;; Ficha 100
  (dibujar-ficha 330 280 0.8 navy)
  (dibujar-texto "1OO" 313 275 6 blanco)
  ;; Ficha 200
  (dibujar-ficha 470 280 0.8 morado)
  (dibujar-texto "2OO" 453 275 6 blanco)
  ;; Ficha 500
  (dibujar-ficha 550 340 0.8 menos)
  (dibujar-texto "5OO" 533 335 6 blanco)
  ;; Ficha 1000
  (dibujar-ficha 600 420 0.8 oro)
  (dibujar-texto "1OOO" 580 415 5 blanco)
  (let loop ()
    (let* (
           (click (get-mouse-click v1))
           (x (posn-x (mouse-click-posn click)))
           (y (posn-y (mouse-click-posn click)))
           )
     ; El radio es 40
     (cond
       ((and (<= (D2 x y 200 420)  40) (>= fichas-jugador 20))  20)
       ((and (<= (D2 x y 250 340)  40) (>= fichas-jugador 50)) 50)
       ((and (<= (D2 x y 330 280)  40) (>= fichas-jugador 100)) 100)
       ((and (<= (D2 x y 470 280)  40) (>= fichas-jugador 200)) 200)
       ((and (<= (D2 x y 550 340)  40) (>= fichas-jugador 500)) 500)
       ((and (<= (D2 x y 600 420)  40) (>= fichas-jugador 1000)) 1000)
       (else (loop))
     )
    )
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


#|
Nombre: cantidad  
Descripción: Solicita al jugador ingresar la cantidad de fichas con las que desea jugar.  
Parámetros:  
- Ninguno.  
Devuelve:  
- Un número que representa la cantidad ingresada por el jugador.  
Descripción de la solución:  
La función dibuja la interfaz gráfica para que el jugador ingrese la cantidad de fichas deseada. Utiliza `input-field` para capturar la entrada del jugador. Si la entrada es inválida, muestra un mensaje de error, espera dos segundos, limpia el mensaje de la pantalla y vuelve a solicitar la entrada. Cuando la entrada es válida, devuelve el número ingresado.  
Funciones auxiliares:  
- dibujar-texto: Dibuja texto en pantalla.  
- input-field: Captura la entrada del usuario en un cuadro de texto.  
- limpiar-figura: Borra gráficos de la pantalla.  
|#


(define (cantidad)
  ((draw-solid-polygon v1)
    (list
     (make-posn 140 120)
     (make-posn 140 480)
     (make-posn 660 480)
     (make-posn 660 120)
     ) (make-posn 0 0) morosa)
  ((draw-polygon v1)
   (list
    (make-posn 140 120)
    (make-posn 140 480)
    (make-posn 660 480)
    (make-posn 660 120)
    ) (make-posn 0 0) negro)
  (dibujar-texto "CON CUANTO QUIERES JUGAR" 163 171 10 blanco)
  (dibujar-texto "CON CUANTO QUIERES JUGAR" 164 171 10 blanco)
  (dibujar-texto "CON CUANTO QUIERES JUGAR" 165 171 10 blanco)
  (dibujar-texto "CON CUANTO QUIERES JUGAR" 165 170 10 blanco)
  (dibujar-texto "CON CUANTO QUIERES JUGAR" 165 171 10 blanco)
  (dibujar-texto "CON CUANTO QUIERES JUGAR" 165 172 10 blanco)
  (dibujar-texto "CON CUANTO QUIERES JUGAR" 165 173 10 blanco)
  (let loop
    (
     (resultado (input-field 300 20 250 250))
     )
    (cond ((not resultado)
       (dibujar-texto "ENTRADA ERRONEA\n" 250 300 10 blanco)
       (sleep 2)
       (limpiar-figura
        (list (make-posn 250 300) (make-posn 550 300) (make-posn 550 340) (make-posn 250 340))
        morosa)
       (loop (input-field 300 20 250 250))
       )
      (else resultado)
 )
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


#|
Nombre: mensaje-ganador  
Descripción: Muestra un mensaje indicando el ganador de una ronda o partida.  
Parámetros:  
- clase: indica si se trata de una 'ronda' o 'partida'.  
- ganador: especifica el ganador ('jugador' o 'crupier').  
Devuelve:  
- void.  
Descripción de la solución:  
Según los parámetros recibidos, construye el texto del mensaje dinámicamente con el tipo de clase y el ganador. Se dibuja un cuadro en pantalla con el mensaje, ajustando la escala del texto según la combinación de parámetros. El mensaje permanece en pantalla durante 5 segundos antes de continuar.  
Funciones auxiliares:  
- dibujar-texto: Dibuja texto en pantalla.  
- lista-a-posn: Convierte listas de coordenadas a objetos posn para gráficos.  
|#


(define (mensaje-ganador clase ganador)
  (let*
      (
       (clase-t (if (eq? clase 'ronda) "RONDA" "PARTIDA"))
       (ganador-t (if (eq? ganador 'jugador) "HAS GANADO LA" "CATJACK GANA LA"))
       (texto (string-append ganador-t " " clase-t))
       (escala (if (and (eq? clase 'partida)(eq? ganador 'crupier)) 12 13))
       )
    ((draw-polygon v1) (lista-a-posn (list (list 100 200) (list 700 200)(list 700 300)(list 100 300))) (make-posn 0 0) negro)
    ((draw-solid-polygon v1) (lista-a-posn (list (list 100 200) (list 700 200)(list 700 300)(list 100 300))) (make-posn 0 0) morosa)
    (dibujar-texto texto 130 230 escala blanco)
    (dibujar-texto texto 131 230 escala blanco)
    (dibujar-texto texto 132 230 escala blanco)
    (dibujar-texto texto 133 230 escala blanco)
    (sleep 5)
   )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;                                          ANIMACIONES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



#|
Nombre: mover-patita  
Descripción: Anima el movimiento de una figura representando una "patita" desde una posición inicial hasta una posición final.  
Parámetros:  
- x-inicial: posición inicial en el eje X.  
- y-inicial: posición inicial en el eje Y.  
- x-final: posición final en el eje X.  
- y-final: posición final en el eje Y.  
- escala: factor de escalado aplicado a la figura.  
- tiempo-duracion: duración total de la animación en segundos.  
- color-fondo: color utilizado para limpiar la figura tras cada paso.  
Devuelve:  
- void.  
Descripción de la solución:  
El movimiento se divide en un número definido de pasos (`pasos`). Por cada paso, la figura se dibuja en una nueva posición calculada por desplazamientos incrementales (`dx` y `dy`), se hace una pausa corta (`tiempo-paso`) para simular la animación y luego se "borra" la figura en la posición anterior usando el color de fondo. El proceso se repite hasta que la figura alcanza la posición final, donde se dibuja de forma permanente.  
Funciones auxiliares:  
- escalar-desplaza-construye2: calcula los puntos transformados de la figura según desplazamiento y escala.  
- limpiar-figura: borra la figura en la posición dada con el color de fondo.  
|#


(define (mover-patita x-inicial y-inicial x-final y-final escala tiempo-duracion color-fondo)
  ;; Divide el tiempo en pasos de animación
  (let*
      (
       (puntos contorno)
       (puntos-interior interior)
       (pasos 100)  ;; Número de pasos de la animación
       (tiempo-paso (/ tiempo-duracion pasos))  ;; Tiempo de cada paso en segundos
       (dx (/ (- x-final x-inicial) pasos))  ;; Desplazamiento en x por paso
       (dy (/ (- y-final y-inicial) pasos))
       )
     ;; Bucle de animación
  (do ((i 0 (+ i 1))
       (x-pos x-inicial (+ x-pos dx))
       (y-pos y-inicial (+ y-pos dy)))
      ((= i pasos))  ;; Condición de parada cuando hemos hecho todos los pasos
    
    ;; Dibujar la figura en la nueva posición
    ((draw-solid-polygon v1) (escalar-desplaza-construye2 puntos puntos-interior x-pos y-pos escala) (make-posn 0 0) negro)
    ((draw-solid-polygon v1) (escalar-desplaza-construye2 puntos-interior puntos-interior x-pos y-pos escala) (make-posn 0 0) beish)
    ;(dibujar-carta-por-detras)
    
    ;; Pausa para crear el efecto de animación
    (sleep tiempo-paso)

    ;; Borrar la figura en la posición anterior con el color de fondo
    (limpiar-figura (escalar-desplaza-construye2 puntos puntos-interior x-pos y-pos escala) color-fondo)
    (limpiar-figura (escalar-desplaza-construye2 puntos-interior puntos-interior x-pos y-pos escala) color-fondo)

    )
    ((draw-solid-polygon v1) (escalar-desplaza-construye2 puntos puntos-interior x-final y-final escala) (make-posn 0 0) negro)
    ((draw-solid-polygon v1) (escalar-desplaza-construye2 puntos-interior puntos-interior x-final y-final escala) (make-posn 0 0) beish)
    
  ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre: mover-patita-carta  
Descripción: Anima el movimiento de una carta acompañada de una "patita" desde una posición inicial hasta una posición final.  
Parámetros:  
- x-inicio: posición inicial en el eje X.  
- y-inicio: posición inicial en el eje Y.  
- x-fin: posición final en el eje X.  
- y-fin: posición final en el eje Y.  
- escala: factor de escalado aplicado a la figura y la carta.  
- tiempo-duracion: duración total de la animación en segundos.  
- fondo: color utilizado para limpiar la figura tras cada paso.  
Devuelve:  
- void.  
Descripción de la solución:  
El movimiento se divide en un número de pasos (`pasos`). En cada paso:  
1. Se transforman los puntos de la carta y la patita según la posición actual y la escala.  
2. Se dibujan la carta y la patita en la posición actual.  
3. Se espera un tiempo (`pausa`) para simular la animación.  
4. Se limpian la carta y la patita de la posición anterior usando el color de fondo.  
El proceso se repite hasta que se alcanza la posición final, donde la carta se dibuja de forma permanente.  
Funciones auxiliares:  
- transformar-coordenadas: transforma un punto según el centro y la escala.  
- transformar-lista: transforma una lista de puntos según el centro y la escala.  
- escalar-desplaza-construye2: calcula los puntos transformados de la patita según desplazamiento y escala.  
- limpiar-figura: borra la figura en la posición dada con el color de fondo.  
- dibujar-carta-por-detras: dibuja la carta en una posición determinada.  
|#


(define (mover-patita-carta x-inicio y-inicio x-fin y-fin escala tiempo-duracion fondo)
  ;; Calcular el número de pasos y la pausa entre ellos
  (let* ((pasos 20)
         (pausa (/ tiempo-duracion pasos))
         (delta-x (/ (- x-fin x-inicio) pasos))
         (delta-y (/ (- y-fin y-inicio) pasos)))

    ;; Función para transformar puntos según el centro y la escala
    (define (transformar-coordenadas punto esc cx cy)
      (make-posn (+ cx (* esc (- (car punto) 175)))
                 (+ cy (* esc (- (cadr punto) 350)))))
    

    ;; Función auxiliar para obtener una lista de puntos transformados
    (define (transformar-lista puntos esc cx cy)
      (map (lambda (p) (transformar-coordenadas p esc cx cy)) puntos))

    ;; Bucle para mover la carta y la patita paso a paso
    (do ((i 0 (+ i 1))
         (pos-x x-inicio (+ pos-x delta-x))
         (pos-y y-inicio (+ pos-y delta-y)))
        ((= i pasos))
      ;; Transformar listas de puntos para la posición actual
      (let* ((puntos-cuerpo (transformar-lista list-cuerpo escala pos-x pos-y))
             (puntos-interior (transformar-lista list-interior (* escala 0.9) pos-x pos-y))
             (puntos-patita (escalar-desplaza-construye2 contorno contorno pos-x pos-y (* escala 1.2)))
             (puntos-patita2 (escalar-desplaza-construye2 interior contorno pos-x pos-y (* escala 1.2))))

        (dibujar-carta-por-detras pos-x pos-y escala)
        ((draw-solid-polygon v1) puntos-patita (make-posn 0 0) negro)
        ((draw-solid-polygon v1) puntos-patita2 (make-posn 0 0) beish)
        ;; Pausa entre pasos para ver la animación
        (sleep pausa)

        ;; Limpiar la carta y la patita en la posición anterior
        (limpiar-figura puntos-cuerpo fondo)
        (limpiar-figura puntos-patita fondo)
        (limpiar-figura puntos-patita2 fondo)
        ))
    (dibujar-carta-por-detras x-fin y-fin escala)))





