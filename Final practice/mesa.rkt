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

(define (contador-crupier fichas)
  ((draw-solid-polygon v1)
   (list (make-posn 290 10) (make-posn 510 10) (make-posn 510 80)(make-posn 290 80)) (make-posn 0 0) contador2)
  ((draw-solid-polygon v1)
   (list (make-posn 295 15) (make-posn 505 15) (make-posn 505 75)(make-posn 295 75)) (make-posn 0 0) blanco)
  ((draw-solid-polygon v1)
   (list (make-posn 300 20) (make-posn 500 20) (make-posn 500 70)(make-posn 300 70)) (make-posn 0 0) negro)
  (dibujar-texto (number->string fichas) 305 35 10 blanco)
  )

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
(define (esLetra? caracter)
  (if (and (>= (char->integer caracter) (char->integer #\A))
            (<= (char->integer caracter) (char->integer #\Z))
       )
      #t
      #f)
)
(define (esNumero? caracter)
  (if (and (>= (char->integer caracter) (char->integer #\0))
           (<= (char->integer caracter) (char->integer #\9)))
      #t
      #f)
)
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
      (printf "~a\n" valores)
      ))
  
  )

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




(define contorno
  '(
    (120 171)(72. 171.)(72. 167.)(64. 167.) (64. 162.)(57. 162.)(57. 158.)(53. 158.)
    (53. 153.)(49. 153.)(49. 150.)  (45.0 150.)  (45.0 140.)  (41. 140.)(41 108)(37 108)
    (37. 97.)(33. 97.)(33. 62.)(37. 62.)(37. 58.)(41. 58.)(41. 55.)(45. 55.)(45. 55.)
    (45. 50.)(60.0 50.0)(60.0 40.0)(64. 40.)(64. 32.)(68. 32.)(68. 28.)(75. 28.)
    (75. 25.)(90. 25.)(90. 30.)(93. 30.)(93. 31.)(97. 31.)(97. 36.)(104. 36.)(104. 32.)
    (108. 32.)(108. 28.)(112. 28.)(112. 25.)(127. 25.)(127. 28.)(131. 28.)
    (131. 32.)(134. 32.)(134. 36.)(138. 36.)(138. 40.)(142. 40.)(142. 54.)
    (153. 54.)(153. 58.)(157. 58.)(157. 62.)(161. 62.)(161. 66.)(164. 66.)
    (164. 97.)(161. 97.)(161. 101.)(157. 101.)(157. 109.)(153. 109.)(153. 131.)
    (150. 131.)(150. 142.)(146. 142.)(146. 149.)(142. 149.)(142. 154.)
    (138. 153.)(138. 158.)(134. 158.)(134. 162.)(131. 162.)(131. 166.)
    (123. 166.)(123. 170.)(119.98 170.83)
    ;; Dentro
    (120.04 166.99)(119.96 163.32)(126.92 163.13)(127.05 158.29)(134.56 158.22)
    (134.63 154.26)(138.17 153.92)(138.42 146.45)(141.79 146.21)(141.91 139.29)
    (145.64 139.05)(146.0 131.59)(149.61 131.59)(149.67 109.27)(153.64 109.15)
    (153.22 101.27)(157.01 101.15)(157.31 97.42)(160.86 97.3)(160.91 70.72)
    (157.55 70.85)(157.23 62.71)(153.42 62.65)(153.55 58.9)(142.63 58.97)
    (142.25 62.07)(138.5 62.71)(138.24 66.26)(134.56 66.78)(135.0 70.0)
    (130.95 70.78)(130.88 77.89)(127.33 78.02)(127.26 94.1)(123.2 93.84)
    (123.45 74.01)(127.01 74.21)(127.14 70.2)(130.75 70.46)(130.95 62.58)
    (134.37 62.97)(134.69 58.77)(138.05 58.9)(138.11 44.24)(137.98 41.01)
    (134.76 40.69)(134.76 36.94)(130.75 36.43)(130.75 33.)(127.14 32.94)
    (127.07 29.2)(112.61 29.07)(112.28 32.88)(108.73 33.07)(108.54 36.62)
    (105.05 36.82)(105.0 40.0)(101.3 40.69)(101.37 66.97)(97.62 66.78)
    (97.56 36.69)(93.88 36.43)(94.01 33.13)(90.07 32.75)(90.13 29.2)
    (75.54 29.0)(75.67 32.36)(72.05 32.62)(71.86 36.36)(68.31 36.49)
    (68.24 40.37)(65.0 40.0)(64.43 58.77)(68.5 58.9)(68.24 66.65)
    (71.92 66.59)(72.05 89.64)(68.5 89.7)(68.24 66.78)(64.69 66.39)
    (64.43 58.84)(61.27 59.03)(60.81 54.9)(45.0 55.0)(45.45 58.51)
    (41.57 58.97)(41.7 62.65)(38.02 63.03)(38.02 97.32)(41.7 97.58)
    (41.64 104.69)(45.06 104.88)(45.45 139.17)(49.51 139.17)(50.0 150.0)
    (53.45 150.34)(53.65 153.76)(57.46 153.83)(57.33 158.41)(64.62 159.12)
    (64.62 163.06)(72.44 163.06)(72.44 166.94)(120 167)
   ))
(define interior
  '(
    (119.98 170.83)(120.04 166.99)(119.96 163.32)(126.92 163.13)
    (127.05 158.29)(134.56 158.22)(134.63 154.26)(138.17 153.92)
    (138.42 146.45)(141.79 146.21)(141.91 139.29)(145.64 139.05)
    (146.0 131.59)(149.61 131.59)(149.67 109.27)(153.64 109.15)
    (153.22 101.27)(157.01 101.15)(157.31 97.42)(160.86 97.3)
    (160.91 70.72)(157.55 70.85)(157.23 62.71)(153.42 62.65)
    (153.55 58.9)(142.63 58.97)(142.25 62.07)(138.5 62.71)
    (138.24 66.26)(134.56 66.78)(135.0 70.0)(130.95 70.78)
    (130.88 77.89)(127.33 78.02)(127.26 94.1)(123.2 93.84)
    (123.45 74.01)(127.01 74.21)(127.14 70.2)(130.75 70.46)
    (130.95 62.58)(134.37 62.97)(134.69 58.77)(138.05 58.9)
    (138.11 44.24)(137.98 41.01)(134.76 40.69)(134.76 36.94)
    (130.75 36.43)(130.75 33.2)(127.14 32.94)(127.07 29.2)
    (112.61 29.07)(112.28 32.88)(108.73 33.07)(108.54 36.62)
    (105.05 36.82)(105.0 40.0)(101.3 40.69)(101.37 66.97)
    (97.62 66.78)(97.56 36.69)(93.88 36.43)(94.01 33.13)(90.07 32.75)
    (90.13 29.2)(75.54 29.0)(75.67 32.36)(72.05 32.62)(71.86 36.36)
    (68.31 36.49)(68.24 40.37)(65.0 40.0)(64.43 58.77)(68.5 58.9)
    (68.24 66.65)(71.92 66.59)(72.05 89.64)(68.5 89.7)(68.24 66.78)
    (64.69 66.39)(64.43 58.84)(61.27 59.03)(60.81 54.9)(45.0 55.0)
    (45.45 58.51)(41.57 58.97)(41.7 62.65)(38.02 63.03)(38.02 97.32)
    (41.7 97.58)(41.64 104.69)(45.06 104.88)(45.45 139.17)(49.51 139.17)
    (50.0 150.0)(53.45 150.34)(53.65 153.76)(57.46 153.83)(57.33 158.41)
    (64.62 159.12)(64.62 163.06)(72.44 163.06)(72.44 166.94)(120 167)
    ))

(define list-cuerpo
  (append
   (list (list 50 100) (list 50 400))
   (lista-cuarto-circulo 100 100 50 20 'arriba-izquierda 'antihorario)
   (list (list 100 50) (list 250 50))
   (lista-cuarto-circulo 250 100 50 20 'arriba-derecha 'horario)
   (list (list 300 100) (list 300 400))
   (lista-cuarto-circulo 250 400 50 20 'abajo-derecha 'antihorario)
   (list (list 100 450) (list 250 450))
   (lista-cuarto-circulo 100 400 50 20 'abajo-izquierda 'horario)))

(define list-interior
  (append
   (list (list 50 100) (list 50 400))
   (lista-cuarto-circulo 100 100 50 20 'arriba-izquierda 'antihorario)
   (list (list 100 50) (list 250 50))
   (lista-cuarto-circulo 250 100 50 20 'arriba-derecha 'horario)
   (list (list 300 100) (list 300 400))
   (lista-cuarto-circulo 250 400 50 20 'abajo-derecha 'antihorario)
   (list (list 100 450) (list 250 450))
   (lista-cuarto-circulo 100 400 50 20 'abajo-izquierda 'horario)))



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


(define (limpiar-figura puntos color-fondo)
  ;; Dibuja la figura con el color de fondo para simular el borrado
  ((draw-solid-polygon v1) puntos (make-posn 0 0) color-fondo)
  ((draw-polygon v1) puntos (make-posn 0 0) color-fondo))


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

(define (lista-a-posn puntos)
  (map (lambda (p) (make-posn (car p) (cadr p))) puntos))

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

        

        ;; Dibujar la carta y la patita en la nueva posición
        ;((draw-solid-polygon v1) puntos-cuerpo (make-posn 0 0) blanco)
        ;((draw-solid-polygon v1) puntos-interior (make-posn 0 0) morosa)
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

    



;(cantidad)

;(dibujar-carta-por-detras 100 400 0.4)
;(dibujar-carta 100 400 0.3 'trebol 'T valores)

;(mover-patita-carta 700 400 200 400 0.4 1. tapete)
;(dibujar-carta 200 400 0.4 'diamante 'T valores)
;(mover-patita 300 400 700 400 0.4 1. tapete)
;(mover-patita-carta 700 400 300 400 0.4 1. tapete)
;(mover-patita 400 400 700 400 0.4 1. tapete)




