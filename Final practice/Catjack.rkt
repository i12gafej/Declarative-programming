(load "caratula.rkt")
(load "letras.rkt")
(load "FIGURAS_constructores.rkt")


(define (menu-inicio)
  ((draw-solid-polygon v1)
 (list (make-posn 0 0) (make-posn 800 0) (make-posn 800 600)(make-posn 0 600)) (make-posn 0 0)morosa)

((draw-solid-polygon v1) list-c (make-posn 0 0) gris)
((draw-solid-polygon v1) list-a (make-posn 0 0) gris)
((draw-solid-polygon v1) list-t (make-posn 0 0) gris)
((draw-solid-polygon v1) list-j (make-posn 0 0) blanco)

((draw-solid-polygon v1) list-a2(make-posn 0 0) blanco)
((draw-solid-polygon v1) list-c2 (make-posn 0 0) blanco)
((draw-solid-polygon v1) list-k (make-posn 0 0) blanco)

((draw-string v1) (make-posn 300 550) "PRESS THE SCREEN TO START" blanco)
 (let ((click (get-mouse-click v1)))
    (when click #t))
 )

(define (menu-juegos)
  ((draw-solid-polygon v1)
   (list (make-posn 0 0) (make-posn 800 0) (make-posn 800 600)(make-posn 0 600)) (make-posn 0 0)morosa)
  ((draw-polygon v1) (list
                    (make-posn 600 10)
                    (make-posn 750 10)
                    (make-posn 750 70)
                    (make-posn 600 70)
                    ) (make-posn 0 0) blanco)
  (dibujar-texto "INICIO" 615 30 10 color_letras)
  (dibujar-texto "INICIO" 616 31 10 color_letras)
  (dibujar-texto "INICIO" 617 32 10 color_letras)
  (dibujar-texto "INICIO" 618 33 10 color_letras)
  ((draw-polygon v1) (list
                    (make-posn 100 100)
                    (make-posn 720 100)
                    (make-posn 720 240)
                    (make-posn 100 240)
                    ) (make-posn 0 0) blanco)
  (dibujar-texto "JUGAR A RONDAS" 130 150 20 color_letras)
  (dibujar-texto "JUGAR A RONDAS" 131 151 20 color_letras)
  (dibujar-texto "JUGAR A RONDAS" 132 152 20 color_letras)
  (dibujar-texto "JUGAR A RONDAS" 133 153 20 color_letras)
  ((draw-polygon v1) (list
                    (make-posn 40 350)
                    (make-posn 750 350)
                    (make-posn 750 490)
                    (make-posn 40 490)
                    ) (make-posn 0 0) blanco)
  (dibujar-texto "JUGAR CON FICHAS" 70 400 20 color_letras)
  (dibujar-texto "JUGAR CON FICHAS" 71 401 20 color_letras)
  (dibujar-texto "JUGAR CON FICHAS" 72 402 20 color_letras)
  (dibujar-texto "JUGAR CON FICHAS" 73 403 20 color_letras)
  (let loop ()
    (let* ((click (get-mouse-click v1))
           (x (posn-x (mouse-click-posn click)))
           (y (posn-y (mouse-click-posn click))))
      (cond
       
       ((and (<= 100 x 720) (<= 100 y 240)) 'rondas)
       
       ((and (<= 40 x 750) (<= 350 y 490)) 'fichas)
       
       ((and (<= 600 x 750) (<= 10 y 70)) 'inicio)
       
       (else (loop)))))
  )

(define (menu-rondas)
  ((draw-solid-polygon v1)
                     (list
                      (make-posn 0 0)
                      (make-posn 800 0)
                      (make-posn 800 600)
                      (make-posn 0 600)) (make-posn 0 0)morosa)

  
  ((draw-polygon v1) (list
                    (make-posn 600 10)
                    (make-posn 750 10)
                    (make-posn 750 70)
                    (make-posn 600 70)
                    ) (make-posn 0 0) blanco)
  (dibujar-texto "BACK" 615 30 10 color_letras)
  (dibujar-texto "BACK" 616 31 10 color_letras)
  (dibujar-texto "BACK" 617 32 10 color_letras)
  (dibujar-texto "BACK" 618 33 10 color_letras)

  
  (dibujar-texto "RONDAS A JUGAR" 120 110 20 color_letras)
  (dibujar-texto "RONDAS A JUGAR" 121 110 20 color_letras)
  (dibujar-texto "RONDAS A JUGAR" 121 111 20 color_letras)
  (dibujar-texto "RONDAS A JUGAR" 122 111 20 color_letras)
  (dibujar-texto "RONDAS A JUGAR" 122 112 20 color_letras)
  (dibujar-texto "RONDAS A JUGAR" 123 112 20 color_letras)
  (dibujar-texto "RONDAS A JUGAR" 123 113 20 color_letras)

  ((draw-polygon v1) (list
                      (make-posn 200 200)
                      (make-posn 380 200)
                      (make-posn 380 350)
                      (make-posn 200 350)) (make-posn 0 0) blanco)
  (dibujar-texto "3" 268 240 30 color_letras)
  (dibujar-texto "3" 269 240 30 color_letras)
  (dibujar-texto "3" 269 241 30 color_letras)
  (dibujar-texto "3" 270 241 30 color_letras)
  (dibujar-texto "3" 270 242 30 color_letras)

  
  ((draw-polygon v1) (list
                      (make-posn 420 200)
                      (make-posn 600 200)
                      (make-posn 600 350)
                      (make-posn 420 350)) (make-posn 0 0) blanco)
  (dibujar-texto "5" 488 240 30 color_letras)
  (dibujar-texto "5" 489 240 30 color_letras)
  (dibujar-texto "5" 489 241 30 color_letras)
  (dibujar-texto "5" 490 241 30 color_letras)
  (dibujar-texto "5" 490 242 30 color_letras)

  
  ((draw-polygon v1) (list
                      (make-posn 200 390)
                      (make-posn 380 390)
                      (make-posn 380 540)
                      (make-posn 200 540)) (make-posn 0 0) blanco)
  (dibujar-texto "7" 268 430 30 color_letras)
  (dibujar-texto "7" 269 430 30 color_letras)
  (dibujar-texto "7" 269 431 30 color_letras)
  (dibujar-texto "7" 270 431 30 color_letras)
  (dibujar-texto "7" 270 432 30 color_letras)

  
  ((draw-polygon v1) (list
                      (make-posn 420 390)
                      (make-posn 600 390)
                      (make-posn 600 540)
                      (make-posn 420 540)) (make-posn 0 0) blanco)
  (dibujar-texto "11" 462 430 30 color_letras)
  (dibujar-texto "11" 463 430 30 color_letras)
  (dibujar-texto "11" 463 431 30 color_letras)
  (dibujar-texto "11" 464 431 30 color_letras)
  (dibujar-texto "11" 464 432 30 color_letras)

  
  (let loop ()
    (let* ((click (get-mouse-click v1))
           (x (posn-x (mouse-click-posn click)))
           (y (posn-y (mouse-click-posn click))))
      (cond
       
       ((and (<= 200 x 380) (<= 200 y 350)) 3)
       ((and (<= 420 x 600) (<= 200 y 350)) 5)
       ((and (<= 200 x 380) (<= 390 y 540)) 7)
       ((and (<= 420 x 600) (<= 390 y 540)) 11)
       
       ((and (<= 600 x 750) (<= 10 y 70)) 'back)
       
       (else (loop)))
      )
   )
)


(define (inicio)
  ; Si se clica la pantalla
  (if (menu-inicio)
      ; Bucle de los menús
      (let loop
        ; Variables iterativas
        (
         ; Se guarda la selección del menú de juegos
         (seleccion (menu-juegos))
        )
        (cond
          ; Si se elige rondas
          ((eq? seleccion 'rondas)
           (let
               (
                 ; Se guarda la selección del número de rondas
                 (rondas (menu-rondas))
                )
             (cond
               ((number? rondas) (printf "Rondas seleccionadas: ~a\n" rondas))
               ((eq? rondas 'back) (loop (menu-juegos))))))
          ((eq? seleccion 'fichas) (printf "Modo fichas seleccionado\n"))
          ((eq? seleccion 'inicio) (inicio))
        )
      )
   )
)
;(dibujar-ficha 200 200 1.5 color3)
(inicio)