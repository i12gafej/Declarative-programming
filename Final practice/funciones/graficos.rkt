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
 Descripción: Dibuja un circulo sólido con el tamaño y posición indicados
 Parametros:
 - Make-posn con coordenadas
 - Radio
 - Color
 Devuelve:
 Impresión de círculo
|#

(define (dibujar-circulo centro radio color)
  (let* ((cx (posn-x centro))        ; Coordenada X del centro
         (cy (posn-y centro))        ; Coordenada Y del centro
         (diametro (* 2 radio))      ; Diámetro es dos veces el radio
         (esquina-x (- cx radio))    ; Coordenada X de la esquina superior izquierda
         (esquina-y (- cy radio)))   ; Coordenada Y de la esquina superior izquierda
    ;; Dibuja una elipse sólida, que es un círculo cuando sus lados son iguales (diámetro, diámetro)
    ((draw-solid-ellipse v1) (make-posn esquina-x esquina-y) diametro diametro color)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
 Nombre: lista-a-posn 
 Descripción: convierte una lista de pares con coordeandas de puntos
   al tipo make-posn
 Parametros:
 - puntos
 Devuelve:
  lista
|#

(define (lista-a-posn puntos)
  (map (lambda (p) (make-posn (car p) (cadr p))) puntos))
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
 Nombre: D2 
 Descripción: Distancia Eclidea entre dos puntos
 Parametros:
 - x1, y1
 - x2, y2
 Devuelve:
  Valor numérico de la distancia
|#

(define (D2 x1 y1 x2 y2)
  (sqrt (+ (sqr (- x1 x2)) (sqr (- y1 y2))))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
 Nombre: dibujar-cuarto-circlo 
 Descripción: dados los parámetros de un círculo, dibuja n puntos a n color sobre uno de los cuatro
  cuartos que tiene dicho círculo
 Parametros:
 - centrox
 - centroy
 - radio
 - num-puntos
 - color
 - cuadrante
 Devuelve:
  impresión del cuarto de círculo
|#

(define (dibujar-cuarto-circulo centrox centroy radio num-puntos color cuadrante)
  ;; Definir una función para calcular los puntos de la circunferencia
  (define (punto-circulo r theta)
    (let ((x (* r (cos theta)))
          (y (* r (sin theta))))
      ;; Ajustar los signos según el cuadrante usando cond
      (cond
        ((eq? cuadrante 'arriba-derecha) (vector (+ centrox x) (+ centroy (- y))))  ;; Cuadrante 1
        ((eq? cuadrante 'arriba-izquierda) (vector (+ centrox (- x)) (+ centroy (- y))))  ;; Cuadrante 2
        ((eq? cuadrante 'abajo-izquierda) (vector (+ centrox (- x)) (+ centroy y)))  ;; Cuadrante 3
        ((eq? cuadrante 'abajo-derecha) (vector (+ centrox x) (+ centroy y)))  ;; Cuadrante 4
        (else (error "Cuadrante no válido")))))

  ;; Generar una lista de puntos entre 0 y pi/2 utilizando build-list
  (define puntos
    (build-list (+ num-puntos 1) (lambda (i)
                                   (punto-circulo radio (* i (/ pi 2 num-puntos))))))

  ;; Dibujar las líneas entre los puntos
  (do
      ;; Variables iniciales: i empieza en 0 y se incrementa hasta (length puntos - 2)
      ((i 0 (+ i 1)))
      ;; Condición de parada: cuando i llega al penúltimo punto
      ((= i (- (length puntos) 1)))
    ;; Cuerpo de do: dibujar la línea entre el punto i y el punto i+1
    (let* ((p1 (list-ref puntos i))
           (p2 (list-ref puntos (+ i 1)))
           (x1 (vector-ref p1 0))
           (y1 (vector-ref p1 1))
           (x2 (vector-ref p2 0))
           (y2 (vector-ref p2 1)))
      ;; Dibujar la línea
      ((draw-line v1) (make-posn x1 y1) (make-posn x2 y2) color))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
 Nombre: lista-cuarto-circlo 
 Descripción: dados los parámetros de un círculo, devuelve n puntos de uno de los cuatro
  cuartos que tiene dicho círculo y en un sentido concreto
 Parametros:
 - centrox
 - centroy
 - radio
 - num-puntos
 - sentido
 - cuadrante
 Devuelve:
  lista con los puntos
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
 Descripción: dados tres puntos, calcula el centroide
 Parametros:
 - x1,y1
 - x2,y2
 - x3,y3
 Devuelve:
  vector con ambos valores
|#

(define (calcular-centroide x1 y1 x2 y2 x3 y3)
  (vector (/ (+ x1 x2 x3) 3) (/ (+ y1 y2 y3) 3)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
 Nombre: escalar-y-desplazar 
 Descripción: dado un punto, lo escala con respecto a su centroide y luego lo desplaza
 Parametros:
 - x,y: cuanto desplazar
 - centroy,centroy: nuevo centro 
 - escala: cuanta cantidad de distancia desplazar
 - centroide-x, centroide-y: centroide original del objeto
 Devuelve:
  vector con el punto desplazado y escalado
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
 Nombre: escalar-desplazar-construye-2
 Descripción: dada una lista de pares (puntos) y los puntos que conforman los bordes más exteriores,
 desplaza y escala los puntos
 Parametros:
 - x,y: cuanto desplazar
 - puntos: puntos a desplazar
 - puntos-c: puntos del centroide
 - escala: escala a la que transformar los puntos
 Devuelve:
  lista de puntos desplazados, escalador y en formato make-posn
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
 Descripción: dado una circunferencia y un punto, se calculan sus puntos de tangencia.
 Parametros:
 - xc1,yc1: centro circuunferencia
 - x-tangente,y-tangente: punto por el que pasa.
 - radio: radio de la circunferencia
 Devuelve:
  vector con los dos puntos de tangencia
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
 Descripción: se dibuja un corazón en las coordenadas indicadas
 Parametros:
 - centrox,centroy: centro corazón
 - escala: cuan grande va a ser
 Devuelve:
  impresión del corazón
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
 Descripción: se dibuja un trébol en las coordenadas indicadas
 Parametros:
 - centrox,centroy: centro trébol
 - escala: cuan grande va a ser
 Devuelve:
  impresión del trébol
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
 Descripción: se dibuja una pica en las coordenadas indicadas
 Parametros:
 - centrox,centroy: centro pica
 - escala: cuan grande va a ser
 Devuelve:
  impresión de la pica
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
 Descripción: se dibuja un diamante en las coordenadas indicadas
 Parametros:
 - centrox,centroy: centro diamante
 - escala: cuan grande va a ser
 Devuelve:
  impresión del diamante
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
 Descripción: dada una lista de puntos, dibuja dichos puntos en las coordenadas
 indicadas
 Parametros:
 - lista-asociacion: lista con todas las letras
 - letra: valor a dibujar
 - coordx,coordy: coordenadas donde dibujarlo
 - escala: cuan grande va a ser
 - color
 Devuelve:
  impresión de los puntos en un polígono sólido
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
 Descripción: dibuja una carta dada una posición, el palo y el valor.
 Parametros:
 - lista-asociacion: lista con todas las letras
 - cx,cy: coordenadas donde dibujarlo
 - escala: cuan grande va a ser
 - palo
 - valor
 Devuelve:
  impresión de la carta
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
 Descripción: dibuja la parte trasera de la carta
 Parametros:
 - cx,cy: coordenadas donde dibujarlo
 - escala: cuan grande va a ser
 Devuelve:
  impresión de la carta por detras
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
               list-interior)))

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
 Descripción: dibuja una ficha dado un centro, escala y color
 Parametros:
 - centrox,centroy: coordenadas donde dibujarlo
 - escala: cuan grande va a ser
 - color
 Devuelve:
  impresión de los puntos en un polígono sólido
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
 Descripción: dado un valor obtenido por teclado, indica si es letra
 Parametros:
 - caracter
 Devuelve:
  Booleano
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
 Descripción: dado un valor obtenido por teclado, indica si es número
 Parametros:
 - caracter
 Devuelve:
  Booleano
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
 Descripción: esta función genera un campo para introducir texto
 Parametros:
 - x: ancho de la caja de texto
 - y: alto de la caja de texto
 - pos-x, pos-y: posición de la esquina superior izquierda de la caja de texto
 Devuelve:
  Sting: valor introducido en la caja de texto por teclado
 Funciones a las que llama:
   esLetra?, esNumero?, dibujar-texto (letras)
|#
(define (input-field x y pos-x pos-y)
  (let*
      ((y (if (< y 40) 40 y))
       (letra-pos (- (/ y 2) 10)))   
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
  (do
      (
       (tecla (key-value (get-key-press v1)) (key-value (get-key-press v1)))
       (valores "" (cond
                     ; No sea igual a cartorce, se hace todo normal
                     ;((eq? (dibujar-texto valores (+ 10 pos-x) (+ 10 pos-y) 10 negro) 'null) "")
                     ((< (string-length valores) 10)
                      (cond
                        ((symbol? tecla) valores)
                        
                        ((char? tecla)
                         (if (eq? tecla #\space)
                             valores
                             (if (eq? tecla #\backspace)
                                 (cond
                                   ((> (string-length valores) 0)
                                    (substring valores 0 (sub1 (string-length valores))))
                                   ((or (= (string-length valores) 1) (= (string-length valores) 0))
                                    ""
                                    ))
                                 (if (or (esNumero? tecla) (esLetra? tecla))
                                     (string-append valores (string tecla))
                                     valores)
                                 
                              )
                          ))
                     ))
                     ((>= (string-length valores) 10)
                      (if (eq? tecla #\backspace)
                             (substring valores 0 (sub1 (string-length valores)))
                             valores))
                     
                      )))
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
 Descripción: genera un poligono del color indicado en los puntos indicados.
 Parametros:
 - puntos: puntos a limpiar
 - color-fondo: color en el que se devuelve la impresion
 Devuelve:
  impresión de la figura limpia
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
 Descripción: dibuja el contador del jugador
 Parametros:
 - valor: valor que tiene el jugador en su contador
 - tipo: el modo de juego que se está llevando a cabo
 Devuelve:
 impresión del dibujo del contador
 Funciones a las que llama:
   
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
 Descripción: dibuja el contador del crupier
 Parametros:
 - valor: valor que tiene el crupier en su contador
 - tipo: el modo de juego que se está llevando a cabo
 Devuelve:
 impresión del dibujo del contador
 Funciones a las que llama:
   
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
 Descripción: imprime la mesa de poker
 Parametros:
 - valor-jugador: valor que tiene el jugador en su contador
 - valor-crupier: valor que tiene el crupier en su contador
 - tipo: el modo de juego que se está llevando a cabo
 Devuelve:
  impresión de la mesa de poker
 Funciones a las que llama:
   contador-crupier, contador-jugador
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
 Descripción: imprime la mesa de poker con nuevos valores actualizados y las cartas puestas inicialmente
 Parametros:
 - mano-c: cartas del crupier
 - mano-j: cartas del jugador
 - f-c: fichas del crupier
 - f-j: fichas del jugador
 Devuelve:
  impresión de la mesa de poker actualizada
 Funciones a las que llama:
   mesa, dibujar-carta
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
 Descripción: menu de elección de fichas a apostar
 Parametros:
 - fichas-jugador: fichas que tiene el jugador
 Devuelve:
  Valor numérico: fichas a apostar
 Funciones a las que llama:
   dibujar-texto, dibujar-ficha, D2, 
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
 Descripción: mensaje para elegir la cantidad de fichas a jugar
 Parametros:
     No tiene parametros
 Devuelve:
  Valor numérico: cantidad de fichas con las que jugar
 Funciones a las que llama:
   dibujar-texto, input-field
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
 Descripción: muestra el ganador del juego, ya sea ronda o partida
 Parametros:
 - clase: modalidad de juego
 - ganador: jugador ganador
 Devuelve:
  impresión del jugador ganador y la modalidad del juego
 Funciones a las que llama:
   dibujar-texto
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
 Descripción: mueve la patita del gato por la pantalla según se indique
 Parametros:
 - x-inicia,y-inicial: coordenada donde empieza la animación.
 - x-final,y-final: coordenadas donde termina la animación.
 -  escala: tamaño de la patita.
 - tiempo-duración: de la animación.
 - color-fondo: color con el que se limpia la patita del frame anterior.
 Devuelve:
  impresión de la animación
 Funciones a las que llama:
   limpiar-figura, escalar-desplaza-construye2
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
 Descripción: mueve la patita del gato con una carta por la pantalla según se indique
 Parametros:
 - x-inicia,y-inicial: coordenada donde empieza la animación.
 - x-final,y-final: coordenadas donde termina la animación.
 - escala: tamaño de la patita.
 - tiempo-duración: de la animación.
 - color-fondo: color con el que se limpia la patita del frame anterior.
 Devuelve:
  impresión de la animación
 Funciones a las que llama:
   limpiar-figura, escalar-desplaza-construye2,dibujar-carta-por-detras
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




