(load "mesa.rkt")
(define (crear-mazo)
  (append
   (map (lambda (valor) (list valor 'corazon))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'corazon))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'corazon))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'corazon))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'diamante))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'diamante))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'diamante))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'diamante))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'trebol))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'trebol))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'trebol))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'trebol))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'pica))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'pica))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'pica))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))
   (map (lambda (valor) (list valor 'pica))
               (list 'A '2 '3 '4 '5 '6 '7 '8 '9 'T 'J 'Q 'K))))

;; Función para generar una lista de números desde 0 hasta n-1
(define (range n)
  (if (= n 0)
      '()
      (cons (- n 1) (range (- n 1)))))

;; Función para intercambiar dos elementos en una lista en las posiciones i y j
(define (swap lst i j)
  (let ((elem-i (list-ref lst i))
        (elem-j (list-ref lst j)))
    (map (lambda (idx)
           (cond ((= idx i) elem-j)
                 ((= idx j) elem-i)
                 (else (list-ref lst idx))))
         (range (length lst)))))

;; Función recursiva para barajar la lista
(define (barajar mazo)
  (define (shuffle-helper lst n)
    (if (<= n 0)
        lst
        (let ((j (random (+ n 1))))
          (shuffle-helper (swap lst n j) (- n 1)))))
  (shuffle-helper mazo (- (length mazo) 1)))


;; Devuelve los nuevos mano y mazo
(define (add-carta-mano mano mazo turno)
  (let
      ((nueva-carta (car mazo))
       (pos-y (if (eq? turno 'jugador) 400 250))
       (pos-x (* (+ 2 (length mano)) 100)))
    (mover-patita-carta 700 pos-y pos-x pos-y 0.3 1. tapete)
    (dibujar-carta pos-x pos-y 0.3 (cadr nueva-carta) (car nueva-carta) valores)
    (mover-patita (+ 100 pos-x) pos-y 700 pos-y 0.4 1. tapete)
    (cons (append mano (list nueva-carta)) (cdr mazo))
    )
  )

(define (extraer-mazo mazo)
  (cdr mazo)
  )

;; Obtener carta

;; Definir la función count
(define (count pred lst)
  (define (count-helper lst acc)
    (cond
      ((null? lst) acc)                               ; Si la lista está vacía, devuelve el acumulador
      ((pred (car lst)) (count-helper (cdr lst) (+ acc 1)))  ; Si el predicado es verdadero, incrementa el acumulador
      (else (count-helper (cdr lst) acc))))           ; Si no, sigue sin incrementar
  (count-helper lst 0))                               ; Inicializa el acumulador en 0

;; Calcular el valor de una carta en Blackjack
(define (valor-carta carta)
  (let ((valor (car carta)))
    (cond
      ((equal? valor 'A) 11)
      ((equal? valor 'T) 10)
      ((member valor '(J Q K)) 10)
      (else (string->number (number->string valor))))))

;; Calcular el valor total de una mano en Blackjack, considerando ases
(define (valor-mano mano)
  (let ((suma (apply + (map valor-carta mano)))
        (ases (count (lambda (carta) (equal? (car carta) 'A)) mano)))
    (let loop ((suma suma) (ases ases))
      (if (and (> suma 21) (> ases 0))
          (loop (- suma 10) (- ases 1))
          suma))))

;; Mostrar el estado del jugador y el crupier
(define (mostrar-estado jugador crupier apuesta)
  (displayln (string-append "Apuesta: " (number->string apuesta)))
  (displayln (string-append "Jugador: " (number->string (valor-mano jugador)) " - " (format "~a" jugador)))
  (displayln (string-append "Crupier: " (number->string (valor-mano crupier)) " - " (format "~a" crupier))))


(define (mostrar-jugador jugador mano)
  (cond
    ((eq? jugador 'crupier) (printf "Crupier: ~a (~a)\n" mano (valor-mano mano)
                                    ) mano)
    ((eq? jugador 'jugador) (printf "Jugador: ~a (~a)\n" mano (valor-mano mano)
                                    ) mano)
    )
  )


(define mazo (barajar (crear-mazo)))

(define (apostar-fichas fichas-disponibles)
  (let loop ()
    (displayln "¿Cuantas fichas quieres apostar? (20, 50, 100, 200, 500, 1000): \n")
    (printf "Disponibles: ~a\n" fichas-disponibles)
    (let 
        ((fichas (string->number (read-line))))    
      (cond
        ;; el número de fichas es correcto
        ((and (or
          (= 20 fichas)
          (= 50 fichas)
          (= 100 fichas)
          (= 200 fichas)
          (= 500 fichas)
          (= 1000 fichas)
          ) (<= fichas fichas-disponibles)) fichas)
        (else (display "Fichas insuficientes o erroneas\n") (loop))
     )
    ))
  )

(define (cantidad-fichas!)
  (let loop ()
    (displayln "¿Con cuantas fichas quieres jugar?")
    (let
        (
         (fichas (string->number (read-line))))    
      (cond
        ;; el número de fichas es correcto
        ((and
          (real? fichas)
          (> fichas 0)
          ) fichas)
        (else (display "Fichas erroneas\n") (loop))
     )
    ))
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tipo de dato JUGADA

(define (crear-jugada mano fichas-disponibles apuesta)
  (list
     (list 'mano mano)
     (list 'fichas-disponibles fichas-disponibles)
     (list 'apuesta apuesta)
   )
  )
(define (mano? jugada)
  (cadr (assoc 'mano jugada))
  )
(define (fichas-disponibles? jugada)
  (cadr (assoc 'fichas-disponibles jugada))
  )
(define (apuesta? jugada)
  (cadr (assoc 'apuesta jugada))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tipo de dato RONDA

(define (crear-ronda ganador fichas-jugador fichas-crupier mazo)
  (list
     (list 'ganador ganador)
     (list 'fichas-jugador fichas-jugador)
     (list 'fichas-crupier fichas-crupier)
     (list 'mazo mazo)
   )
  )
(define (ganador? ronda)
  (cadr (assoc 'ganador ronda))
  )
(define (mazo? ronda)
  (cadr (assoc 'mazo ronda))
  )
(define (fichas-jugador? ronda)
  (cadr (assoc 'fichas-jugador ronda))
  )
(define (fichas-crupier? ronda)
  (cadr (assoc 'fichas-crupier ronda))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Se envia la apuesta, las fichas que tiene, y la mano
; Si el valor de la mano es superior o igual a 21, devuelve la mano, (- apuesta fichas-disponibles) apuesta
; Si se elige pedir, se relanza el let con la nueva mano
; Si se elige plantarse, se devuelve el objeto mano, (- apuesta fichas-disponibles) y apuesta
; Si se elige doblar y no hay suficientes fichas, se vuelve a preguntar
; Si se elige doblar, se devuelve el objeto (append mano (list (sacar-carta mazo)), (- (* 2 apuesta) fichas-disponibles) (* 2 apuesta)

(define (turno-jugador-fichas mano-mazo fichas-disponibles apuesta pidio?)
  (mover-patita 750 550 750 550 0.4 0.01 tapete)
  (limpiar-figura (lista-a-posn (list (list 650 200) (list 750 200) (list 750 450) (list 650 450))) tapete)
  (let
    (
     (valor-mano-actual (valor-mano (car mano-mazo)))
     (mazo (cdr mano-mazo))
     (mano (car mano-mazo))
     (fichas-disponibles fichas-disponibles)
     (apuesta apuesta))
     (printf "Jugador: ~a (~a)\n" mano valor-mano-actual)
     (cond
       ; La mano ya supera o iguala el valor de 21
       ((>= valor-mano-actual 21)
        (limpiar-figura (lista-a-posn (list (list 710 510)(list 800 510)(list 800 590)(list 710 590))) tapete)
        (cons (crear-jugada mano (- fichas-disponibles apuesta) apuesta)
              mazo))
       (else
        ;(display "Qué prefieres?\n 1. Pedir\n 2. Plantarte\n 3. Doblar\n")
        (let
         (
          (eleccion
           (do
               ((click (get-mouse-click v1) (get-mouse-click v1))
               (x 0 (posn-x (mouse-click-posn click)))
               (y 0 (posn-y (mouse-click-posn click)))
               )
             ((and (<= 520 y 580)
                   (or
                    (<= 240 x 500)
                    (<= 520 x 600)
                    (<= 620 x 700)))
              (cond
                ((<= 240 x 500) 3)
                ((<= 520 x 600) 1)
                ((<= 620 x 700) 2)
                                  ))
           ))
          )
          
          (cond
            ; Pedir carta
            ((eq? eleccion 1)
             (display "Pide carta.\n")
             (turno-jugador-fichas (add-carta-mano mano mazo 'jugador) fichas-disponibles apuesta #t))
            ; Plantarse
            ((eq? eleccion 2)
             (display "Se planta.\n")
             (limpiar-figura (lista-a-posn (list (list 710 510)(list 800 510)(list 800 590)(list 710 590))) tapete)
             (cons
              (crear-jugada mano (- fichas-disponibles apuesta) apuesta) mazo))
            ; Doblar 
            ((and (eq? eleccion 3))
             (cond
               ; Si ya pidió, no puede doblar
               (pidio?
                 (display "No puedes doblar una vez pides.\n")
                 (turno-jugador-fichas (add-carta-mano mano mazo 'jugador) fichas-disponibles apuesta #t))
               ; Hay suficientes fichas
               ((>= fichas-disponibles (* 2 apuesta))
                
                  (printf "Doblar la apuesta ~a * 2 = ~a\n" apuesta (* 2 apuesta))
                  (let*
                      ((resultado (add-carta-mano mano mazo 'jugador))
                       (mano (car resultado))
                       (mazo (cdr resultado)))
                  (limpiar-figura (lista-a-posn (list (list 650 200) (list 750 200) (list 750 450) (list 650 450))) tapete)
                  (limpiar-figura (lista-a-posn (list (list 710 510)(list 800 510)(list 800 590)(list 710 590))) tapete)
                  (printf "Jugador: ~a (~a)\n" mano (valor-mano mano))
                  (cons (crear-jugada mano (- fichas-disponibles (* 2 apuesta)) (* 2 apuesta))
                        mazo))
                  )
               ; No hay suficientes fichas
               (else
                (display "No hay suficientes fichas para doblar.\n")
                (limpiar-figura (lista-a-posn (list (list 710 510)(list 800 510)(list 800 590)(list 710 590))) tapete)
                (turno-jugador-fichas (cons mano mazo) fichas-disponibles apuesta #t))
                ))
            (else (display "FUERA"))
             )
            )
        ))
       ))

(define (turno-crupier mano-mazo fichas-disponibles apuesta)
  (limpiar-figura (lista-a-posn (list (list 650 200) (list 750 200) (list 750 450) (list 650 450))) tapete)
  (let
      (
       (valor-mano-actual (valor-mano (car mano-mazo)))
       (mazo (cdr mano-mazo))
       (mano (car mano-mazo))
       (fichas-disponibles fichas-disponibles)
       (apuesta (if (> apuesta fichas-disponibles) fichas-disponibles apuesta)))
      (printf "Crupier: ~a (~a)\n" mano valor-mano-actual)
      (cond
        ((> valor-mano-actual 16)
         (cons (crear-jugada mano (- fichas-disponibles apuesta) apuesta)
               mazo)
         )
        (else (turno-crupier (add-carta-mano mano mazo 'crupier) fichas-disponibles apuesta))
        ))
  )
  
(define (reparto-inicial mazo)
  (let*
      (
       (mano-crupier (list (car mazo)))
       (mano-jugador (list (cadr mazo) (caddr mazo)))
       )
    ;(printf " Crupier: ~a\n Jugador: ~a\n" (car mano-crupier) mano-jugador)
    ; Carta crupier
    (mover-patita-carta 700 250 200 250 0.3 1. tapete)
    (dibujar-carta 200 250 0.3 (cadar mano-crupier) (caar mano-crupier) valores)
    (mover-patita 300 250 700 250 0.4 1. tapete)
    
    (limpiar-figura (lista-a-posn (list (list 650 200) (list 750 200) (list 750 450) (list 650 450))) tapete)
    ; Carta jugador
    (mover-patita-carta 700 400 200 400 0.3 1. tapete)
    (dibujar-carta 200 400 0.3 (cadar mano-jugador) (caar mano-jugador) valores)
    (mover-patita 300 400 700 400 0.4 1. tapete)
    (limpiar-figura (lista-a-posn (list (list 650 200) (list 750 200) (list 750 450) (list 650 450))) tapete)
    (mover-patita-carta 700 400 300 400 0.3 1. tapete)
    (dibujar-carta 300 400 0.3 (cadadr mano-jugador) (caadr mano-jugador) valores)
    (mover-patita 400 400 700 400 0.4 1. tapete)
    (limpiar-figura (lista-a-posn (list (list 650 200) (list 750 200) (list 750 450) (list 650 450))) tapete)
    (append (list mano-crupier) (list mano-jugador) (list (cdddr mazo)))
    )
  )
;(dibujar-carta 300 400 0.3 (cadadr mano-jugador) (caadr mano-jugador) valores)
;(dibujar-carta 200 250 0.3 (cadar mano-crupier) (caar mano-crupier) valores)
;(dibujar-carta 200 400 0.3 (cadar mano-jugador) (caar mano-jugador) valores)
(define (actualizar-mesa mano-c mano-j f-c f-j)
  (mesa f-c f-j)
  (dibujar-carta 300 400 0.3 (cadadr mano-j) (caadr mano-j) valores)
  (dibujar-carta 200 250 0.3 (cadar mano-c) (caar mano-c) valores)
  (dibujar-carta 200 400 0.3 (cadar mano-j) (caar mano-j) valores)
  )
(define (ronda mazo fichas-crupier fichas-jugador)
  (let*
      (
       (reparto (reparto-inicial mazo))
       (mano-crupier (car reparto))
       (mano-jugador (cadr reparto))
       (mazo (caddr reparto))
       (apuesta (apostar fichas-jugador))
       (actualizacion (actualizar-mesa mano-crupier mano-jugador fichas-crupier fichas-jugador))
       (resultado-jugador (turno-jugador-fichas (cons mano-jugador mazo) fichas-jugador apuesta #f))
       (resultado-crupier (turno-crupier (cons mano-crupier (cdr resultado-jugador)) fichas-crupier (apuesta? (car resultado-jugador))))
       (valor-jugador (valor-mano (mano? (car resultado-jugador))))
       (valor-crupier (valor-mano (mano? (car resultado-crupier))))
       (mazo-final (cdr resultado-crupier))
       (fichas-jugador-a (fichas-disponibles? (car resultado-jugador)))
       (fichas-crupier-a (fichas-disponibles? (car resultado-crupier)))
       (apuesta-final (apuesta? (car resultado-jugador))) ; Por si dobla
       )
    (printf "Final ronda:\n fichas jugador: ~a\n fichas crupier: ~a\n apuesta: ~a\n" fichas-jugador-a fichas-crupier-a apuesta-final)
    (cond
      ((and (<= valor-jugador 21) (<= valor-crupier 21) (not (= valor-jugador valor-crupier)))
       (if (> valor-jugador valor-crupier)
       (crear-ronda 'jugador (+ fichas-jugador-a (* apuesta-final 2)) fichas-crupier-a mazo-final)
       (crear-ronda 'crupier fichas-jugador-a (+ fichas-crupier-a (* apuesta-final 2)) mazo-final)))
      ((or
        (and (> valor-jugador 21) (> valor-crupier 21))
        (= valor-jugador valor-crupier)) (crear-ronda 'empate fichas-jugador fichas-crupier mazo-final))
      ((and (<= valor-jugador 21) (> valor-crupier 21)) (crear-ronda 'jugador (+ fichas-jugador-a (* apuesta-final 2)) fichas-crupier-a mazo-final))
      ((and (> valor-jugador 21) (<= valor-crupier 21)) (crear-ronda 'crupier fichas-jugador-a (+ fichas-crupier-a (* apuesta-final 2)) mazo-final))    
    )
  ))
;(ronda (barajar (crear-mazo)) 100 100)

; primero dice cuantas fichas quiere para jugar
; Luego, asigna las fichas al jugador y al crupier
; En cada ronda, se actualiza el valor de fichas y el mazo
; termina cuando alguno de los dos tiene 20 o menos fichas
(define (blackjack-fichas)
  (mesa 0 0)
  (let
    (
     (fichas
      ;(cantidad-fichas!)
      (cantidad))
     )
    ;(printf "Fichas jugador: ~a\nFichas crupier: ~a\n" fichas fichas)
    (mesa fichas fichas)
    (let juego
    (
     (resultado-ronda (ronda (barajar (crear-mazo)) fichas fichas))
    )
      
      (cond
        ((< (fichas-jugador? resultado-ronda) 20) (display "CRUPIER GANA LA PARTIDA\n"))
        ((< (fichas-crupier? resultado-ronda) 20) (display "JUGADOR GANA LA PARTIDA\n"))
        (else
         (cond
           ((eq? (ganador? resultado-ronda) 'jugador) (display "Jugador gana la Ronda\n"))
           ((eq? (ganador? resultado-ronda) 'crupier) (display "Crupier gana la Ronda\n"))
           (else (display "Empate\n")))
         ;(printf "Fichas jugador: ~a\nFichas crupier: ~a\n" (fichas-jugador? resultado-ronda) (fichas-crupier? resultado-ronda))
         (mesa (fichas-crupier? resultado-ronda) (fichas-jugador? resultado-ronda))
         (juego
          (ronda (mazo? resultado-ronda) (fichas-crupier? resultado-ronda) (fichas-jugador? resultado-ronda)))))
  )))


(blackjack-fichas)