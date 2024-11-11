(define color1 (make-rgb 0.9 0.1 0.2))
(define color2 (make-rgb 0.1 0.2 0.9))
(define color4 (make-rgb 0.2 0.1 0.9))
(define color5 (make-rgb 0.0 0.0 0.0))

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
;; Convertir A POSNs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (convertir-a-posns lista)
    (map (lambda (par) (make-posn (car par) (cadr par))) lista))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FIN Convertir A POSNs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Distancia D2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (D2 x1 y1 x2 y2)
  (sqrt (+ (sqr (- x1 x2)) (sqr (- y1 y2))))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FIN Distancia D2
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

(define valores
  (list
   (cons '0 (append
             (list
              (list 70 320) (list 50 300) (list 50 170) (list 70 150)
              (list 130 150) (list 150 170) (list 150 190) ;; Interior
              (list 130 190) (list 120 170) (list 80 170) (list 70 190)
              (list 70 280) (list 80 300) (list 120 300) (list 130 280)
              (list 130 190) (list 150 190) (list 150 300) (list 130 320))))
   
   (cons '1 (list (list 50 200) (list 75 200) (list 100 150) (list 125 150)
                  (list 125 320) (list 100 320) (list 100 200)))

   (cons '2 (append (lista-cuarto-circulo 100 200 50 20 'arriba-izquierda 'antihorario)
                    (lista-cuarto-circulo 100 200 50 20 'arriba-derecha 'horario)
                    (list (list 80 300) (list 150 300) (list 150 320) (list 50 320) (list 50 300))
                    (lista-cuarto-circulo 100 200 25 20 'arriba-derecha 'antihorario)
                    (lista-cuarto-circulo 100 200 25 20 'arriba-izquierda 'horario)))

   (cons '3 (append (list (list 120 170) (list 50 170) (list 50 150) (list 150 150) (list 150 170))
                    (lista-cuarto-circulo 100 275 50 20 'arriba-derecha 'horario)
                    (lista-cuarto-circulo 100 275 50 20 'abajo-derecha 'antihorario)
                    (lista-cuarto-circulo 100 275 50 20 'abajo-izquierda 'horario)
                    (lista-cuarto-circulo 100 275 25 20 'abajo-izquierda 'antihorario)
                    (lista-cuarto-circulo 100 275 25 20 'abajo-derecha 'horario)
                    (lista-cuarto-circulo 100 275 25 20 'arriba-derecha 'antihorario)
                    (list (list 75 250) (list 75 225))))
   
   ;; Añadir el resto de números y letras de manera similar
   (cons '4 (list (list 50 225) (list 120 150) (list 150 150) (list 80 225) (list 130 225)
                  (list 130 205) (list 150 205) (list 150 225) (list 150 320) (list 125 320)
                  (list 125 250) (list 50 250)))
   
   (cons '5 (append (list (list 50 235) (list 50 150) (list 150 150) (list 150 170) (list 75 170) (list 75 210))
                    (lista-cuarto-circulo 100 260 50 20 'arriba-derecha 'horario)
                    (lista-cuarto-circulo 100 275 50 20 'abajo-derecha 'antihorario)
                    (lista-cuarto-circulo 100 275 50 20 'abajo-izquierda 'horario)
                    (lista-cuarto-circulo 100 275 25 20 'abajo-izquierda 'antihorario)
                    (lista-cuarto-circulo 100 275 25 20 'abajo-derecha 'horario)
                    (lista-cuarto-circulo 100 260 25 20 'arriba-derecha 'antihorario)))
   
   (cons '6 (append
             (list (list 50 320) (list 50 150) (list 150 150) (list 150 180)
                   (list 80 180) (list 80 225) (list 150 225)
                   ;; Interior
                   (list 150 275) (list 120 275) (list 120 245)
                   (list 80 245) (list 80 295) (list 120 295)
                   (list 120 275) (list 150 275)
                   ;; Exterior
                   (list 150 320))))
   
   ;; Número 7
   (cons '7 (list
             (list 50 180) (list 50 150) (list 150 150)
             (list 150 180) (list 80 320) (list 50 320)
             (list 120 180)))
   
   ;; Número 8
   (cons '8 (append
             (list
              ;; Primer círculo
              (list 70 230) (list 50 210) (list 50 170) (list 70 150)
              (list 130 150) (list 150 170) (list 150 190) ;; Interior
              (list 130 190) (list 110 170) (list 90 170) (list 70 190) (list 90 210)
              (list 110 210) (list 130 190) ;; Exterior
              (list 150 190) (list 150 210) (list 130 230) (list 150 250)
              (list 150 270) ;; Interior
              (list 130 270) (list 110 250) (list 90 250)
              (list 70 270) (list 70 280) (list 90 300) (list 110 300) (list 130 280)
              (list 130 270) ;; Exterior
              (list 150 270) (list 150 300) (list 130 320) (list 70 320)
              (list 50 300) (list 50 250))))
   
   ;; Número 9
   (cons '9 (append
             (lista-cuarto-circulo 100 200 50 20 'abajo-izquierda 'horario)
             (lista-cuarto-circulo 100 200 50 20 'arriba-izquierda 'antihorario)
             (lista-cuarto-circulo 100 200 50 20 'arriba-derecha 'horario)
             (list (list 150 200) (list 125 200)) ;; Interior
             (lista-cuarto-circulo 100 200 25 20 'arriba-derecha 'antihorario)
             (lista-cuarto-circulo 100 200 25 20 'arriba-izquierda 'horario)
             (lista-cuarto-circulo 100 200 25 20 'abajo-izquierda 'horario)
             (lista-cuarto-circulo 100 200 25 20 'abajo-derecha 'horario)
             (list (list 125 200) (list 150 200) (list 150 225) (list 100 320) (list 80 320) (list 130 225))))
   (cons 'T (list
             (list 50 190) (list 50 150) (list 150 150) (list 150 190)
             (list 115 190) (list 115 320) (list 85 320) (list 85 190)))
   
   ;; Letra J
   (cons 'J (append
             (list (list 50 190) (list 50 150) (list 150 150) (list 150 190))
             (lista-cuarto-circulo 100 270 50 20 'abajo-derecha 'antihorario)
             (list (list 60 320) (list 60 290))
             (lista-cuarto-circulo 100 270 20 20 'abajo-derecha 'horario)
             (list (list 120 190))))
   
   ;; Letra Q
   (cons 'Q (append
             (lista-cuarto-circulo 80 180 30 20 'arriba-izquierda 'antihorario)
             (lista-cuarto-circulo 120 180 30 20 'arriba-derecha 'horario)
             (list (list 150 260) (list 130 260))
             (lista-cuarto-circulo 120 180 10 20 'arriba-derecha 'antihorario)
             (lista-cuarto-circulo 80 180 10 20 'arriba-izquierda 'horario)
             (lista-cuarto-circulo 80 280 10 20 'abajo-izquierda 'antihorario)
             (list (list 110 290) (list 100 270) (list 120 270) (list 143 320)
                   (list 123 320) (list 120 310))
             (lista-cuarto-circulo 80 280 30 20 'abajo-izquierda 'horario)))
   
   ;; Letra K
   (cons 'K (list
             (list 50 150) (list 70 150) (list 70 210)
             (list 130 150) (list 150 150) (list 70 230)
             (list 150 320) (list 130 320) (list 70 250)
             (list 70 320) (list 50 320)))
   
   ;; Letra A
   (cons 'A (list
             (list 50 320) (list 90 150) (list 110 150) (list 150 320)
             (list 130 320) (list 115 250) (list 100 250) (list 100 240)
             (list 110 240) (list 100 190) (list 90 240)
             (list 100 240) (list 100 250) (list 85 250) (list 70 320)))
   
   ;; Continúa agregando cada número y letra similarmente
   ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Función dibujar lista de puntos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FIN Función dibujar lista de puntos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DIBUJAR CARTA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (dibujar-carta cx cy escala palo valor lista-asociacion)
  ;; Función interna para transformar coordenadas según el centro y escala y devolver un par `(x, y)`
  (define (transformar-coordenadas x y esc)
    (list (+ cx (* esc (- x 175)))
          (+ cy (* esc (- y 350)))))

  ;; Variables de escala y color para el palo
  (let* ((escala-objetos (* escala 0.75))
         (color (cond ((or (eq? palo 'corazon) (eq? palo 'diamante)) color1)
                      ((or (eq? palo 'pica) (eq? palo 'trebol)) color5)
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
    ((draw-solid-polygon v1) (convertir-a-posns list-cuerpo) (make-posn 0 0) blanco)
    ((draw-polygon v1) (convertir-a-posns list-cuerpo) (make-posn 0 0) negro)
    
    ;; Dibujar el número de la carta, ajustado con las coordenadas relativas, usando la lista de asociación
    (dibujar-lista lista-asociacion valor desplazamiento-numero-x desplazamiento-numero-y escala-objetos color)

    ;; Dibujar el símbolo del palo, ajustado con las coordenadas relativas
    (cond
      ((eq? palo 'corazon) (dibujar-corazon desplazamiento-palo-x desplazamiento-palo-y escala-objetos))
      ((eq? palo 'pica) (dibujar-pica desplazamiento-palo-x desplazamiento-palo-y escala-objetos))
      ((eq? palo 'trebol) (dibujar-trebol desplazamiento-palo-x desplazamiento-palo-y escala-objetos))
      ((eq? palo 'diamante) (dibujar-diamante desplazamiento-palo-x desplazamiento-palo-y escala-objetos))
      (else (error "Palo no válido")))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FIN FUNCIÓN DIBUJAR CARTA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DIBUJAR CARTA POR DETRAS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
;; FIN FUNCIÓN DIBUJAR CARTA POR DETRAS
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






