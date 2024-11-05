(load "caratula.rkt")
(load "FIGURAS_constructores.rkt")

(dibujar-circulo v1 (make-posn 100 100) 50 negro)
(dibujar-circulo v1 (make-posn 100 100) 44 blanco)
(dibujar-circulo v1 (make-posn 100 100) 30 negro)
((draw-solid-polygon v1) (list
                          (make-posn 109 72.5)
                          (make-posn 114.6 56)
                          (make-posn 129.5 66)
                          (make-posn 119 78)) (make-posn 0 0) color5)
((draw-solid-polygon v1) (list
                          (make-posn 128.4 94)
                          (make-posn 144 91)
                          (make-posn 144 109)
                          (make-posn 128.4 106)) (make-posn 0 0) color5)
((draw-solid-polygon v1) (list
                          (make-posn 119 122)
                          (make-posn 129 134)
                          (make-posn 114 142)
                          (make-posn 109 127)
                          
                          ) (make-posn 0 0) color5)
((draw-solid-polygon v1) (list
                          (make-posn 90.5 127)
                          (make-posn 85 142.5)
                          (make-posn 70.5 134)
                          (make-posn 81 122)                          
                          ) (make-posn 0 0) color5)
((draw-solid-polygon v1) (list
                          (make-posn 71.6 106)
                          (make-posn 56 109)
                          (make-posn 56 91)
                          (make-posn 71.6 94)                          
                          ) (make-posn 0 0) color5)
((draw-solid-polygon v1) (list
                          (make-posn 81 78)
                          (make-posn 70.6 65.9)
                          (make-posn 86 57)
                          (make-posn 91 72.6)                          
                          ) (make-posn 0 0) color5)

(dibujar-lista lista-1 90 77 0.15 blanco)
(dibujar-lista lista-0 105 77 0.15 blanco)