(require (lib "graphics.ss" "graphics"))
(load "letras.rkt")
(load "FIGURAS_constructores.rkt")

(open-graphics)

(define hor 800)
(define ver 600)
(define v1 (open-viewport "Ejemplo de figuras" hor ver))

(define color1 (make-rgb 0.9 0.1 0.2))
(define color2 (make-rgb 0.1 0.2 0.9))
(define color4 (make-rgb 0.2 0.1 0.9))
(define color5 (make-rgb 0.0 0.0 0.0))


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


(dibujar-lista valores 'A 200 200 1.5 color1)
