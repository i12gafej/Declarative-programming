#|
Archivo: figuras.rkt
Descripción: definición de los puntos de algunas figuras
Autor: Javier García Fernández
|#

;;                                    MAPAS DE PUNTOS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              MAPAS DE PUNTOS DE LOS VALORES DE LAS CARTAS

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
   (cons '7 (list
             (list 50 180) (list 50 150) (list 150 150)
             (list 150 180) (list 80 320) (list 50 320)
             (list 120 180)))
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
   ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                              MAPAS DE PUNTOS DE CARTAS Y PATITA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Contorno de la patita
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
; Cuerpo de la carta 
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
; Cuerpo interior carta por detras
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                                MAPAS DE PUNTOS CARATULA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define list-c
  (list
   (make-posn 201 221) (make-posn 206 209) (make-posn 211 192) (make-posn 214 176)
   (make-posn 214 162) (make-posn 205 154) (make-posn 188 150) (make-posn 174 148)
   (make-posn 160 148) (make-posn 145 149) (make-posn 128 155) (make-posn 111 160)
   (make-posn 95 172) (make-posn 87 186) (make-posn 87 187) (make-posn 79 208)
   (make-posn 75 227) (make-posn 75 249) (make-posn 74 282) (make-posn 77 309)
   (make-posn 86 333) (make-posn 96 351) (make-posn 111 360) (make-posn 124 365)
   (make-posn 137 371) (make-posn 156 373) (make-posn 172 373) (make-posn 189 369)
   (make-posn 203 356) (make-posn 211 340) (make-posn 213 332) (make-posn 207 325)
   (make-posn 200 316) (make-posn 193 307) (make-posn 189 304) (make-posn 177 308)
   (make-posn 159 313) (make-posn 147 312) (make-posn 139 305) (make-posn 133 296)
   (make-posn 130 286) (make-posn 126 274) (make-posn 123 261) (make-posn 122 244)
   (make-posn 122 230) (make-posn 129 223) (make-posn 146 219) (make-posn 157 217)
   (make-posn 170 218) (make-posn 182 222) (make-posn 196 225)
  ))

(define list-a
  (list
   (make-posn 279 289) (make-posn 272 288) (make-posn 259 289) (make-posn 248 297)
   (make-posn 237 310) (make-posn 230 329) (make-posn 227 352) (make-posn 228 368)
   (make-posn 241 380) (make-posn 261 380) (make-posn 276 374) (make-posn 286 366)
   (make-posn 289 356) (make-posn 290 366) (make-posn 292 375) (make-posn 298 379)
   (make-posn 309 376) (make-posn 314 368) (make-posn 315 354) (make-posn 313 341)
   (make-posn 310 332) (make-posn 271 336) (make-posn 264 342) (make-posn 256 342)
   (make-posn 253 330) (make-posn 258 321) (make-posn 268 318) (make-posn 270 321)
   (make-posn 272 328) (make-posn 271 333) (make-posn 310 329) (make-posn 305 322)
   (make-posn 301 314) (make-posn 297 309) (make-posn 292 299) (make-posn 282 293)
  ))

(define list-t
  (list
   (make-posn 322 178) (make-posn 325 161) (make-posn 328 142) (make-posn 339 140)
   (make-posn 344 149) (make-posn 347 157) (make-posn 348 173) (make-posn 349 181)
   (make-posn 367 183) (make-posn 386 185) (make-posn 394 195) (make-posn 382 198)
   (make-posn 366 199) (make-posn 353 206) (make-posn 349 222) (make-posn 350 242)
   (make-posn 349 264) (make-posn 348 281) (make-posn 349 293) (make-posn 349 306)
   (make-posn 353 321) (make-posn 352 336) (make-posn 353 347) (make-posn 349 364)
   (make-posn 337 372) (make-posn 329 367) (make-posn 328 348) (make-posn 326 332)
   (make-posn 326 315) (make-posn 326 297) (make-posn 324 277) (make-posn 324 262)
   (make-posn 325 247) (make-posn 325 226) (make-posn 325 215) (make-posn 313 211)
   (make-posn 301 212) (make-posn 292 207) (make-posn 293 192) (make-posn 295 191)
   (make-posn 304 187) (make-posn 310 185)
  ))

(define list-j
  (list
   (make-posn 400 281) (make-posn 392 283) (make-posn 390 294) (make-posn 390 305)
   (make-posn 390 312) (make-posn 389 326) (make-posn 389 330) (make-posn 388 341)
   (make-posn 386 358) (make-posn 385 374) (make-posn 382 388) (make-posn 380 399)
   (make-posn 373 406) (make-posn 364 413) (make-posn 352 419) (make-posn 339 420)
   (make-posn 328 422) (make-posn 320 422) (make-posn 319 429) (make-posn 318 437)
   (make-posn 318 444) (make-posn 323 451) (make-posn 331 453) (make-posn 348 453)
   (make-posn 358 451) (make-posn 367 448) (make-posn 378 441) (make-posn 384 438)
   (make-posn 389 434) (make-posn 402 417) (make-posn 407 407) (make-posn 411 393)
   (make-posn 414 380) (make-posn 417 366) (make-posn 419 352) (make-posn 419 339)
   (make-posn 421 322) (make-posn 421 308) (make-posn 420 301) (make-posn 418 286)
   (make-posn 413 280) (make-posn 406 279) (make-posn 402 279) (make-posn 403 278)
   (make-posn 403 278) (make-posn 402 253) (make-posn 408 252) (make-posn 413 251)
   (make-posn 416 250) (make-posn 421 246) (make-posn 423 243) (make-posn 424 235)
   (make-posn 423 230) (make-posn 419 223) (make-posn 414 221) (make-posn 405 219)
   (make-posn 400 219) (make-posn 398 219) (make-posn 390 223) (make-posn 390 231)
   (make-posn 390 236) (make-posn 392 238) (make-posn 396 247) (make-posn 397 250)
   (make-posn 401 253) (make-posn 401 253) (make-posn 405 253) (make-posn 405 253)
   (make-posn 405 253) (make-posn 407 253) (make-posn 407 253) (make-posn 407 253)
   (make-posn 405 278) (make-posn 405 278) (make-posn 405 278) (make-posn 405 278)
  ))

(define list-a2
  (list
   (make-posn 479 289) (make-posn 472 288) (make-posn 459 289) (make-posn 448 297)
   (make-posn 437 310) (make-posn 430 329) (make-posn 427 352) (make-posn 428 368)
   (make-posn 441 380) (make-posn 461 380) (make-posn 476 374) (make-posn 486 366)
   (make-posn 489 356) (make-posn 490 366) (make-posn 492 375) (make-posn 498 379)
   (make-posn 509 376) (make-posn 514 368) (make-posn 515 354) (make-posn 513 341)
   (make-posn 510 332) (make-posn 471 336) (make-posn 464 342) (make-posn 456 342)
   (make-posn 453 330) (make-posn 458 321) (make-posn 468 318) (make-posn 470 321)
   (make-posn 472 328) (make-posn 471 333) (make-posn 510 329) (make-posn 505 322)
   (make-posn 501 314) (make-posn 497 309) (make-posn 492 299) (make-posn 482 293)
  ))

(define list-c2
  (list
   (make-posn 613 318) (make-posn 615 311) (make-posn 617 304) (make-posn 620 291)
   (make-posn 619 286) (make-posn 606 281) (make-posn 596 278) (make-posn 593 257)
   (make-posn 588 249) (make-posn 581 258) (make-posn 579 266) (make-posn 577 273)
   (make-posn 567 275) (make-posn 563 276) (make-posn 556 267) (make-posn 550 260)
   (make-posn 543 255) (make-posn 545 263) (make-posn 545 273) (make-posn 545 280)
   (make-posn 538 286) (make-posn 530 291) (make-posn 526 302) (make-posn 525 317)
   (make-posn 527 340) (make-posn 529 355) (make-posn 535 367) (make-posn 544 371)
   (make-posn 558 373) (make-posn 567 374) (make-posn 578 374) (make-posn 588 375)
   (make-posn 598 373) (make-posn 602 366) (make-posn 597 360) (make-posn 588 356)
   (make-posn 572 355) (make-posn 563 353) (make-posn 555 344) (make-posn 555 333)
   (make-posn 558 321) (make-posn 565 311) (make-posn 576 306) (make-posn 587 311)
   (make-posn 596 313) (make-posn 602 316)
  ))

(define list-k
  (list
   (make-posn 638 388) (make-posn 651 388) (make-posn 662 384) (make-posn 677 387)
   (make-posn 684 381) (make-posn 686 359) (make-posn 683 341) (make-posn 683 320)
   (make-posn 683 300) (make-posn 699 313) (make-posn 714 338) (make-posn 736 364)
   (make-posn 752 378) (make-posn 768 377) (make-posn 766 363) (make-posn 757 346)
   (make-posn 727 302) (make-posn 718 287) (make-posn 706 263) (make-posn 717 233)
   (make-posn 735 215) (make-posn 748 196) (make-posn 760 182) (make-posn 756 168)
   (make-posn 745 157) (make-posn 729 182) (make-posn 713 211) (make-posn 691 240)
   (make-posn 675 242) (make-posn 659 136) (make-posn 627 134) (make-posn 628 225)
   (make-posn 632 264) (make-posn 636 355)
  ))


