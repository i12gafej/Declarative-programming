;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#|
Practica 5: tipos abstracto de datos y lectura y escritura
Autor: Javier García Fernández
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   Tipo de datos abstracto 'club' 
Objetivo:
   Mediante lista de asociación, implementar las funciónes de gestión
   para crear, acceder, consultar y modificar el tipo abstracto de datos CLUB.
Campos:
 - nombre
 - ciudad (en la que está el club)
 - año de fundación.
Descripción de la solucion:
   Dada una lista de asociación, podemos generar un tipo abstracto de datos CLUB
   en el que poder consultar, crear, modificar y acceder a los datos.    
|#

(define club1
  (list
   (list 'nombre "La Colina")
   (list 'ciudad "Cordoba")
   (list 'año 2003)   
   ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   crear-club
Objetivo:
   Dados unos atributos creamos la lista de asociación CLUB
   como TAD.
Campos:
 - nombre
 - ciudad (en la que está el club)
 - año (de fundación)
Resultado:
   lista del TAD
Descripción de la solucion:

Funciones auxiliares:
  ninguna
|#

(define (crear-club nombre ciudad año)
  (list
   (list 'nombre nombre)
   (list 'ciudad ciudad)
   (list 'año año)   
   ))

;(crear-club "Dolomitas" "Llobregat" 1985)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1.2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   consultar-nombre
Objetivo:
   Dado un TAD CLUB, devuelve el nombre del club.
Campos:
 - club
Resultado:
   Cadena
Descripción de la solucion:
  Dado (('nombre "Dolomitas")('ciudad "Llobregat")('año 1985))
  devuelve "Dolomitas"
Funciones auxiliares:
  ninguna
|#

(define (consultar-nombre club)
  (cadr (assoc 'nombre club))
  )

;(consultar-nombre (crear-club "Dolomitas" "Llobregat" 1985))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1.3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   consultar-ciudad
Objetivo:
   Dado un TAD CLUB, devuelve la ciudad donde se encuetra el club.
Campos:
 - club
Resultado:
   Cadena
Descripción de la solucion:
  Dado (('nombre "Dolomitas")('ciudad "Llobregat")('año 1985))
  devuelve "Llobregat"
Funciones auxiliares:
  ninguna
|#

(define (consultar-ciudad club)
  (cadr (assoc 'ciudad club))
  )

;(consultar-ciudad (crear-club "Dolomitas" "Llobregat" 1985))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1.4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   consultar-año
Objetivo:
   Dado un TAD CLUB, devuelve el año de fundación del club.
Campos:
 - club
Resultado:
   Numérico
Descripción de la solucion:
  Dado (('nombre "Dolomitas")('ciudad "Llobregat")('año 1985))
  devuelve 1985
Funciones auxiliares:
  ninguna
|#

(define (consultar-año club)
  (cadr (assoc 'año club))
  )

;(consultar-año (crear-club "Dolomitas" "Llobregat" 1985))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1.5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   mostrar-club
Objetivo:
   Muestra los datos del club
Campos:
 - club
Resultado:
   void
Descripción de la solucion:
  
Funciones auxiliares:
  consultar-nombre, consultar-ciudad, consultar-año
|#

(define (mostrar-club club)
  (display "Nombre: ")(display (consultar-nombre club))
  (display " // Ciudad: ")(display (consultar-ciudad club))
  (display " // Año: ")(display (consultar-año club))(newline)
  )

;(mostrar-club (crear-club "Marina Shore" "Valencia" 2024))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1.6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   modificar-nombre!
Objetivo:
   Dado un TAD CLUB, modifica el nombre del club.
Campos:
 - club
 - nombre
Resultado:
   void
Descripción de la solucion:
  Dado (('nombre "Dolomitas")('ciudad "Llobregat")('año 1985))
  y nuevo nombre "La Colina", devuelve
  (('nombre "La Colina")('ciudad "Llobregat")('año 1985))
Funciones auxiliares:
  ninguna
|#

(define (modificar-nombre! club nombre)
  (set-cdr! (assoc 'nombre club) (list nombre))
  )

#|
(define ejemplo (crear-club "Dolomitas" "Llobregat" 1985))
(modificar-nombre! ejemplo "La Colina")
(consultar-nombre ejemplo)
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1.7
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   modificar-ciudad!
Objetivo:
   Dado un TAD CLUB, modifica la ciudad del club.
Campos:
 - club
 - ciudad
Resultado:
   void
Descripción de la solucion:
  Dado (('nombre "Dolomitas")('ciudad "Llobregat")('año 1985))
  y nueva ciudad "Barcelona", devuelve
  (('nombre "La Colina")('ciudad "Barcelona")('año 1985))
Funciones auxiliares:
  ninguna
|#

(define (modificar-ciudad! club ciudad)
  (set-cdr! (assoc 'ciudad club) (list ciudad))
  )

#|
(define ejemplo (crear-club "Dolomitas" "Llobregat" 1985))
(modificar-ciudad! ejemplo "Barcelona")
(consultar-ciudad ejemplo)
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1.8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   modificar-año!
Objetivo:
   Dado un TAD CLUB, modifica el año de fundación del club.
Campos:
 - club
 - año
Resultado:
   void
Descripción de la solucion:
  Dado (('nombre "Dolomitas")('ciudad "Llobregat")('año 1985))
  y nuevo año 2000, devuelve
  (('nombre "La Colina")('ciudad "Barcelona")('año 2000))
Funciones auxiliares:
  ninguna
|#

(define (modificar-año! club año)
  (set-cdr! (assoc 'año club) (list año))
  )

#|
(define ejemplo (crear-club "Dolomitas" "Llobregat" 1985))
(modificar-año! ejemplo 2000)
(consultar-año ejemplo)
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   Tipo de datos abstracto 'campeonato' 
Objetivo:
   Implementar las funciónes de gestión para crear, acceder, consultar
   y modificar el tipo abstracto de datos campeonato.
Campos:
 - clubs
Descripción de la solucion:
   Dada una lista de asociación, podemos generar un tipo abstracto de datos CLUB
   en el que poder consultar, crear, modificar y acceder a los datos.    
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   crear-campeonato!
Objetivo:
   Crear un campeonato vacio
Campos:
   ninguno
Resultado:
   lista de asociación sin valores
Descripción de la solucion:
  
Funciones auxiliares:
  ninguna
|#

(define (crear-campeonato)
  (list)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2.2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   campeonato-vacio?
Objetivo:
   Comprobar si un campeonato está vacio
Campos:
   - campeonato
Resultado:
   Booleano
Descripción de la solucion:
  
Funciones auxiliares:
  ninguna
|#

(define (campeonato-vacio? campeonato)
  (equal? campeonato '())
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2.3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   leer-fichero
Objetivo:
   Carga elementos de un fichero separados por punto y coma.
Campos:
   - nombre-fichero
Resultado:
   lista de listas de elementos por fila
Descripción de la solucion:
  
Funciones auxiliares:
  formato
|#

(define (leer-fichero nombre-fichero)
  (let
      ; Variables locales del programa
      (
       ;; Abrimos el archivo
       (entrada (open-input-file nombre-fichero))
       )
    
    (let loop
      ; Variable locales del bucle
      (
       ;; Lista acumulativa para filas completas
       (resultado '())
       ;; Lista acumulativa para una fila
       (fila '())
       ;; Acumulador de caracteres para un string
       (cadena "")
       ;; Primer carácter leído
       (caracter (read-char entrada))) 
      (cond
        ;; Si llegamos al final del archivo
        ((eof-object? caracter)
         (begin
           ;; Cerramos el archivo
           (close-input-port entrada)
           ;; Procesamos cualquier dato restante
           ;; Uso reverse para cambiar orden de lista
           (reverse
            ; Fila vacia
            (if (null? fila)
                resultado
                ; Si no esta vacía devuelve la cadena del reves con los elementos de la fila
                ; del reves con el último elemento en su formato
                (cons
                 (reverse (if (string=? cadena "")
                              fila
                              (cons (formato cadena) fila)))
                 resultado)))))

        ;; Ignorar caracter del final de linea con \r
        ((char=? caracter #\return)
         (loop resultado fila cadena (read-char entrada)))

        ;; Si encuentra un salto de línea
        ((char=? caracter #\newline)
         (loop
          (cons
           (reverse (if (string=? cadena "")
                        fila
                        (cons (formato cadena) fila)))
           ;; Se añade la fila completa al resultado
           resultado)
          ;; Se reinicia la fila
          '()
          ;; Se reinicia la cadena
          "" 
          (read-char entrada)))

        ;; Si se encuentra un punto y coma
        ((char=? caracter #\;)
         (loop
          resultado
           ;; Se añade el string a la fila
          (cons (formato cadena) fila)
          ;; Se reinicia la cadena
          "" 
          (read-char entrada)))

        ;; Para cualquier otro carácter
        (else
         (loop
          resultado
          fila
          ;; Se acumula en la cadena
          (string-append cadena (string caracter)) 
          (read-char entrada)))))))

(define (formato cadena)
  ;; Verifica si una cadena contiene solo números
  ;; Si es así, la convierte en un número
  (if (string->number cadena)
      (string->number cadena)
      cadena))

#|
Nombre:
   escribir-fichero
Objetivo:
   Escribir elementos separados por punto y coma en un fichero.
Campos:
   - nombre-fichero
Resultado:
   void
Descripción de la solucion:
  
Funciones auxiliares:
  ninguna
|#


(define (escribir-fichero nombre-fichero lista-datos)  
  ;; Abre el archivo para escritura
  (let*      
      ;; Variables locales del let secuencial
      (
       ;; Archivo de salida abierto en modo texto
       (salida (open-output-file nombre-fichero #:mode 'text #:exists 'replace)))    
    ;; Cuerpo de la función
    (begin
      ;; Itera sobre cada fila en lista-datos
      (for-each       
       ;; Define la lambda para procesar cada fila
       (lambda (fila)         
         ;; Escribe los elementos de la fila
         (let loop             
             ;; Variables iterativas del let
             (
              ;; Elementos restantes de la fila
              (resto fila)
              ;; Indicador de si es el primer elemento
              (primero? #t))           
           ;; Condicional para procesar los elementos
           (cond
            ;; Si no quedan elementos, escribe un salto de línea
            ((null? resto)
             (begin
               (newline salida))) ;; Salto de línea           
            ;; Si hay elementos restantes
            (else
             (begin               
               ;; Escribe un punto y coma solo si no es el primer elemento
               (if (not primero?)
                   (write-char #\; salida))               
               ;; Escribe el elemento actual
               (if (string? (car resto))
                   (display (car resto) salida)
                   (write (car resto) salida))               
               ;; Llama recursivamente al bucle
               (loop
                ;; Resto de elementos
                (cdr resto)
                ;; Ya no es el primer elemento
                #f))))))       
       ;; Itera sobre las filas
       lista-datos)      
      ;; Cierra el archivo de salida
      (close-output-port salida))))



#|
Nombre:
   cargar-campeonato
Objetivo:
   Carga el campeonato de un fichero
Campos:
   - nombre-fichero
Resultado:
   TAD campeonato
Descripción de la solucion:
  
Funciones auxiliares:
  foldl, leer-fichero
|#

(define (foldl f acc lst)
  ;; Aplica la función de izquierda a derecha sobre la lista.
  (if (null? lst)
      ;; Retorna el acumulador si la lista está vacía
      acc
      ;; Llama recursivamente con la función aplicada al acumulador
      (foldl f (f (car lst) acc) (cdr lst))))

(define (cargar-campeonato nombre-fichero)
  ;; Carga los datos del fichero y convierte cada fila en un club,
  ;; añadiéndolos al campeonato.
  (let* 
    ;; Variables locales del let secuencial
    (
     ;; Lee las filas del fichero
     (filas (leer-fichero nombre-fichero)) 
     ;; Crea un campeonato vacío
     (campeonato (crear-campeonato)))     
    ;; Procesa todas las filas y las añade al campeonato
    (foldl
     ;; Función lambda para procesar cada fila
     (lambda (fila campeonato)
       ;; Variables locales del let
       (let         
         ;; Convierte la fila en un club
         ((club (crear-club
                 ;; Nombre
                 (car fila)                   
                 ;; Ciudad
                 (cadr fila)                  
                 ;; Año
                 (caddr fila))))              
         ;; Inserta el club en el campeonato
         (append campeonato (list club))))      
     ;; Inicializa el campeonato acumulativo
     campeonato
     ;; Procesa todas las filas
     filas)))

;(cargar-campeonato "salida.txt")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2.4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   grabar-campeonato
Objetivo:
   Grabar el campeonato en un fichero.
Campos:
   - nombre-fichero
   - campeonato
Resultado:
   void
Descripción de la solucion:
  
Funciones auxiliares:
  escribir-fichero
|#


(define (grabar-campeonato nombre-fichero campeonato)
  ;; Convierte el campeonato en una lista de listas de elementos
  (let*      
      ;; Variables locales del let secuencial
      (
       ;; Lista de filas a partir del campeonato
       (filas
        (map        
         ;; Define la lambda para transformar un club
         (lambda (club)
           ;; Transforma el club en una lista de sus elementos
           (list
            ;; Obtiene el nombre del club
            (consultar-nombre club)
            ;; Obtiene la ciudad del club
            (consultar-ciudad club)
            ;; Obtiene el año de fundación del club
            (consultar-año club)))        
         ;; Itera sobre los clubes en el campeonato
         campeonato)))
    ;; Llama a la función escribir-fichero con las filas generadas
    (escribir-fichero nombre-fichero filas)))

#|
(grabar-campeonato "salida2.txt" (list (crear-club "Dolomitas" "Llobregat" 1985)
                                       (crear-club "La Colina" "Valencia" 2003)))
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2.5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   existe-club?
Objetivo:
   Comprueba si el club pertenece al campeonato
Campos:
   - campeonato
   - club
Resultado:
   Booleano
Descripción de la solucion:
  
Funciones auxiliares:
  
|#

(define (existe-club? campeonato club)
  (do
      ;; Variables Iterativas
      (
       (i 1 (+ i 1))
       (auxiliar (list-ref campeonato 0) (list-ref campeonato i))
       )
      ;; Condición de parada
      ((= i (length campeonato)) (equal? auxiliar club))
    ;; No hay cuerpo de DO
      )
  )

#|
(existe-club? (list (crear-club "Dolomitas" "Llobregat" 1985)
                    (crear-club "La Colina" "Valencia" 2003))
              (crear-club "Dolomitass" "Llobregat" 1985))

(existe-club? (list (crear-club "Dolomitas" "Llobregat" 1985)
                    (crear-club "La Colina" "Valencia" 2003))
              (crear-club "Dolomitas" "Llobregat" 1985))
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2.6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   insertar-club
Objetivo:
   Inserta un club en el campeonato indicado
Campos:
   - campeonato
   - club
Resultado:
   Lista campeonato
Descripción de la solucion:
  
Funciones auxiliares:
  ninguna
|#

(define (insertar-club campeonato club)
  (append campeonato (list club))
  )

#|
(define ejemplo (insertar-club (crear-campeonato) (crear-club "Dolomitas" "Llobregat" 1985)))
(set! ejemplo (insertar-club ejemplo (crear-club "La Colina" "Valencia" 2008)))
(display ejemplo)
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2.7
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   borrar-club
Objetivo:
   Borrar un club en el campeonato indicado
Campos:
   - campeonato
   - nombre: del club
Resultado:
   Lista campeonatos
Descripción de la solucion:
  
Funciones auxiliares:
  consultar-nombre
|#

(define (borrar-club nombre campeonato)
  (let*
      ;; Variables locales del let secuencial
      (
       ;; Lista acumulativa para el nuevo campeonato
       (nuevo-campeonato '()))
    ;; Cuerpo de la función
    (do
        ;; Variables Iterativas
        (
         ;; Índice que recorre la lista
         (i 0 (+ i 1))
         ;; Lista acumulativa para los clubes que no coincidan con el eliminado
         (acumulado nuevo-campeonato
                    (if (not (equal? (consultar-nombre (list-ref campeonato i)) nombre))
                        (cons (list-ref campeonato i) acumulado)
                        acumulado)))
        ;; Condición de parada
        ((= i (length campeonato)) (reverse acumulado))
      ;; No hay cuerpo de DO
      )
    ))

;(borrar-club "Dolomitas" (list (crear-club "La Colina" "Valencia" 2003)(crear-club "Dolomitas" "Llobregat" 1985)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2.8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   modificar-club
Objetivo:
   Modifica un club en el campeonato indicado
Campos:
   - nombre: del club
   - ciudad
   - año: en la que fue fundado el club
   - campeonato
Resultado:
   Lista campeonatos con club modificado
Descripción de la solucion:
  
Funciones auxiliares:
  consultar-nombre
|#

(define (modificar-club nombre ciudad año campeonato)
  (let*
      ;; Variables locales del let secuencial
      (
       ;; Lista acumulativa para el nuevo campeonato
       (nuevo-campeonato '()))
    ;; Cuerpo de la función
    (do
        ;; Variables Iterativas
        (
         ;; Índice que recorre la lista
         (i 0 (+ i 1))
         ;; Lista acumulativa para los clubes que no coincidan con el eliminado
         (acumulado nuevo-campeonato
                    (if (not (equal? (consultar-nombre (list-ref campeonato i)) nombre))
                        (cons (list-ref campeonato i) acumulado)
                        (cons (crear-club nombre ciudad año) acumulado)))
         )
        ;; Condición de parada
        ((= i (length campeonato)) (reverse acumulado))
      ;; No hay cuerpo de DO
      )
    )
  )

;(modificar-club "Dolomitas" "Palermo" 1978 (list (crear-club "La Colina" "Valencia" 2003)(crear-club "Dolomitas" "Llobregat" 1985)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2.9
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   consultar-club
Objetivo:
   Muestra por pantalla los datos de un club
Campos:
   - nombre: del club
   - campeonato
Resultado:
   club
Descripción de la solucion:
  
Funciones auxiliares:
  consultar-nombre, mostrar-club
|#

(define (consultar-club nombre campeonato)
  (do
        ;; Variables Iterativas
        (
         ;; Índice que recorre la lista
         (i 0 (+ i 1))    
         )
        ;; Condición de parada
        ((equal? (cadr (list-ref (list-ref campeonato 0) i)) nombre) (mostrar-club (list-ref campeonato i)))
      ;; No hay cuerpo de DO
      )
  )


;(consultar-club "Dolomitas" (list (crear-club "La Colina" "Valencia" 2003)(crear-club "Dolomitas" "Llobregat" 1985)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2.9
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   consultar-clubes
Objetivo:
   Muestra por pantalla los datos de todos los clubes
Campos:
   - campeonato
Resultado:
   void
Descripción de la solucion:
  
Funciones auxiliares:
  mostrar-club
|#

(define (consultar-clubes campeonato)
  (do
        ;; Variables Iterativas
        (
         ;; Índice que recorre la lista
         (i 0 (+ i 1))
         )
        ;; Condición de parada
        ((= i (length campeonato)) )
      ;; Cuerpo de DO
    (mostrar-club (list-ref campeonato i))
      )
  (newline)
  )

;(consultar-clubes (list (crear-club "La Colina" "Valencia" 2003)(crear-club "Dolomitas" "Llobregat" 1985)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2.10
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   consultar-clubes-ciudad
Objetivo:
   Muestra por pantalla los datos de todos los clubes de una ciudad
Campos:
   - ciudad
   - campeonato   
Resultado:
   void
Descripción de la solucion:
  
Funciones auxiliares:
  consultar-ciudad, mostrar-club
|#

(define (consultar-clubes-ciudad ciudad campeonato)
  (do
        ;; Variables Iterativas
        (
         ;; Índice que recorre la lista
         (i 0 (+ i 1))
         )
        ;; Condición de parada
        ((= i (length campeonato)) )
      ;; Cuerpo de DO
    (let ((club-actual (list-ref campeonato i)))
    (cond ((equal? (consultar-ciudad club-actual) ciudad)(mostrar-club club-actual))))
      )
  (newline)
  )

;(consultar-clubes-ciudad "Llobregat" (list (crear-club "La Colina" "Valencia" 2003)(crear-club "Dolomitas" "Llobregat" 1985)(crear-club "Rafaleo" "Llobregat" 1990)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2.11
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   buscar-campeonato
Objetivo:
   Busca un campeonato en la lista de campeonatos por nombre.
Campos:
   - campeonatos: Lista de campeonatos.
   - nombre: Nombre del campeonato a buscar.
Resultado:
   El campeonato encontrado o vacío si no se encuentra.
Descripción de la solucion:
   Se utiliza un bucle `DO` para recorrer la lista y encontrar el campeonato cuyo nombre coincida.
Funciones auxiliares:
   ninguna
|#
(define (buscar-campeonato campeonatos nombre)
  (do
      ; VARIABLES ITERATIVAS
      (
       (i 0 (+ i 1)) 
       )
    ; CONDICIÓN DE PARADA
    ((equal? (list-ref (list-ref campeonatos i) 0) nombre) (list-ref (list-ref campeonatos i) 1))
    ; CUERPO DEL DO: No hay cuerpo del DO.
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2.12
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   mostrar-campeonatos
Objetivo:
   Muestra todos los campeonatos en la lista de campeonatos.
Campos:
   - campeonatos: Lista de campeonatos.
Resultado:
   void
Descripción de la solucion:
   Se recorre cada campeonato y se imprime la información correspondiente.
Funciones auxiliares:
   consultar-clubes
|#

(define (mostrar-campeonatos campeonatos)
  (do
      ; VARIABLES ITERATIVAS
      (
       (i 0 (+ i 1)) 
       )
    ; CONDICIÓN DE PARADA
    ((equal? i (length campeonatos)))
    ; CUERPO DEL DO
    (display "-------------------------------------------------------------\n")
    (display "Campeonato: ") (display (list-ref (list-ref campeonatos i) 0))
    (newline)
    (consultar-clubes (list-ref (list-ref campeonatos i) 1)))
  (display "-------------------------------------------------------------\n")
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2.13
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   existe-campeonato?
Objetivo:
   Comprueba si un campeonato existe en la lista de campeonatos.
Campos:
   - nombre: Nombre del campeonato a buscar.
   - campeonatos: Lista de campeonatos.
Resultado:
   Booleano indicando si el campeonato existe o no.
Descripción de la solucion:
   Se recorre la lista de campeonatos buscando coincidencia con el nombre.
Funciones auxiliares:
   ninguna
|#

(define (existe-campeonato? nombre campeonatos)
  (do
      ; VARIABLES ITERATIVAS
      (
       (i 0 (+ i 1)) 
       (actual (list-ref (list-ref campeonatos 0) 0) (list-ref (list-ref campeonatos i) 0))
       )
    ; CONDICIÓN DE PARADA
    ((or (equal? i (length campeonatos)) (equal? nombre actual))
     (equal? nombre actual))
    ; CUERPO DEL DO: No hay cuerpo del DO.
  )
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2.14
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   insertar-club-campeonatos
Objetivo:
   Inserta un club en el campeonato correspondiente.
Campos:
   - campeonatos: Lista de campeonatos.
   - campeonato-nombre: Nombre del campeonato en el que insertar el club.
   - club: El club a insertar.
Resultado:
   Nueva lista de campeonatos con el club insertado.
Descripción de la solucion:
   Se recorre la lista de campeonatos buscando el campeonato con el nombre dado y se inserta el club.
Funciones auxiliares:
   insertar-club
|#

(define (insertar-club-campeonatos campeonatos campeonato-nombre club)
  (do
    ; VARIABLES ITERATIVAS
    (
      (i 0 (+ i 1))
      ; Lista acumulativa de campeonatos.
      (acumulado (list) 
       (append acumulado (if (not (equal? campeonato-nombre (list-ref (list-ref campeonatos i) 0)))
                             (list (list-ref campeonatos i)) ; Si no coincide, agregar tal cual.
                             (list (list (list-ref (list-ref campeonatos i) 0) (insertar-club (list-ref (list-ref campeonatos i) 1) club)))))) ; Si coincide, insertar el club.
      )
    ; CONDICIÓN DE PARADA
    ((equal? i (length campeonatos)) acumulado) 
  )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2.15
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   modificar-club-campeonatos
Objetivo:
   Modifica un club en un campeonato de la lista de campeonatos.
Campos:
   - campeonatos: Lista de campeonatos.
   - campeonato-nombre: Nombre del campeonato que contiene el club a modificar.
   - club-nombre: Nombre del club a modificar.
   - ciudad: Nueva ciudad del club.
   - año: Nuevo año de fundación del club.
Resultado:
   Nueva lista de campeonatos con el club modificado.
Descripción de la solucion:
   Recorre los campeonatos y cuando encuentra el correspondiente, modifica el club.
Funciones auxiliares:
   modificar-club
|#

(define (modificar-club-campeonatos campeonatos campeonato-nombre club-nombre ciudad año)
  (do
    ; VARIABLES ITERATIVAS
    (
      (i 0 (+ i 1)) 
      (acumulado (list)
       (append acumulado (if (not (equal? campeonato-nombre (list-ref (list-ref campeonatos i) 0)))
                             (list-ref campeonatos i) ; Si no coincide, agregar tal cual.
                             (list (list-ref (list-ref campeonatos i) 0) (modificar-club club-nombre ciudad año (list-ref (list-ref campeonatos i) 1)))))) ; Si coincide, modificar el club.
      )
    ; CONDICIÓN DE PARADA
    ((equal? i (length campeonatos)) acumulado) 
  )
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2.16
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   borrar-club-campeonatos
Objetivo:
   Borra un club de un campeonato de la lista de campeonatos.
Campos:
   - campeonatos: Lista de campeonatos.
   - campeonato-nombre: Nombre del campeonato que contiene el club a borrar.
   - club-nombre: Nombre del club a borrar.
Resultado:
   Nueva lista de campeonatos sin el club especificado.
Descripción de la solucion:
   Se recorre la lista de campeonatos y cuando se encuentra el campeonato adecuado, se elimina el club.
Funciones auxiliares:
   borrar-club, buscar-campeonato
|#

(define (borrar-club-campeonatos campeonatos campeonato-nombre club-nombre)
  (do
    ; VARIABLES ITERATIVAS
    (
      (i 0 (+ i 1)) 
      (acumulado (list) 
       (append acumulado (if (not (equal? campeonato-nombre (list-ref (list-ref campeonatos i) 0)))
                             (list (list-ref campeonatos i)) ; Si no coincide, agregar tal cual.
                             (list (list (list-ref (list-ref campeonatos i) 0) (borrar-club club-nombre (buscar-campeonato campeonatos campeonato-nombre))))))) ; Si coincide, borrar el club.
      )
    ; CONDICIÓN DE PARADA
    ((equal? i (length campeonatos)) acumulado) 
  )
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2.17
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   obtener-club
Objetivo:
   Dado un nombre, obtiene un club de un campeonato específico.
Campos:
   - nombre: Nombre del club a buscar.
   - campeonato: Lista de clubes pertenecientes al campeonato.
Resultado:
   El club encontrado o `#f` si no se encuentra.
Descripción de la solucion:
   Se recorre el campeonato y se devuelve el club que coincida con el nombre proporcionado.
Funciones auxiliares:
   consultar-nombre
|#

(define (obtener-club nombre campeonato)
  (do
        ; VARIABLES ITERATIVAS
        (
         ; Índice que recorre la lista de clubes del campeonato.
         (i 0 (+ i 1)) 
         )
        ; CONDICIÓN DE PARADA
        ((equal? (consultar-nombre (list-ref campeonato i)) nombre) 
         ; Retornar el club encontrado cuando el nombre coincide.
         (list-ref campeonato i))
        ; CUERPO DEL DO: No hay cuerpo del DO.
  )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2.18
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   consultar-clubes-global
Objetivo:
   Consulta e imprime los datos de un club específico en todos los campeonatos.
Campos:
   - club-nombre: Nombre del club a consultar.
   - campeonatos: Lista de campeonatos.
Resultado:
   void
Descripción de la solucion:
   Se recorre la lista de campeonatos y, en cada uno de ellos, se busca el club especificado por su nombre.
Funciones auxiliares:
   consultar-club
|#

(define (consultar-clubes-global club-nombre campeonatos)
  (do
      ; VARIABLES ITERATIVAS
      (
       ; Índice iterador que recorre la lista de campeonatos.
       (i 0 (+ i 1)) 
       )
    ; CONDICIÓN DE PARADA
    ((= i (length campeonatos))) 
    ; CUERPO DEL DO
    (consultar-club club-nombre (list-ref (list-ref campeonatos i) 1)) 
    (newline)
  )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2.19
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   consultar-clubes-ciudad-global
Objetivo:
   Muestra por pantalla los datos de todos los clubes de una ciudad específica en todos los campeonatos.
Campos:
   - ciudad: Nombre de la ciudad a buscar.
   - campeonatos: Lista de campeonatos.
Resultado:
   void
Descripción de la solucion:
   Se recorre la lista de campeonatos y se consulta cada uno por los clubes pertenecientes a la ciudad especificada.
Funciones auxiliares:
   consultar-clubes-ciudad
|#

(define (consultar-clubes-ciudad-global ciudad campeonatos)
  (do
      ; VARIABLES ITERATIVAS
      (
       
       (i 0 (+ i 1))
       )
    ; CONDICIÓN DE PARADA
    ((= i (length campeonatos))) 
    ; CUERPO DEL DO
    (consultar-clubes-ciudad ciudad (list-ref (list-ref campeonatos i) 1)) ; Consultar los clubes en el campeonato actual.
    (newline)
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2.20
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   borrar-campeonato
Objetivo:
   Borra un campeonato de la lista de campeonatos dado su nombre.
Campos:
   - campeonato-nombre: Nombre del campeonato a borrar.
   - campeonatos: Lista de campeonatos.
Resultado:
   Nueva lista de campeonatos sin el campeonato especificado.
Descripción de la solucion:
   Se recorre la lista de campeonatos y se acumulan todos los campeonatos que no coincidan con el nombre proporcionado.
Funciones auxiliares:
   ninguna
|#

(define (borrar-campeonato campeonato-nombre campeonatos)
  (do
      ; VARIABLES ITERATIVAS
      (
       (i 0 (+ i 1))
       (acumulado (list)
                  ; Si el nombre no coincide, agregar el campeonato actual al acumulador.
                  (append acumulado (if (not (equal? campeonato-nombre (list-ref (list-ref campeonatos i) 0)))
                                        (list (list-ref campeonatos i)) ; Mantener el campeonato si no coincide.
                                        (list)))) ; Si coincide, no se agrega al acumulador.
       )
    ; CONDICIÓN DE PARADA
    ((= i (length campeonatos)) acumulado) 
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   gestor-campeonatos
Objetivo:
   Programa que permite gestionar los campeonatos utilizando las
   funcionalidades previamente implementadas.
Campos:
   Ninguno 
Resultado:
   void
Descripción de la solucion:
  Menu con las distintas opciones:
  - Crear un campeonato.
  - Comprobar si un campeonato está vacío.
  - Cargar los clubes de un campeonato desde un fichero.
  - Grabar los clubes de un campeonato en un fichero.
  - Insertar un club en un campeonato.
  - Modificar un club.
  - Borrar un club.
  - Consultar un club.
  - Consultar los clubes de una ciudad.
Funciones auxiliares:
  crear-campeonato, campeonato-vacio?, cargar-campeonato, grabar-campeonato, insertar-club,
  modificar-club, borrar-club, consultar-club, consultar-clubes, consultar-clubes-ciudad
|#

(define (gestor-campeonatos)
  (let menu
    (
     (campeonatos '())
     )
    (let
        (
         (prompt (display "
-----------------------Bienvienido al gestor de campeonatos---------------------------
          ¿Qué desea hacer?
             1. Crear un campeonato
             2. Comprobar si un campeonato está vacío.
             3. Cargar los clubes de un campeonato desde un fichero.
             4. Grabar los clubes de un campeonato en un fichero.
             5. Insertar un club en un campeonato.
             6. Modificar un club.
             7. Borrar un club.
             8. Consultar un club.
             9. Consultar los clubes de una ciudad.
             10. Ver Campeonatos.
             11. Eliminar Campeonato
             0. Salir\n"))
         (opt (read))
         )
        
    (cond
      ; ---------------------------------------------------------------
      ; Crear Campeonato
      ; ---------------------------------------------------------------
      ((equal? opt 1)
       (display "¿Cómo vas a nombrar al campeonato?\n")
       (menu (append campeonatos (list (list (symbol->string (read)) (crear-campeonato))))))
      ; ---------------------------------------------------------------
      ; Comprobar campeonato vacío
      ; ---------------------------------------------------------------
      ((equal? opt 2)
       (display "¿Cómo se llama el campeonato?\n")
       (if (campeonato-vacio? (buscar-campeonato campeonatos (symbol->string (read))))
           (display "El campeonato está vacío.\n")
           (display "El campeonato NO está vacío.\n"))
       (display "Escribe una LETRA para volver al MENU\n")(read)
       (menu campeonatos))
      ; ---------------------------------------------------------------
      ; Cargar campeonato
      ; ---------------------------------------------------------------
      ((equal? opt 3)
       (display "¿Cómo vas a nombrar al campeonato?\n")
       (let cargar()
         (let
           (
            (nombre (symbol->string (read)))
            )
           (cond
             ((not (existe-campeonato? nombre campeonatos))
              (display "¿Cómo se llama el archivo del que cargar los datos?")
              (menu (append campeonatos (list (list nombre (cargar-campeonato (symbol->string (read)))))))
              )
             (else
              (display "Ya existe un campeonato con dicho nombre.\nPrueba con otro nombre diferente:\n")
              (cargar))
             )
         )
         )
       )
      ; ---------------------------------------------------------------
      ; Grabar Campeonato
      ; ---------------------------------------------------------------
      ((equal? opt 4)
       (let grabar ()
         (display "¿Qué campeonato vas a guardar?\n")
         (let
             (
              (nombre (symbol->string (read)))
              )
           (cond ((existe-campeonato? nombre campeonatos)
                  (display "¿Cómo se llama el archivo donde grabar los datos?\n")
                  (grabar-campeonato (symbol->string (read)) (buscar-campeonato campeonatos nombre))
                  (menu campeonatos)
                  )
                 (else
                  (display "No se ha encontrado dicho campeonato.\n")
                  (grabar)))
           )))
      ; ---------------------------------------------------------------
      ; Insertar Club en Campeonato
      ; ---------------------------------------------------------------
      ((equal? opt 5)
       (let insertar ()
         (display "¿Qué campeonato quieres modificar?\n")
         (let
             ( 
              (campeonato-nombre (symbol->string (read)))
              )
             (cond ((existe-campeonato? campeonato-nombre campeonatos)
                    
                    (display "Nombre del club: ")
                    (let*
                        (
                         (nombre (symbol->string (read)))
                         (campeonato (buscar-campeonato campeonatos campeonato-nombre))
                         )
                      
                      (cond ((or (campeonato-vacio? campeonato) (not (existe-club? campeonato nombre)))
                             (display "\nCiudad: ")
                             (let*
                                 (
                                  (ciudad (symbol->string(read)))
                                  (- (display "\nAño: "))
                                  (año (read))
                                  )
                             ;(display (insertar-club-campeonatos campeonatos campeonato-nombre (crear-club nombre ciudad año)))
                             (display "Club insertado con existo.\n")
                             (menu (insertar-club-campeonatos campeonatos campeonato-nombre (crear-club nombre ciudad año)))
                             ;(menu (append (list campeonatos) (list (list campeonato-nombre (insertar-club campeonato (crear-club nombre ciudad año))))))
                             ))
                            (else (display "Ese club ya fue insertado previamente\n")
                                  (insertar))
                        ))
                    )
                   
                   (else (display "No se ha encontrado dicho campeonato.\n")
                         (insertar)))
           )
         )
       )

      ; ---------------------------------------------------------------
      ; Modificar club
      ; ---------------------------------------------------------------
      ((equal? opt 6)
       (let modificar ()
         (display "¿Qué campeonato quieres modificar?\n")
         (let
             ((campeonato-nombre (symbol->string (read))))
           (cond
             ((existe-campeonato? campeonato-nombre campeonatos)
              (display "¿Qué club quieres modificar?\n")
              (let
                  ((club-nombre (symbol->string (read)))
                   (campeonato (buscar-campeonato campeonatos campeonato-nombre)))
                (display "Campeonanto: \n")(consultar-clubes campeonato)(newline)
                  (cond
                    ((or (not (campeonato-vacio? campeonato)) (existe-club? campeonato club-nombre))
                     (display "¿Quieres modificar la ubicación?\n1. Si\n2. No\n")
                     (let*
                         (
                          (opt-mod-c (read))
                          (ciudad (cond
                                    ((equal? opt-mod-c 1)
                                     (display "Ciudad: ")
                                     (symbol->string (read)))
                                    (else
                                     ;(display "nombre: ")(display (string? club-nombre))(display "\ncampeonato: ")(display (string? (cadr (list-ref (list-ref campeonato 0) 0))))
                                     (consultar-ciudad (obtener-club club-nombre campeonato)))
                                    )
                           )
                          (- (display "¿Quieres modificar la fecha?\n1. Si\n2. No\n"))
                          (opt-mod-a (read))
                          (año (cond
                                    ((equal? opt-mod-a 1)
                                     (display "Fecha: ")
                                     (read))
                                    (else
                                     (consultar-año (obtener-club club-nombre campeonato)))
                                    ))
                          )
                       (display "Modificación con éxito\n")
                       (menu (modificar-club-campeonatos campeonatos campeonato-nombre club-nombre ciudad año))
                         )
                     )
                    (else
                     (display "No se ha encontrado dicho club en el campeonato ")(display campeonato-nombre)(display "\n")
                     (menu campeonatos))
                    )
                )
              )
             (else
              (display "No se ha encontrado dicho campeonato.\n")
              (modificar)))
           )
         )
       )
      ; ---------------------------------------------------------------
      ; Eliminar club
      ; ---------------------------------------------------------------
      ((equal? opt 7)
       (let eliminar ()
         (display "¿Qué campeonato quieres modificar?\n")
         (let
             ((campeonato-nombre (symbol->string (read))))
           (cond
             ((existe-campeonato? campeonato-nombre campeonatos)
              (display "¿Qué club quieres eliminar?\n")
              (let
                  ((club-nombre (symbol->string (read)))
                   (campeonato (buscar-campeonato campeonatos campeonato-nombre)))
                (display "Club: \n")(consultar-club club-nombre campeonato)(newline)
                  (cond
                    ((or (not (campeonato-vacio? campeonato)) (existe-club? campeonato club-nombre))
                     (display "¿Estás seguro?\n1. Si\n2. No\n")
                     (let*
                         (
                          (opt-borrar (read))
                          )
                       (cond
                         ((equal? opt-borrar 1)
                          (display "Eliminación con éxito\n")
                          (menu (borrar-club-campeonatos campeonatos campeonato-nombre club-nombre))
                          )
                         (else
                          (menu campeonatos)
                          )
                         )
                       )
                     )
                    (else
                     (display "No se ha encontrado dicho club en el campeonato ")(display campeonato-nombre)(display "\n")
                     (menu campeonatos))
                    )
                )
              )
             (else
              (display "No se ha encontrado dicho campeonato.\n")
              (eliminar)))
           )
         )
       )
      ; ---------------------------------------------------------------
      ; Consultas Club
      ; ---------------------------------------------------------------
      ((equal? opt 8)
       (display "¿Qué club quieres consultar?\n")
       (let
            (
             (club-nombre (symbol->string (read)))
             )         
          (consultar-clubes-global club-nombre campeonatos)
         (display "Escribe una LETRA para volver al MENU\n")(read)
         (menu campeonatos)
         )
       )
      ; ---------------------------------------------------------------
      ; Consultas Clubes Ciudad
      ; ---------------------------------------------------------------
      ((equal? opt 9)
       (display "¿Qué ciudad quieres consultar?\n")
       (let
            (
             (ciudad (symbol->string (read)))
             )         
          (consultar-clubes-ciudad-global ciudad campeonatos)
         (display "Escribe UNA LETRA para volver al MENU\n")(read)
         (menu campeonatos)
         )
       )
      ; ---------------------------------------------------------------
      ; Mostrar Campeonatos
      ; ---------------------------------------------------------------
      ((equal? opt 10)
       (mostrar-campeonatos campeonatos)
       (display "Escribe UNA LETRA para volver al MENU\n")(read)
       (menu campeonatos))
      ; ---------------------------------------------------------------
      ; Eliminar Campeonato
      ; ---------------------------------------------------------------
      ((equal? opt 11)
       (display "¿Qué campeonato deseas eliminar?\n")
       (let suprimir ()
         (let
             (
              (campeonato-nombre (symbol->string (read)))
             )
         (cond
           ((existe-campeonato? campeonato-nombre campeonatos)
            (display "¿Estás seguro que lo quuieres eliminar?\n1. Si\n2. No\n")
            (cond
              ((equal? (read) 1)
               (display "Borrado con éxito.\n")
               (menu (borrar-campeonato campeonato-nombre campeonatos)))
              (else
               (menu campeonatos))
                )
            )
           (else
            (display "No existe ese campamento.\n")
            (menu campeonatos)
            )
           )
         )
       )
      )
     )
    )
  ))

;(gestor-campeonatos)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   Tipo de datos abstracto 'POLIGONO' 
Objetivo:
   Mediante lista de puntos, representamos un polígono.
Campos:
 - puntos
Descripcion:
o Los vértices están unidos por segmentos o lados del polígono.
o El último vértice está unido al primero.
|#

(define poligono (list (list 1 1) (list 1 0)(list 0 0)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   crear-polígono
Objetivo:
   Crear un polígono vacío, es decir, sin puntos.
Campos:
   Ninguno
Resultado:
   Lista vacía que representa un polígono sin vértices.
Descripción de la solucion:
   Se crea una lista vacía para representar un polígono sin vértices.
Funciones auxiliares:
   ninguna
|#

(define (crear-polígono)
  (list))

;(crear-polígono)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4.2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   polígono-nulo?
Objetivo:
   Comprueba si un polígono es nulo (tiene menos de tres vértices).
Campos:
   - polígono: Lista de vértices.
Resultado:
   Booleano indicando si el polígono es nulo.
Descripción de la solucion:
   Un polígono es nulo si tiene menos de tres vértices.
Funciones auxiliares:
   ninguna
|#

(define (polígono-nulo? polígono)
  (< (length polígono) 3))

;(polígono-nulo? (crear-polígono))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4.3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   número-vértices
Objetivo:
   Devuelve el número de vértices del polígono.
Campos:
   - polígono: Lista de vértices.
Resultado:
   Número de vértices del polígono.
Descripción de la solucion:
   Utilizar la función `length` para obtener el número de vértices.
Funciones auxiliares:
   ninguna
|#

(define (número-vértices polígono)
  (length polígono))

;(número-vértices (list (list 1 1) (list 1 0)(list 0 0)(list 0 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4.4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   existe-vértice?
Objetivo:
   Comprueba si un vértice pertenece al polígono.
Campos:
   - vértice: Vértice a comprobar.
   - polígono: Lista de vértices.
Resultado:
   Booleano indicando si el vértice está en el polígono.
Descripción de la solucion:
   Se utiliza la función `member` para comprobar si el vértice está en la lista.
Funciones auxiliares:
   ninguna
|#

(define (existe-vértice? vértice polígono)
  (not (null? (member vértice polígono))))

;(existe-vértice? (list 1 1) (list (list 1 1) (list 1 0)(list 0 0)(list 0 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4.5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   mostrar-vértices
Objetivo:
   Muestra todos los vértices del polígono.
Campos:
   - polígono: Lista de vértices.
Resultado:
   void
Descripción de la solucion:
   Se recorre cada vértice del polígono y se muestra en pantalla.
Funciones auxiliares:
   ninguna
|#

(define (mostrar-vértices polígono)
  ; Recorrer todos los vértices e imprimirlos.
  (for-each (lambda (vértice) (display vértice) (newline)) polígono))

;(mostrar-vértices (list (list 1 1) (list 1 0)(list 0 0)(list 0 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4.6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   insertar-vértice
Objetivo:
   Inserta un vértice en una posición específica del polígono.
Campos:
   - polígono: Lista de vértices.
   - vértice: Coordenadas del vértice a insertar.
   - posición: Posición en la que insertar el vértice.
Resultado:
   Nueva lista de vértices con el vértice insertado.
Descripción de la solucion:
   Divide la lista en dos partes y luego inserta el vértice en la posición indicada.
Funciones auxiliares:
   ninguna
|#

(define (insertar-vértice polígono vértice posición)
  ; Si es nulo, se añade el vértice tal cual
(if (and (= posición 0) (= (length polígono) 0))
   (list vértice)
    ; Si no es nulo
   (if (< posición (length polígono))
       (do
           (
            (i 0 (+ i 1))
            (acumulado (list) (append acumulado
                                 (if (not (= i posición))
                                     (list (list-ref polígono i))
                                     (append (list vértice) (list (list-ref polígono i)))
                                     )
                                 ))
            )
         ((= i (length polígono)) acumulado)
         )
       (cond ((=  posición (length polígono)) (append polígono (list vértice)))
           (else (display "Fuera de rango\n") polígono)
           
           )
       ))
  )

;(insertar-vértice (list (list 1 1) (list 1 0)(list 0 0)(list 0 1)) (list 0.5 2) 3)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4.7
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   borrar-vértice
Objetivo:
   Borra un vértice del polígono.
Campos:
   - polígono: Lista de vértices.
   - posición: Posición del vértice que se desea borrar.
Resultado:
   Nueva lista de vértices sin el vértice indicado.
Descripción de la solucion:
   Se eliminan los elementos de la lista excepto el vértice en la posición indicada.
Funciones auxiliares:
   ninguna
|#

(define (borrar-vértice polígono posición)
  (if (>= posición (length polígono))
    (display "Fuera de rango\n")
  (do
      (
       (i 0 (+ i 1))
       (acumulado (list) (append acumulado
                                 (if (not (= i posición))
                                     (list (list-ref polígono i))
                                     (list)
                                     )
                                 ))
       )
    ((= i (length polígono)) acumulado)
      ))
  )

;(borrar-vértice (list (list 1 1) (list 1 0)(list 0 0)(list 0 1)) 3)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4.8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   grabar-polígono
Objetivo:
   Graba el polígono en un fichero.
Campos:
   - nombre-fichero: Nombre del fichero donde se grabará el polígono.
   - polígono: Lista de vértices.
Resultado:
   void
Descripción de la solucion:
   Utiliza la función `escribir-fichero` para guardar cada vértice del polígono en el fichero.
   Cada vértice se representa como una lista y los elementos se separan por punto y coma.
Funciones auxiliares:
   escribir-fichero
|#

(define (grabar-polígono nombre-fichero polígono)
  (escribir-fichero nombre-fichero polígono))

;(grabar-polígono "p.txt" (list (list 1 1) (list 1 0)(list 0 0)(list 0 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4.9
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   cargar-polígono
Objetivo:
   Lee los vértices de un polígono desde un fichero y los almacena.
Campos:
   - nombre-fichero: Nombre del fichero desde el cual se cargarán los vértices.
Resultado:
   Lista de vértices que conforman el polígono.
Descripción de la solucion:
   Utiliza la función `leer-fichero` para leer los vértices del fichero y convertirlos en una lista.
   Cada línea del fichero se convierte en un vértice del polígono.
Funciones auxiliares:
   leer-fichero
|#

(define (cargar-polígono nombre-fichero)
  (leer-fichero nombre-fichero))

;(cargar-polígono "p.txt")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4.10
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   perímetro
Objetivo:
   Calcula el perímetro del polígono como la suma de las distancias de sus lados.
Campos:
   - polígono: Lista de vértices.
Resultado:
   Número representando el perímetro del polígono.
Descripción de la solucion:
   Se calcula la distancia entre cada par de puntos consecutivos y se suma.
Funciones auxiliares:
   distancia
|#

(define (distancia punto1 punto2)
  (let
      ; VARIABLES LOCALES DEL LET
      (
       (x1 (car punto1)) ; Coordenada x del primer punto.
       (y1 (cadr punto1)) ; Coordenada y del primer punto.
       (x2 (car punto2)) ; Coordenada x del segundo punto.
       (y2 (cadr punto2)) ; Coordenada y del segundo punto.
       )
    ; CALCULAR LA DISTANCIA EUCLIDIANA ENTRE LOS DOS PUNTOS
    (sqrt (+ (expt (- x2 x1) 2) (expt (- y2 y1) 2)))))


(define (perímetro polígono)
  ; Calcular la suma de las distancias entre vértices consecutivos.
  (let loop ((i 0) (suma 0))
    (if (= i (length polígono))
        suma
        (let ((p1 (list-ref polígono i))
              (p2 (list-ref polígono (modulo (+ i 1) (length polígono)))))
          (loop (+ i 1) (+ suma (distancia p1 p2)))))))

;(perímetro (list (list 1 1) (list 1 0)(list 0 0)(list 0 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4.11
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   área
Objetivo:
   Calcula el área del polígono usando el método de Gauss.
Campos:
   - polígono: Lista de vértices.
Resultado:
   Área del polígono.
Descripción de la solucion:
   Se utiliza la fórmula del área por determinantes (método de Gauss).
Funciones auxiliares:
   polígono-nulo?
|#



(define (área polígono)
  (if (polígono-nulo? polígono)
      (error "El polígono no debe ser nulo")
      (let loop ((i 0) (suma 0))
        (if (= i (length polígono))
            (/ (abs suma) 2)
            (let* ((p1 (list-ref polígono i))
                   (p2 (list-ref polígono (modulo (+ i 1) (length polígono))))
                   (x1 (car p1)) (y1 (cadr p1))
                   (x2 (car p2)) (y2 (cadr p2)))
              (loop (+ i 1) (+ suma (* x1 y2) (* (- y1) x2))))))))


;(área (list (list 1 1) (list 1 0)(list 0 0)(list 0 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4.14
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   existe-polígono?
Objetivo:
   Comprueba si un polígono con un nombre dado existe en la lista de polígonos.
Campos:
   - nombre: Nombre del polígono a buscar.
   - poligonos: Lista de polígonos (cada elemento es una lista de la forma '(nombre polígono)).
Resultado:
   Booleano indicando si el polígono existe en la lista.
Descripción de la solucion:
   Se recorre la lista de polígonos buscando el nombre especificado.
   Si el nombre es encontrado, devuelve #t (true). Si se recorre toda la lista y no se encuentra, devuelve #f (false).
Funciones auxiliares:
   ninguna
|#

(define (existe-polígono? nombre poligonos)
  (do
      ; VARIABLES ITERATIVAS DEL DO
      (
       (i 0 (+ i 1)) 
       )
      ; CONDICIÓN DE PARADA
      ((or (= i (length poligonos)) (equal? (car (list-ref poligonos i)) nombre))
       ; RESULTADO DEL DO
       (equal? (car (list-ref poligonos i)) nombre))
    ; CUERPO DEL DO: no hay cuerpo, solo se recorre la lista
      ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4.15
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   buscar-poligono
Objetivo:
   Busca y devuelve un polígono con el nombre especificado en la lista de polígonos.
Campos:
   - nombre: Nombre del polígono a buscar.
   - poligonos: Lista de polígonos (cada elemento es una lista de la forma '(nombre polígono)).
Resultado:
   El polígono encontrado o #f si no se encuentra.
Descripción de la solucion:
   Se recorre la lista de polígonos buscando el nombre especificado.
   Si el nombre es encontrado, devuelve el polígono correspondiente.
Funciones auxiliares:
   ninguna
|#

(define (buscar-poligono poligonos nombre)
  (do
      ; VARIABLES ITERATIVAS DEL DO
      (
       (i 0 (+ i 1)) ; Índice para recorrer la lista de polígonos.
       )
      ; CONDICIÓN DE PARADA
      ((or (= i (length poligonos)) (equal? (car (list-ref poligonos i)) nombre))
       ; RESULTADO DEL DO
       (if (equal? (car (list-ref poligonos i)) nombre)
           (cadr (list-ref poligonos i)) ; Si el nombre coincide, devolver el polígono.
           #f))
    ; CUERPO DEL DO: No hay cuerpo ya que el bucle solo recorre la lista
      ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4.16
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Nombre:
   modificar-poligono
Objetivo:
   Modifica un polígono existente en la lista de polígonos.
Campos:
   - poligonos: Lista de polígonos (cada uno tiene el formato '(nombre polígono)).
   - nombre: Nombre del polígono a modificar.
   - nuevo-poligono: Nuevo valor del polígono modificado.
Resultado:
   Lista de polígonos con el polígono especificado actualizado.
Descripción de la solucion:
   Se recorre la lista de polígonos hasta encontrar el polígono con el nombre especificado,
   luego se reemplaza el polígono con la nueva versión proporcionada.
Funciones auxiliares:
   ninguna
|#

(define (modificar-poligono poligonos nombre nuevo-poligono)
  (do
    ; VARIABLES ITERATIVAS DEL DO
    (
     (i 0 (+ i 1)) 
     (acumulado (list) (append acumulado
                               (if (equal? nombre (car (list-ref poligonos i)))  
                                   (list (list (car (list-ref poligonos i)) nuevo-poligono))
                                   (list (list-ref poligonos i))))) 
     )
    ; CONDICIÓN DE PARADA
    ((= i (length poligonos)) acumulado)
    ; CUERPO DEL DO: No hay cuerpo de DO
   ))


(define (gestor-poligonos)
  (let menu
    ((poligonos '())) 
    (display "Polígonos: ")(display poligonos)(newline)
    (let
        ((prompt (display "
-----------------------Bienvenido al gestor de polígonos---------------------------
          ¿Qué desea hacer?
             1. Crear un polígono nulo
             2. Comprobar si un polígono es nulo
             3. Mostrar un polígono
             4. Comprobar si un vértice pertenece al polígono
             5. Número de vértices del polígono
             6. Insertar un vértice en el polígono
             7. Borrar un vértice del polígono
             8. Cargar un polígono desde un fichero
             9. Grabar un polígono en un fichero
             10. Calcular el perímetro del polígono
             11. Calcular el área del polígono
             0. Salir\n"))
         (opt (read)))
        
      (cond
        ; ---------------------------------------------------------------
        ; Crear un polígono nulo
        ; ---------------------------------------------------------------
        ((equal? opt 1)
         (display "¿Cómo vas a nombrar al polígono?\n")
         (menu (append poligonos (list (list (symbol->string (read)) (crear-polígono))))))
        
        ; ---------------------------------------------------------------
        ; Comprobar si un polígono es nulo
        ; ---------------------------------------------------------------
        ((equal? opt 2)
         (display "¿Qué polígono deseas comprobar si es nulo?\n")
         (let ((nombre (symbol->string (read))))
           (if (existe-polígono? nombre poligonos)
               (if (polígono-nulo? (buscar-poligono poligonos nombre))
                   (display "El polígono es nulo.\n")
                   (display "El polígono NO es nulo.\n"))
               (display "No existe ese polígono.\n")))
         (display "Escribe una LETRA para volver al MENU\n")(read)
         (menu poligonos))

        ; ---------------------------------------------------------------
        ; Mostrar un polígono
        ; ---------------------------------------------------------------
        ((equal? opt 3)
         (display "¿Qué polígono deseas mostrar?\n")
         (let ((nombre (symbol->string (read))))
           (if (existe-polígono? nombre poligonos)
               (mostrar-vértices (buscar-poligono poligonos nombre))
               (display "No existe ese polígono.\n")))
         (display "Escribe una LETRA para volver al MENU\n")(read)
         (menu poligonos))

        ; ---------------------------------------------------------------
        ; Comprobar si un vértice pertenece al polígono
        ; ---------------------------------------------------------------
        ((equal? opt 4)
         (display "¿Qué polígono deseas comprobar?\n")
         (let ((nombre (symbol->string (read))))
           (if (existe-polígono? nombre poligonos)
               (let ((poligono (buscar-poligono poligonos nombre)))
                 (display "Introduce el vértice a comprobar: \nX: ")
                 (let* (
                       (x (read))
                       (- (display "\nY: "))
                       (y (read))
                       )
                   (if (existe-vértice? (list x y) poligono)
                       (display "El vértice pertenece al polígono.\n")
                       (display "El vértice NO pertenece al polígono.\n"))))
               (display "No existe ese polígono.\n")))
         (display "Escribe una LETRA para volver al MENU\n")(read)
         (menu poligonos))

        ; ---------------------------------------------------------------
        ; Número de vértices del polígono
        ; ---------------------------------------------------------------
        ((equal? opt 5)
         (display "¿De qué polígono quieres conocer el número de vértices?\n")
         (let ((nombre (symbol->string (read))))
           (if (existe-polígono? nombre poligonos)
               (display (string-append "Número de vértices: " (number->string (número-vértices (buscar-poligono poligonos nombre))) "\n"))
               (display "No existe ese polígono.\n")))
         (display "Escribe una LETRA para volver al MENU\n")(read)
         (menu poligonos))

        ; ---------------------------------------------------------------
        ; Insertar un vértice en el polígono
        ; ---------------------------------------------------------------
        ((equal? opt 6)
         (display "¿En qué polígono deseas insertar un vértice?\n")
         (let ((nombre (symbol->string (read))))
           (if (existe-polígono? nombre poligonos)
               (let ((poligono (buscar-poligono poligonos nombre)))
                 (display "Introduce el vértice a comprobar: \nX: ")
                 (let* (
                       (x (read))
                       (- (display "\nY: "))
                       (y (read))
                       )
                   (display "¿En qué posición deseas insertar el vértice?\n")
                   (let ((posicion (read)))
                     (menu (modificar-poligono poligonos nombre (insertar-vértice poligono (list x y) posicion))))))
               (display "No existe ese polígono.\n")))
         (display "Escribe una LETRA para volver al MENU\n")(read)
         (menu poligonos))

        ; ---------------------------------------------------------------
        ; Borrar un vértice del polígono
        ; ---------------------------------------------------------------
        ((equal? opt 7)
         (display "¿En qué polígono deseas borrar un vértice?\n")
         (let ((nombre (symbol->string (read))))
           (if (existe-polígono? nombre poligonos)
               (let ((poligono (buscar-poligono poligonos nombre)))
                 (display "¿Qué posición del vértice deseas borrar?\n")
                 (let ((posicion (read)))
                   (menu (modificar-poligono poligonos nombre (borrar-vértice poligono posicion)))))
               (display "No existe ese polígono.\n")))
         (display "Escribe una LETRA para volver al MENU\n")(read)
         (menu poligonos))

        ; ---------------------------------------------------------------
        ; Cargar un polígono desde un fichero
        ; ---------------------------------------------------------------
        ((equal? opt 8)
         (display "¿Cómo se llama el archivo del que deseas cargar el polígono?\n")
         (let ((nombre-fichero (symbol->string (read))))
           (display "¿Cómo vas a nombrar al polígono cargado?\n")
           (let ((nombre (symbol->string (read))))
             (menu (append poligonos (list (list nombre (cargar-polígono nombre-fichero))))))))
        
        ; ---------------------------------------------------------------
        ; Grabar un polígono en un fichero
        ; ---------------------------------------------------------------
        ((equal? opt 9)
         (display "¿Qué polígono deseas grabar en un fichero?\n")
         (let ((nombre (symbol->string (read))))
           (if (existe-polígono? nombre poligonos)
               (let ((poligono (buscar-poligono poligonos nombre)))
                 (display "¿Cómo se llama el archivo donde grabar los datos?\n")
                 (let ((nombre-fichero (symbol->string (read))))
                   (grabar-polígono nombre-fichero poligono)
                   (display "Polígono grabado con éxito.\n")))
               (display "No existe ese polígono.\n")))
         (display "Escribe una LETRA para volver al MENU\n")(read)
         (menu poligonos))

        ; ---------------------------------------------------------------
        ; Calcular el perímetro del polígono
        ; ---------------------------------------------------------------
        ((equal? opt 10)
         (display "¿De qué polígono deseas calcular el perímetro?\n")
         (let ((nombre (symbol->string (read))))
           (if (existe-polígono? nombre poligonos)
               (let ((poligono (buscar-poligono poligonos nombre)))
                 (display (string-append "El perímetro del polígono es: " (number->string (perímetro poligono)) "\n")))
               (display "No existe ese polígono.\n")))
         (display "Escribe una LETRA para volver al MENU\n")(read)
         (menu poligonos))

        ; ---------------------------------------------------------------
        ; Calcular el área del polígono
        ; ---------------------------------------------------------------
        ((equal? opt 11)
         (display "¿De qué polígono deseas calcular el área?\n")
         (let ((nombre (symbol->string (read))))
           (if (existe-polígono? nombre poligonos)
               (let ((poligono (buscar-poligono poligonos nombre)))
                 (display (string-append "El área del polígono es: " (number->string (área poligono)) "\n")))
               (display "No existe ese polígono.\n")))
         (display "Escribe una LETRA para volver al MENU\n")(read)
         (menu poligonos))

        ; ---------------------------------------------------------------
        ; Salir
        ; ---------------------------------------------------------------
        ((equal? opt 0)
         (display "¡Gracias por utilizar el gestor de polígonos!\n")
         (exit))

        ; ---------------------------------------------------------------
        ; Opción inválida
        ; ---------------------------------------------------------------
        (else
         (display "Opción inválida, por favor intente nuevamente.\n")
         (menu poligonos))))))
(gestor-poligonos)
