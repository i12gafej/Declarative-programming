#|
Archivo: Catjack.rkt
Descripción: programa principal y menús del juego
Autor: Javier García Fernández
|#

(require (lib "graphics.ss" "graphics"))

(open-graphics)

(define hor 800)
(define ver 600)
(define v1 (open-viewport "CatJack!" hor ver))

#|
El proyecto está dividido en 6 ficheros
 - Letras: define los puntos que conforman a cada letra y las funciones de impresión de textos
 - Figuras: defino la generación de las cartas, fichas, simbolos y valores de las cartas, además de los puntos que forman las figuras nombradas
 - Caratula: define los puntos de la caratula
 - Mesa: define las funciónes de generación de elementos gráficos de la mesa, además de animaciones e implementación de campo de introducción de texto.
 - Juego: implementa las funciones del funcionamiento del juego.
 - Catjack: programa principal donde se definen los menús tambien.

Todo elemento gráfico está generado por la librería graphics.
|#

(load "funciones/letras.rkt")
(load "funciones/graficos.rkt")
(load "funciones/figuras.rkt")
(load "funciones/juego.rkt")

#|
 Nombre: menu-inicio
 Descripción: Dibuja el menú inicial con letras formadas por polígonos y espera una entrada del usuario para continuar.
 Parámetros:
 - Ninguno
 Devuelve:
 booleano (true cuando se detecta una tecla presionada)
 Descripción de la solución:
 Se representan letras mediante polígonos y se muestra un texto inicial indicando que el usuario debe presionar cualquier tecla para empezar. 
 La función espera a que el usuario realice esta acción.
 Funciones auxiliares:
 - dibujar-texto
|#

(define (menu-inicio)
  ;; Dibuja el fondo del menú
  ((draw-solid-polygon v1)
   (list (make-posn 0 0) (make-posn 800 0) (make-posn 800 600) (make-posn 0 600))
   (make-posn 0 0) morosa)

  ;; Dibuja las letras del menú inicial
  ((draw-solid-polygon v1) list-c (make-posn 0 0) gris)
  ((draw-solid-polygon v1) list-a (make-posn 0 0) gris)
  ((draw-solid-polygon v1) list-t (make-posn 0 0) gris)
  ((draw-solid-polygon v1) list-j (make-posn 0 0) blanco)
  ((draw-solid-polygon v1) list-a2 (make-posn 0 0) blanco)
  ((draw-solid-polygon v1) list-c2 (make-posn 0 0) blanco)
  ((draw-solid-polygon v1) list-k (make-posn 0 0) blanco)

  (dibujar-texto "PRESIONA CUALQUIER TECLA PARA EMPEZAR" 30 550 10 blanco)

  ;; Espera a que el usuario presione una tecla
  (let 
      ;; Variables locales del let 
      ((click (get-key-press v1)))
    ;; Devuelve true si hay interacción
    (when click #t)))



#|
Nombre: menu-juegos
Descripción: Presenta el menú de juegos en pantalla con opciones gráficas interactivas.
Parámetros:
- Ninguno
Devuelve:
- Un símbolo que indica la opción seleccionada por el usuario: 'rondas, 'fichas, o 'inicio.
Descripción de la solución:
Se dibuja un fondo para el menú, varias opciones en rectángulos con texto, y se detecta mediante clic del ratón cuál opción fue seleccionada. 
El texto se dibuja varias veces ligeramente desplazado para dar profundidad al efecto visual.
Funciones auxiliares:
- dibujar-texto
|#

(define (menu-juegos)
  ;; Dibuja el fondo del menú
  ((draw-solid-polygon v1)
   (list (make-posn 0 0) (make-posn 800 0) (make-posn 800 600) (make-posn 0 600))
   (make-posn 0 0) morosa)

  ;; Dibuja el botón "INICIO"
  ((draw-polygon v1)
   (list
    (make-posn 600 10)
    (make-posn 750 10)
    (make-posn 750 70)
    (make-posn 600 70))
   (make-posn 0 0) blanco)

  ;; Dibuja el texto "INICIO" varias veces para dar profundidad
  (dibujar-texto "INICIO" 615 30 10 color_letras)
  (dibujar-texto "INICIO" 616 31 10 color_letras)
  (dibujar-texto "INICIO" 617 32 10 color_letras)
  (dibujar-texto "INICIO" 618 33 10 color_letras)

  ;; Dibuja el botón "JUGAR A RONDAS"
  ((draw-polygon v1)
   (list
    (make-posn 100 100)
    (make-posn 720 100)
    (make-posn 720 240)
    (make-posn 100 240))
   (make-posn 0 0) blanco)

  ;; Dibuja el texto "JUGAR A RONDAS" varias veces para dar profundidad
  (dibujar-texto "JUGAR A RONDAS" 130 150 20 color_letras)
  (dibujar-texto "JUGAR A RONDAS" 131 151 20 color_letras)
  (dibujar-texto "JUGAR A RONDAS" 132 152 20 color_letras)
  (dibujar-texto "JUGAR A RONDAS" 133 153 20 color_letras)

  ;; Dibuja el botón "JUGAR CON FICHAS"
  ((draw-polygon v1)
   (list
    (make-posn 40 350)
    (make-posn 750 350)
    (make-posn 750 490)
    (make-posn 40 490))
   (make-posn 0 0) blanco)

  ;; Dibuja el texto "JUGAR CON FICHAS" varias veces para dar profundidad
  (dibujar-texto "JUGAR CON FICHAS" 70 400 20 color_letras)
  (dibujar-texto "JUGAR CON FICHAS" 71 401 20 color_letras)
  (dibujar-texto "JUGAR CON FICHAS" 72 402 20 color_letras)
  (dibujar-texto "JUGAR CON FICHAS" 73 403 20 color_letras)

  ;; Bucle para capturar clics del usuario
  (let loop ()
    ;; Variables locales del let secuencial
    (let* ((click (get-mouse-click v1)) ;; Captura el clic del ratón
           (x (posn-x (mouse-click-posn click))) ;; Obtiene la coordenada x del clic
           (y (posn-y (mouse-click-posn click)))) ;; Obtiene la coordenada y del clic
      (cond
       ;; Si el clic está dentro del área de "JUGAR A RONDAS"
       ((and (<= 100 x 720) (<= 100 y 240)) 'rondas)

       ;; Si el clic está dentro del área de "JUGAR CON FICHAS"
       ((and (<= 40 x 750) (<= 350 y 490)) 'fichas)

       ;; Si el clic está dentro del área de "INICIO"
       ((and (<= 600 x 750) (<= 10 y 70)) 'inicio)

       ;; Si no se ha seleccionado ninguna opción válida, sigue esperando clics
       (else (loop))))))

#|
Nombre: menu-rondas
Descripción: Muestra un menú para seleccionar la cantidad de rondas que se desea jugar o regresar al menú principal.
Parámetros:
- Ninguno
Devuelve:
- Un número (3, 5, 7, o 11) que representa las rondas seleccionadas, o el símbolo 'back para regresar al menú principal.
Descripción de la solución:
El menú dibuja un fondo, botones interactivos con texto, y detecta la opción seleccionada mediante clics del ratón.
El texto de cada opción se dibuja varias veces levemente desplazado para crear un efecto de profundidad.
Funciones auxiliares:
- dibujar-texto
|#

(define (menu-rondas)
  ;; Dibuja el fondo del menú
  ((draw-solid-polygon v1)
   (list
    (make-posn 0 0)
    (make-posn 800 0)
    (make-posn 800 600)
    (make-posn 0 600))
   (make-posn 0 0) morosa)

  ;; Dibuja el botón "BACK"
  ((draw-polygon v1)
   (list
    (make-posn 600 10)
    (make-posn 750 10)
    (make-posn 750 70)
    (make-posn 600 70))
   (make-posn 0 0) blanco)
  ;; Dibuja el texto "BACK" varias veces para dar profundidad
  (dibujar-texto "BACK" 615 30 10 color_letras)
  (dibujar-texto "BACK" 616 31 10 color_letras)
  (dibujar-texto "BACK" 617 32 10 color_letras)
  (dibujar-texto "BACK" 618 33 10 color_letras)

  ;; Dibuja el texto del título "RONDAS A JUGAR"
  (dibujar-texto "RONDAS A JUGAR" 120 110 20 color_letras)
  (dibujar-texto "RONDAS A JUGAR" 121 110 20 color_letras)
  (dibujar-texto "RONDAS A JUGAR" 121 111 20 color_letras)
  (dibujar-texto "RONDAS A JUGAR" 122 111 20 color_letras)
  (dibujar-texto "RONDAS A JUGAR" 122 112 20 color_letras)
  (dibujar-texto "RONDAS A JUGAR" 123 112 20 color_letras)
  (dibujar-texto "RONDAS A JUGAR" 123 113 20 color_letras)

  ;; Dibuja el botón para 3 rondas
  ((draw-polygon v1)
   (list
    (make-posn 200 200)
    (make-posn 380 200)
    (make-posn 380 350)
    (make-posn 200 350))
   (make-posn 0 0) blanco)
  ;; Dibuja el texto "3" varias veces para dar profundidad
  (dibujar-texto "3" 268 240 30 color_letras)
  (dibujar-texto "3" 269 240 30 color_letras)
  (dibujar-texto "3" 269 241 30 color_letras)
  (dibujar-texto "3" 270 241 30 color_letras)
  (dibujar-texto "3" 270 242 30 color_letras)

  ;; Dibuja el botón para 5 rondas
  ((draw-polygon v1)
   (list
    (make-posn 420 200)
    (make-posn 600 200)
    (make-posn 600 350)
    (make-posn 420 350))
   (make-posn 0 0) blanco)
  ;; Dibuja el texto "5" varias veces para dar profundidad
  (dibujar-texto "5" 488 240 30 color_letras)
  (dibujar-texto "5" 489 240 30 color_letras)
  (dibujar-texto "5" 489 241 30 color_letras)
  (dibujar-texto "5" 490 241 30 color_letras)
  (dibujar-texto "5" 490 242 30 color_letras)

  ;; Dibuja el botón para 7 rondas
  ((draw-polygon v1)
   (list
    (make-posn 200 390)
    (make-posn 380 390)
    (make-posn 380 540)
    (make-posn 200 540))
   (make-posn 0 0) blanco)
  ;; Dibuja el texto "7" varias veces para dar profundidad
  (dibujar-texto "7" 268 430 30 color_letras)
  (dibujar-texto "7" 269 430 30 color_letras)
  (dibujar-texto "7" 269 431 30 color_letras)
  (dibujar-texto "7" 270 431 30 color_letras)
  (dibujar-texto "7" 270 432 30 color_letras)

  ;; Dibuja el botón para 11 rondas
  ((draw-polygon v1)
   (list
    (make-posn 420 390)
    (make-posn 600 390)
    (make-posn 600 540)
    (make-posn 420 540))
   (make-posn 0 0) blanco)
  ;; Dibuja el texto "11" varias veces para dar profundidad
  (dibujar-texto "11" 462 430 30 color_letras)
  (dibujar-texto "11" 463 430 30 color_letras)
  (dibujar-texto "11" 463 431 30 color_letras)
  (dibujar-texto "11" 464 431 30 color_letras)
  (dibujar-texto "11" 464 432 30 color_letras)

  ;; Bucle para capturar clics del usuario
  (let loop ()
    ;; Variables locales del let secuencial
    (let* ((click (get-mouse-click v1)) ;; Captura el clic del ratón
           (x (posn-x (mouse-click-posn click))) ;; Obtiene la coordenada x del clic
           (y (posn-y (mouse-click-posn click)))) ;; Obtiene la coordenada y del clic
      (cond
       ;; Si el clic está dentro del área de "3 rondas"
       ((and (<= 200 x 380) (<= 200 y 350)) 3)
       ;; Si el clic está dentro del área de "5 rondas"
       ((and (<= 420 x 600) (<= 200 y 350)) 5)
       ;; Si el clic está dentro del área de "7 rondas"
       ((and (<= 200 x 380) (<= 390 y 540)) 7)
       ;; Si el clic está dentro del área de "11 rondas"
       ((and (<= 420 x 600) (<= 390 y 540)) 11)
       ;; Si el clic está dentro del área de "BACK"
       ((and (<= 600 x 750) (<= 10 y 70)) 'back)
       ;; Si no se ha seleccionado ninguna opción válida, sigue esperando clics
       (else (loop))))))



#|
Nombre: inicio
Descripción: Maneja el flujo principal de la aplicación, incluyendo la navegación por los menús y la selección de modos de juego.
Parámetros:
- Ninguno
Devuelve:
- void
Descripción de la solución:
El programa utiliza una estructura condicional y bucles para mostrar menús y manejar la interacción del usuario. Dependiendo de las elecciones del usuario, se navega entre distintos menús o modos de juego.
Funciones auxiliares:
- menu-inicio
- menu-juegos
- menu-rondas
- blackjack-ganar
- blackjack-fichas
|#

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
               ((number? rondas)   (blackjack-ganar rondas) (loop (menu-juegos)))
               ((eq? rondas 'back) (loop (menu-juegos))))))
          ((eq? seleccion 'fichas) (blackjack-fichas) (loop (menu-juegos)))
          ((eq? seleccion 'inicio) (inicio))
        )
      )
   )
)

(inicio)