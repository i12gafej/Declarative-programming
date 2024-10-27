;; Función principal para comenzar el juego
(define (juego-blackjack)
  (mostrar-portada)
  (let ((nombre (leer-nombre)))
    (let ((modo (seleccionar-modo)))
      (cond
        ((eq? modo 'rondas) (jugar-modo-rondas nombre))
        ((eq? modo 'fichas) (jugar-modo-fichas nombre))))))

;; 1. Portada del juego
(define (mostrar-portada)
  (displayln "Bienvenido a Catjack!")
  (displayln "Pulsa Enter para comenzar...")
  (read-line))

;; 2. Introducir el nombre del jugador
(define (leer-nombre)
  (displayln "Introduce tu nombre:")
  (read-line))

;; 3. Seleccionar el modo de juego
(define (seleccionar-modo)
  (displayln "Selecciona el modo de juego:")
  (displayln "1. Modo ganar al mejor de 3/5/7")
  (displayln "2. Modo fichas")
  (let ((opcion (read-line)))
    (cond
      ((string=? opcion "1") 'rondas)
      ((string=? opcion "2") 'fichas)
      (else (begin (displayln "Opción no válida, selecciona de nuevo.") (seleccionar-modo))))))

;; 3.1. Función para seleccionar el número de rondas (para modo de ganar al mejor de 3/5/7)
(define (seleccionar-numero-de-rondas)
  (displayln "Elige el número de rondas (3/5/7):")
  (let ((rondas (read-line)))
    (cond
      ((string=? rondas "3") 3)
      ((string=? rondas "5") 5)
      ((string=? rondas "7") 7)
      (else (begin (displayln "Opción no válida, selecciona de nuevo.") (seleccionar-numero-de-rondas))))))

;; 3.2. Jugar al modo ganar al mejor de 3/5/7
;; Función que evalúa el estado del juego
(define (estado-del-juego victorias-jugador victorias-crupier rondas)
  (cond
    ((>= victorias-jugador (/ (+ rondas 1) 2)) (cons #t "¡Ganaste el juego!"))
    ((>= victorias-crupier (/ (+ rondas 1) 2)) (cons #t "El crupier ganó el juego."))
    (else (cons #f ""))))  ;; Si no hay ganador, se continúa jugando

;; Función para jugar al modo de rondas con la condición de parar basada en el estado del juego
(define (jugar-modo-rondas nombre)
  (let ((rondas (seleccionar-numero-de-rondas))
        (victorias-jugador 0)
        (victorias-crupier 0))
    (do ((i 1 (+ i 1)))  ;; Bucle que itera por las rondas
        ;; Condición de parada: Se evalúa el estado del juego
        ((car (estado-del-juego victorias-jugador victorias-crupier rondas))
         (displayln (cdr (estado-del-juego victorias-jugador victorias-crupier rondas))))
      ;; Cuerpo del bucle: se juega una ronda
      (displayln (string-append "Ronda " (number->string i)))
      (let ((ganador (jugar-ronda nombre)))  ;; Jugar la ronda y evaluar el ganador
        (cond
          ((eq? ganador 'jugador)
           (set! victorias-jugador (+ victorias-jugador 1))
           (displayln "Ganaste esta ronda."))
          ((eq? ganador 'crupier)
           (set! victorias-crupier (+ victorias-crupier 1))
           (displayln "El crupier ganó esta ronda.")))
        (displayln (string-append "Jugador: " (number->string victorias-jugador)
                                  " | Crupier: " (number->string victorias-crupier)))))))

;; 3.3. Jugar al modo fichas
;; Función para jugar al modo fichas
(define (jugar-modo-fichas nombre)
  (displayln "Introduce el número de fichas iniciales:")
  (let* ((fichas-iniciales (string->number (read-line)))
         (apuesta-minima (quotient fichas-iniciales 10))
         (fichas-jugador fichas-iniciales)
         (fichas-crupier fichas-iniciales))
    
    (do ()
        ;; Condición de parada: Se detiene si el jugador o el crupier tienen 0 o menos fichas
        ((or (<= fichas-jugador 0) (<= fichas-crupier 0))
         (if (<= fichas-jugador 0)
             (displayln "Te has quedado sin fichas, el crupier ganó.")
             (displayln "El crupier se ha quedado sin fichas, ¡ganaste!")))
      
      ;; Mostrar el estado actual de las fichas
      (displayln (string-append "Tus fichas: " (number->string fichas-jugador)
                                " | Fichas del crupier: " (number->string fichas-crupier)))
      
      ;; Pedir la apuesta
      (let ((apuesta (pedir-apuesta apuesta-minima fichas-jugador)))
        
        ;; Jugar una ronda
        (let ((ganador (jugar-ronda nombre)))
          (cond
            ;; Si el jugador gana la ronda
            ((eq? ganador 'jugador)
             (set! fichas-jugador (+ fichas-jugador (* 2 apuesta)))  ;; Doble de lo apostado
             (set! fichas-crupier (- fichas-crupier apuesta))
             (displayln (string-append "Ganaste la apuesta de " (number->string apuesta) " fichas.")))
            ;; Si el crupier gana la ronda
            ((eq? ganador 'crupier)
             (set! fichas-jugador (- fichas-jugador apuesta))
             (set! fichas-crupier (+ fichas-crupier apuesta))
             (displayln (string-append "El crupier ganó la apuesta de " (number->string apuesta) " fichas.")))
            ;; Si hay empate
            ((eq? ganador 'empate)
             (displayln "Empate, no hay cambios en las fichas."))))
        
        ;; Verificar si el jugador o el crupier tienen 0 o menos fichas
        (when (or (<= fichas-jugador 0) (<= fichas-crupier 0))
          (if (<= fichas-jugador 0)
              (displayln "Te has quedado sin fichas, el crupier ganó.")
              (displayln "El crupier se ha quedado sin fichas, ¡ganaste!"))
          (displayln "Juego terminado.")
          )))))

;; 4. Pedir la apuesta en el modo fichas
(define (pedir-apuesta minima fichas-disponibles)
  (displayln (string-append "Apuesta (mínimo: " (number->string minima) "):"))
  (let ((apuesta (string->number (read-line))))
    (if (and (>= apuesta minima) (<= apuesta fichas-disponibles))
        apuesta
        (begin (displayln "Apuesta no válida.") (pedir-apuesta minima fichas-disponibles)))))

;; 5. Función para jugar una ronda de blackjack
;; Simula el proceso de recibir cartas, pedir más o plantarse, y luego el turno del crupier.
;; Función para jugar una ronda de blackjack
(define (jugar-ronda nombre)
  (displayln (string-append "Tu turno, " nombre))
  (let ((total-jugador (jugar-turno-jugador)))
    (if (> total-jugador 21)
        (begin
          (displayln "Te has pasado. El crupier toma el turno.")
          (let ((total-crupier (jugar-turno-crupier)))
            (resultado-ronda total-jugador total-crupier)))
        (let ((total-crupier (jugar-turno-crupier)))
          (resultado-ronda total-jugador total-crupier)))))

;; Función para el turno del jugador
(define (jugar-turno-jugador)
  (let loop ((total (sacar-carta)))
    (displayln (string-append "Total actual: " (number->string total)))
    (if (> total 21)
        total  ;; Si se pasa, se devuelve el total (jugador pierde)
        (begin
          (displayln "Elige: 1) Sacar otra carta, 2) Plantarse")
          (let ((opcion (read-line)))
            (cond
              ((string=? opcion "1")
               (let ((nueva-carta (sacar-carta)))
                 (displayln (string-append "Sacaste: " (number->string nueva-carta)))
                 (loop (+ total nueva-carta))))
              ((string=? opcion "2") total)
              (else (begin (displayln "Opción no válida.") (loop total)))))))))

;; Función para el turno del crupier
(define (jugar-turno-crupier)
  (let loop ((total (sacar-carta)))
    (cond
      ;; Si el crupier está en 18-21, se planta
      ((and (>= total 18) (<= total 21)) 
       (begin (displayln (string-append "El crupier se planta con " (number->string total))) total))
      ;; Si el crupier está en 16-17, decide si tomar otra carta con un 50% de probabilidad
      ((and (>= total 16) (< total 18))
       (if (= (random 2) 1)
           (begin
             (displayln "El crupier decide tomar otra carta.")
             (loop (+ total (sacar-carta))))
           (begin
             (displayln (string-append "El crupier se planta con " (number->string total))) total)))
      ;; Si el crupier tiene entre 0 y 15, sigue tomando cartas
      ((and (>= total 0) (<= total 15))
       (begin
         (displayln "El crupier toma otra carta.")
         (loop (+ total (sacar-carta)))))
      ;; Si el crupier se pasa de 21, devuelve el total (pierde)
      ((> total 21)
       (begin
         (displayln (string-append "El crupier se pasó con " (number->string total)))
         total)))))

;; Función que decide el resultado de la ronda
(define (resultado-ronda total-jugador total-crupier)
  (displayln (string-append "Tu total: " (number->string total-jugador)))
  (displayln (string-append "Total del crupier: " (number->string total-crupier)))
  (cond
    ;; Ambos se pasan de 21, es empate
    ((and (> total-jugador 21) (> total-crupier 21)) 'empate)
    ;; Jugador se pasa, crupier gana
    ((> total-jugador 21) 'crupier)
    ;; Crupier se pasa, jugador gana
    ((> total-crupier 21) 'jugador)
    ;; Jugador tiene más puntos que el crupier
    ((> total-jugador total-crupier) 'jugador)
    ;; Crupier tiene más puntos que el jugador
    ((> total-crupier total-jugador) 'crupier)
    ;; Si tienen los mismos puntos es empate
    (else 'empate)))

;; Función para sacar una carta (número aleatorio entre 1 y 11)
(define (sacar-carta)
  (+ 1 (random 11)))

;; Función para sacar una carta (número aleatorio entre 1 y 11)
(define (sacar-carta)
  (+ 1 (random 11)))

;; Iniciar el juego
(juego-blackjack)
