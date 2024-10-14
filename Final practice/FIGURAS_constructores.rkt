(require (lib "graphics.ss" "graphics"))

(open-graphics)

(define hor 800)
(define ver 600)
(define v1 (open-viewport "Ejemplo de figuras" hor ver))

(define color1 (make-rgb 0.9 0.1 0.2))
(define color2 (make-rgb 0.1 0.2 0.9))
(define color3 (make-rgb 0.2 0.9 0.1))
(define color4 (make-rgb 0.2 0.1 0.9))
(define color5 (make-rgb 0.0 0.0 0.0))

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

  ;; Coordenadas originales del triángulo
  (define dx1 (- 350 centroide-x)) ;; Desplazamiento en x del centro c1 respecto al centroide
  (define dy1 (- 350 centroide-y)) ;; Desplazamiento en y del centro c1 respecto al centroide
  
  (define dx2 (- 280 centroide-x)) ;; Desplazamiento en x del centro c2 respecto al centroide
  (define dy2 (- 350 centroide-y)) ;; Desplazamiento en y del centro c2 respecto al centroide
  
  (define dxv (- 315 centroide-x)) ;; Desplazamiento en x del vértice v respecto al centroide
  (define dyv (- 455 centroide-y)) ;; Desplazamiento en y del vértice v respecto al centroide

  ;; Escalar y desplazar las coordenadas
  (define xc1 (+ centrox (* escala dx1)))
  (define yc1 (+ centroy (* escala dy1)))
  
  (define xc2 (+ centrox (* escala dx2)))
  (define yc2 (+ centroy (* escala dy2)))
  
  (define xv (+ centrox (* escala dxv)))
  (define yv (+ centroy (* escala dyv)))

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
  ((draw-solid-ellipse v1) (make-posn (- xc1 radio) (- yc1 radio)) (* 2 radio) (* 2 radio) color1)
  ((draw-solid-ellipse v1) (make-posn (- xc2 radio) (- yc2 radio)) (* 2 radio) (* 2 radio) color1)
  ;; Rellenar el área con un triángulo entre los puntos de tangencia y el vértice
  ((draw-solid-polygon v1) 
   (list (make-posn xv yv)
         (make-posn x3_1 y3_1)
         (make-posn x3_2 y3_2))(make-posn 0 0)
   color1)
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FIN FUNCION DIBUJAR CORAZON
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FUNCION DIBUJAR TRÉBOL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Función para calcular el centroide de un triángulo
(define (calcular-centroide x1 y1 x2 y2 x3 y3)
  (vector (/ (+ x1 x2 x3) 3) (/ (+ y1 y2 y3) 3)))

;; Función para dibujar el trébol
(define (dibujar-trebol centrox centroy escala)

  ;; Centroide original del trébol
  (define centroide (calcular-centroide 290 270 250 350 330 350))
  (define centroide-x (vector-ref centroide 0))
  (define centroide-y (vector-ref centroide 1))

  ;; Desplazamiento de los centros de los círculos respecto al centroide
  (define offset 100)
  (define dx1 (- (+ 280 offset) centroide-x))
  (define dy1 (- (+ 300 offset) centroide-y))

  (define dx2 (- (+ 200 offset) centroide-x))
  (define dy2 (- (+ 300 offset) centroide-y))

  (define dx3 (- (+ 240 offset) centroide-x))
  (define dy3 (- (+ 220 offset) centroide-y))

  ;; Desplazamiento de los vértices del triangulito respecto al centroide
  (define dxv1 (- 290 centroide-x))
  (define dyv1 (- 380 centroide-y))

  (define dxv2 (- 250 centroide-x))
  (define dyv2 (- 425 centroide-y))

  (define dxv3 (- 330 centroide-x))
  (define dyv3 (- 425 centroide-y))

  ;; Escalar y desplazar los puntos
  (define xc1 (+ centrox (* escala dx1)))
  (define yc1 (+ centroy (* escala dy1)))

  (define xc2 (+ centrox (* escala dx2)))
  (define yc2 (+ centroy (* escala dy2)))

  (define xc3 (+ centrox (* escala dx3)))
  (define yc3 (+ centroy (* escala dy3)))

  ;; Escalar los vértices del triangulito
  (define xv1 (+ centrox (* escala dxv1)))
  (define yv1 (+ centroy (* escala dyv1)))

  (define xv2 (+ centrox (* escala dxv2)))
  (define yv2 (+ centroy (* escala dyv2)))

  (define xv3 (+ centrox (* escala dxv3)))
  (define yv3 (+ centroy (* escala dyv3)))

  ;; Dibujar los círculos del trébol
  ((draw-solid-ellipse v1) (make-posn (- xc1 50) (- yc1 50)) (* 2 escala 50) (* 2 escala 50) color5)
  ((draw-solid-ellipse v1) (make-posn (- xc2 50) (- yc2 50)) (* 2 escala 50) (* 2 escala 50) color5)
  ((draw-solid-ellipse v1) (make-posn (- xc3 50) (- yc3 50)) (* 2 escala 50) (* 2 escala 50) color5)

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
;; Llamada de ejemplo: Dibujar trébol centrado en (400, 300) con una escala de 1.5
(dibujar-trebol 40 70 0.5)

;; Llamada de ejemplo: dibujar un corazón en el centro (400, 300) con una escala de 1.5
(dibujar-corazon 40 70 0.5)

((draw-solid-ellipse v1) (make-posn 36 66) 8 8 color3)



