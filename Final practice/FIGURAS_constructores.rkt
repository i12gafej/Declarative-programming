(define color1 (make-rgb 0.9 0.1 0.2))
(define color2 (make-rgb 0.1 0.2 0.9))
(define color3 (make-rgb 0.2 0.9 0.1))
(define color4 (make-rgb 0.2 0.1 0.9))
(define color5 (make-rgb 0.0 0.0 0.0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dibujar CIRCULO
;; Descripción: Dibuja un circulo dadas
;; Parametros:
;; - Coordenadas x e y
;; - Radio
;; - Color
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (dibujar-circulo v1 centro radio color)
  (let* ((cx (posn-x centro))        ; Coordenada X del centro
         (cy (posn-y centro))        ; Coordenada Y del centro
         (diametro (* 2 radio))      ; Diámetro es dos veces el radio
         (esquina-x (- cx radio))    ; Coordenada X de la esquina superior izquierda
         (esquina-y (- cy radio)))   ; Coordenada Y de la esquina superior izquierda
    ;; Dibuja una elipse sólida, que es un círculo cuando sus lados son iguales (diámetro, diámetro)
    ((draw-solid-ellipse v1) (make-posn esquina-x esquina-y) diametro diametro color)))

;(dibujar-circulo v1 (make-posn 100 100) 100 color1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FIN FUNCIÓN DIBUJAR CIRCULO
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dibujar cuarto de círculo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (dibujar-cuarto-circulo v1 centrox centroy radio num-puntos color cuadrante)
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FIN Dibujar cuarto de circulo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Funciones obtener puntos de curva
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (lista-cuarto-circulo centrox centroy radio num-puntos cuadrante sentido)
  ;; Definir una función para calcular los puntos de la circunferencia
  (define (punto-circulo r theta)
    (let ((x (* r (cos theta)))
          (y (* r (sin theta))))
      ;; Ajustar los signos según el cuadrante usando cond
      (cond
        ((eq? cuadrante 'arriba-derecha) (make-posn (+ centrox x) (+ centroy (- y))))  ;; Cuadrante 1
        ((eq? cuadrante 'arriba-izquierda) (make-posn (+ centrox (- x)) (+ centroy (- y))))  ;; Cuadrante 2
        ((eq? cuadrante 'abajo-izquierda) (make-posn (+ centrox (- x)) (+ centroy y)))  ;; Cuadrante 3
        ((eq? cuadrante 'abajo-derecha) (make-posn (+ centrox x) (+ centroy y)))  ;; Cuadrante 4
        (else (error "Cuadrante no válido")))))

  ;; Generar la lista de puntos en función del sentido
  (let ((puntos
         (build-list num-puntos
                     (lambda (i)
                       (let ((theta (if (eq? sentido 'horario)
                                        (* (- num-puntos i 1) (/ pi 2 (- num-puntos 1)))  ;; Sentido horario
                                        (* i (/ pi 2 (- num-puntos 1))))))
                         (punto-circulo radio theta))))))
    puntos))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fin Funciones obtener puntos curva
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Calcular Centroide
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (calcular-centroide x1 y1 x2 y2 x3 y3)
  (vector (/ (+ x1 x2 x3) 3) (/ (+ y1 y2 y3) 3)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FIN FUNCIÓN CALCULAR CENTROIDE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Escalar y desplazar
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (escalar-y-desplazar x y centrox centroy escala centroide-x centroide-y)
  ;; Calcular desplazamiento en x y y respecto al centroide
  (let ((dx (- x centroide-x))
        (dy (- y centroide-y)))
    ;; Escalar y desplazar respecto al nuevo centro
    (vector (+ centrox (* escala dx)) (+ centroy (* escala dy)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FIN FUNCIÓN ESCALAR Y DESPLAZAR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FUNCION TANGENTES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FIN FUNCION TANGENTES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FUNCION DIBUJAR CORAZON
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

  (dibujar-circulo v1 (make-posn xc1 yc1) radio color1)
  (dibujar-circulo v1 (make-posn xc2 yc2) radio color1)

  ;; Dibujar el triángulo que une los lóbulos
  ((draw-solid-polygon v1) 
   (list (make-posn xv yv)
         (make-posn x3_1 y3_1)
         (make-posn x3_2 y3_2)) (make-posn 0 0)
   color1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FIN FUNCION DIBUJAR CORAZON
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FUNCION DIBUJAR TRÉBOL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
  (dibujar-circulo v1 (make-posn xc1 yc1) radio color5)
  (dibujar-circulo v1 (make-posn xc2 yc2) radio color5)
  (dibujar-circulo v1 (make-posn xc3 yc3) radio color5)
  ;((draw-solid-ellipse v1) (make-posn (- xc1 50) (- yc1 50)) (* 2 escala 50) (* 2 escala 50) color5)
  ;((draw-solid-ellipse v1) (make-posn (- xc2 50) (- yc2 50)) (* 2 escala 50) (* 2 escala 50) color5)
  ;((draw-solid-ellipse v1) (make-posn (- xc3 50) (- yc3 50)) (* 2 escala 50) (* 2 escala 50) color5)

  ;; Dibujar el triangulito inferior
  ((draw-solid-polygon v1) 
   (list (make-posn xv1 yv1)
         (make-posn xv2 yv2)
         (make-posn xv3 yv3)) (make-posn 0 0)
   color5)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FIN FUNCION DIBUJAR TRÉBOL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FUNCION DIBUJAR PICA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
  (dibujar-circulo v1 (make-posn xc1 yc1) radio color5)
  (dibujar-circulo v1 (make-posn xc2 yc2) radio color5)

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
   color5)

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
   color5)
 )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FIN FUNCION DIBUJAR PICA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FUNCIÓN DIBUJAR DIAMANTE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
   color1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FIN FUNCION DIBUJAR DIAMANTE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Listas de puntos que definen los valores de las cartas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define lista-0
  (append
   (list
    ;; Primer circulo
    (make-posn 70 320)
    (make-posn 50 300)
    (make-posn 50 170)
    (make-posn 70 150)
    (make-posn 130 150)
    (make-posn 150 170)
    (make-posn 150 190);; Interior
    (make-posn 130 190)
    (make-posn 120 170)
    (make-posn 80 170)
    (make-posn 70 190)
    (make-posn 70 280)
    (make-posn 80 300)
    (make-posn 120 300)
    (make-posn 130 280)
    (make-posn 130 190) ; Fuera
    (make-posn 150 190)
    (make-posn 150 300)
    (make-posn 130 320))))

(define lista-1 (list
         (make-posn 50 200)
         (make-posn 75 200)
         (make-posn 100 150)
         (make-posn 125 150)
         (make-posn 125 320)
         (make-posn 100 320)
         (make-posn 100 200)))

(define lista-2
(append
 (lista-cuarto-circulo 100 200 50 20 'arriba-izquierda 'antihorario)
 (lista-cuarto-circulo 100 200 50 20 'arriba-derecha 'horario)
 (list (make-posn 80 300)
 (make-posn 150 300)
 (make-posn 150 320)
 (make-posn 50 320)
 (make-posn 50 300))
 (lista-cuarto-circulo 100 200 25 20 'arriba-derecha 'antihorario)
 (lista-cuarto-circulo 100 200 25 20 'arriba-izquierda 'horario) 
 )
  )

(define lista-3
(append
 (list (make-posn 120 170)(make-posn 50 170) (make-posn 50 150)(make-posn 150 150) (make-posn 150 170))
 (lista-cuarto-circulo 100 275 50 20 'arriba-derecha 'horario)
 (lista-cuarto-circulo 100 275 50 20 'abajo-derecha 'antihorario)
 (lista-cuarto-circulo 100 275 50 20 'abajo-izquierda 'horario)
 (lista-cuarto-circulo 100 275 25 20 'abajo-izquierda 'antihorario)
 (lista-cuarto-circulo 100 275 25 20 'abajo-derecha 'horario)
 (lista-cuarto-circulo 100 275 25 20 'arriba-derecha 'antihorario)
 (list (make-posn 75 250) (make-posn 75 225))
 ))

(define lista-4
(append
 (list
  (make-posn 50 225)
  (make-posn 120 150)
  (make-posn 150 150)
  (make-posn 80 225)
  (make-posn 130 225)
  (make-posn 130 205)
  (make-posn 150 205)
  (make-posn 150 225)
  (make-posn 150 320)
  (make-posn 125 320)
  (make-posn 125 250)
  (make-posn 50 250))))

(define lista-5
(append
 (list (make-posn 50 235)(make-posn 50 150)(make-posn 150 150) (make-posn 150 170)(make-posn 75 170) (make-posn 75 210))
 (lista-cuarto-circulo 100 260 50 20 'arriba-derecha 'horario)
 (lista-cuarto-circulo 100 275 50 20 'abajo-derecha 'antihorario)
 (lista-cuarto-circulo 100 275 50 20 'abajo-izquierda 'horario)
 (lista-cuarto-circulo 100 275 25 20 'abajo-izquierda 'antihorario)
 (lista-cuarto-circulo 100 275 25 20 'abajo-derecha 'horario)
 (lista-cuarto-circulo 100 260 25 20 'arriba-derecha 'antihorario)
 ))

(define lista-6
(append
 (list (make-posn 50 320) (make-posn 50 150) (make-posn 150 150) (make-posn 150 180)
       (make-posn 80 180) (make-posn 80 225) (make-posn 150 225)
       ;;Interior
       (make-posn 150 275) (make-posn 120 275) (make-posn 120 245)
       (make-posn 80 245) (make-posn 80 295) (make-posn 120 295)
       (make-posn 120 275) (make-posn 150 275)
       ;;Esterior
       (make-posn 150 320)
       )))

(define lista-7
(append
(list
 (make-posn 50 180) (make-posn 50 150) (make-posn 150 150)
 (make-posn 150 180) (make-posn 80 320) (make-posn 50 320)
 (make-posn 120 180)
 )))

(define lista-8
  (append
   (list
    ;; Primer circulo
    (make-posn 70 230) (make-posn 50 210)
    (make-posn 50 170) (make-posn 70 150)
    (make-posn 130 150) (make-posn 150 170)
    (make-posn 150 190);; Interior
    (make-posn 130 190)
    (make-posn 110 170)
    (make-posn 90 170)(make-posn 70 190)(make-posn 90 210)
    (make-posn 110 210)
    (make-posn 130 190);; Fuera
    (make-posn 150 190)
    (make-posn 150 210)(make-posn 130 230)(make-posn 150 250)
    (make-posn 150 270);;Dentro
    (make-posn 130 270)
    (make-posn 110 250)
    (make-posn 90 250) (make-posn 70 270)(make-posn 70 280)(make-posn 90 300)
    (make-posn 110 300) (make-posn 130 280)
    (make-posn 130 270);; Fuera
    (make-posn 150 270)(make-posn 150 300)(make-posn 130 320)(make-posn 70 320)
    (make-posn 50 300)(make-posn 50 250))))

(define lista-9
  (append
   (lista-cuarto-circulo 100 200 50 20 'abajo-izquierda 'horario)
   (lista-cuarto-circulo 100 200 50 20 'arriba-izquierda 'antihorario)
   (lista-cuarto-circulo 100 200 50 20 'arriba-derecha 'horario)
   (list (make-posn 150 200) (make-posn 125 200));;Dentro
   (lista-cuarto-circulo 100 200 25 20 'arriba-derecha 'antihorario)
   (lista-cuarto-circulo 100 200 25 20 'arriba-izquierda 'horario)
   (lista-cuarto-circulo 100 200 25 20 'abajo-izquierda 'horario)
   (lista-cuarto-circulo 100 200 25 20 'abajo-derecha 'horario)
   (list (make-posn 125 200)(make-posn 150 200)(make-posn 150 225)(make-posn 100 320) (make-posn 80 320) (make-posn 130 225))))
(define lista-t
  (list
   (make-posn 50 190)(make-posn 50 150)(make-posn 150 150) (make-posn 150 190)
   (make-posn 115 190) (make-posn 115 320)(make-posn 85 320)(make-posn 85 190)
   ))

(define lista-j
  (append
  (list (make-posn 50 190)(make-posn 50 150)(make-posn 150 150) (make-posn 150 190))
  (lista-cuarto-circulo 100 270 50 20 'abajo-derecha 'antihorario)
  (list (make-posn 60 320) (make-posn 60 290))
  (lista-cuarto-circulo 100 270 20 20 'abajo-derecha 'horario)
  (list (make-posn 120 190))
  ))

(define lista-q
 (append
  (lista-cuarto-circulo 80 180 30 20 'arriba-izquierda 'antihorario)
  (lista-cuarto-circulo 120 180 30 20 'arriba-derecha 'horario)
  (list (make-posn 150 260) (make-posn 130 260))
  (lista-cuarto-circulo 120 180 10 20 'arriba-derecha 'antihorario)
  (lista-cuarto-circulo 80 180 10 20 'arriba-izquierda 'horario)
  (lista-cuarto-circulo 80 280 10 20 'abajo-izquierda 'antihorario)
  (list (make-posn 110 290) (make-posn 100 270) (make-posn 120 270)(make-posn 143 320)
        (make-posn 123 320)(make-posn 120 310))
  (lista-cuarto-circulo 80 280 30 20 'abajo-izquierda 'horario)))

(define lista-k
 (append
  (list (make-posn 50 150) (make-posn 70 150) (make-posn 70 210)
        (make-posn 130 150) (make-posn 150 150) (make-posn 70 230)
        (make-posn 150 320) (make-posn 130 320) (make-posn 70 250)
        (make-posn 70 320) (make-posn 50 320))))

(define lista-a
(append
 (list
  (make-posn 50 320)(make-posn 90 150)(make-posn 110 150)(make-posn 150 320)
  (make-posn 130 320)(make-posn 115 250)(make-posn 100 250)(make-posn 100 240)
  (make-posn 110 240)(make-posn 100 190)(make-posn 90 240)
  (make-posn 100 240)
  (make-posn 100 250) (make-posn 85 250) (make-posn 70 320)
  )))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Función dibujar lista de puntos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (dibujar-lista lista coordx coordy escala color)
  (let ((puntos-transformados '()))  ;; Inicializamos una lista vacía para los puntos transformados
    (do ((i 0 (+ i 1)))  ;; Inicialización de i en 0, lo incrementamos en cada iteración
        ((= i (length lista))  ;; Condición de parada: cuando i alcanza la longitud de la lista
         ;; Cuando el bucle termine, dibujamos el polígono con los puntos transformados
         ((draw-solid-polygon v1) puntos-transformados (make-posn 0 0) color))
      ;; Cuerpo del bucle
      (let* ((p (list-ref lista i))  ;; Obtenemos el i-ésimo elemento de la lista
             (x (posn-x p))  ;; Extraemos la coordenada x
             (y (posn-y p))  ;; Extraemos la coordenada y
             ;; Aplicamos la transformación de escalado y desplazamiento
             (punto-transformado (escalar-y-desplazar x y coordx coordy escala 100 85))
             ;; Convertimos el vector transformado de vuelta a un `posn`
             (punto-posn (make-posn (vector-ref punto-transformado 0)
                                    (vector-ref punto-transformado 1))))
        ;; Agregamos el punto `posn` transformado a la lista
        (set! puntos-transformados (append puntos-transformados (list punto-posn)))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FIN Función dibujar lista de puntos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DIBUJAR CARTA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (dibujar-carta cx cy escala palo lista)
  (let* ((escala-objetos (* escala 0.75))
         (color (cond ((or (eq? palo 'corazon) (eq? palo 'diamante)) color1)
                      ((or (eq? palo 'pica) (eq? palo 'trebol)) color5)
                      (else (error "Palo no válido"))))
         (centroide-x 175)  ;; El centroide absoluto de la carta
         (centroide-y 350)  ;; Corregido el centroide para ajustar a las coordenadas de la carta

         ;; Desplazamientos relativos
         (desplazamiento-numero-x (+ cx (* escala (- centroide-x 175))))
         (desplazamiento-numero-y (+ cy (* escala (- centroide-y 480))))

         ;; Ajustes para las posiciones del palo (ligeramente por encima del número)
         (desplazamiento-palo-x (+ cx (* escala (- centroide-x 175))))
         (desplazamiento-palo-y (+ cy (* escala (- centroide-y 530)))))

    ;; Dibujar los bordes de la carta con líneas y cuartos de círculo

    ;; Borde izquierdo y esquina superior izquierda
    ((draw-line v1) 
     (make-posn (+ cx (* escala (- 50 centroide-x))) (+ cy (* escala (- 100 centroide-y))))
     (make-posn (+ cx (* escala (- 50 centroide-x))) (+ cy (* escala (- 400 centroide-y)))) color5)
    (dibujar-cuarto-circulo v1 (+ cx (* escala (- 100 centroide-x))) (+ cy (* escala (- 100 centroide-y)))
                            (* escala 50) 20 color5 'arriba-izquierda)

    ;; Borde superior y esquina superior derecha
    ((draw-line v1) 
     (make-posn (+ cx (* escala (- 100 centroide-x))) (+ cy (* escala (- 50 centroide-y))))
     (make-posn (+ cx (* escala (- 250 centroide-x))) (+ cy (* escala (- 50 centroide-y)))) color5)
    (dibujar-cuarto-circulo v1 (+ cx (* escala (- 250 centroide-x))) (+ cy (* escala (- 100 centroide-y)))
                            (* escala 50) 20 color5 'arriba-derecha)

    ;; Borde derecho y esquina inferior derecha
    ((draw-line v1) 
     (make-posn (+ cx (* escala (- 300 centroide-x))) (+ cy (* escala (- 100 centroide-y))))
     (make-posn (+ cx (* escala (- 300 centroide-x))) (+ cy (* escala (- 400 centroide-y)))) color5)
    (dibujar-cuarto-circulo v1 (+ cx (* escala (- 250 centroide-x))) (+ cy (* escala (- 400 centroide-y)))
                            (* escala 50) 20 color5 'abajo-derecha)

    ;; Borde inferior y esquina inferior izquierda
    ((draw-line v1) 
     (make-posn (+ cx (* escala (- 100 centroide-x))) (+ cy (* escala (- 450 centroide-y))))
     (make-posn (+ cx (* escala (- 250 centroide-x))) (+ cy (* escala (- 450 centroide-y)))) color5)
    (dibujar-cuarto-circulo v1 (+ cx (* escala (- 100 centroide-x))) (+ cy (* escala (- 400 centroide-y)))
                            (* escala 50) 20 color5 'abajo-izquierda)

    ;; Dibujar el número de la carta, ajustado con las coordenadas relativas
    (dibujar-lista lista desplazamiento-numero-x desplazamiento-numero-y escala-objetos color)

    ;; Dibujar el símbolo del palo, ajustado con las coordenadas relativas
    (cond
      ((eq? palo 'corazon) (dibujar-corazon desplazamiento-palo-x desplazamiento-palo-y escala-objetos))  ;; Dibuja un corazón
      ((eq? palo 'pica) (dibujar-pica desplazamiento-palo-x desplazamiento-palo-y escala-objetos))        ;; Dibuja una pica
      ((eq? palo 'trebol) (dibujar-trebol desplazamiento-palo-x desplazamiento-palo-y escala-objetos))    ;; Dibuja un trébol
      ((eq? palo 'diamante) (dibujar-diamante desplazamiento-palo-x desplazamiento-palo-y escala-objetos)) ;; Dibuja un diamante
      (else (error "Palo no válido")))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FIN FUNCIÓN DIBUJAR CARTA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DIBUJAR FICHA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (dibujar-ficha centrox centroy escala color)
  ;; Dibujar círculos concéntricos de la ficha
  (dibujar-circulo v1 (make-posn centrox centroy) (* escala 50) color)   ;; Círculo externo negro
  (dibujar-circulo v1 (make-posn centrox centroy) (* escala 44) blanco)   ;; Círculo medio blanco
  (dibujar-circulo v1 (make-posn centrox centroy) (* escala 30) color)   ;; Círculo interno negro
  
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FIN FUNCIÓN DIBUJAR FICHA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(dibujar-carta 200 400 0.3 'corazon lista-t)






