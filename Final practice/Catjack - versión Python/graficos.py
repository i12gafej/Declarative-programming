import pygame
import math
import json
import time
from macros import *


'''
Cosas que llevar a cabo:
    Separación en clases de cada objeto.
    Separación en archivos cada cosa
    Dependencia con variables globales no mola nada
    programación orientada a objetos
    herencia
'''
# Función para calcular la distancia entre dos puntos
def D2(x1, y1, x2, y2):
    return math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2)

# Función para escalar y desplazar las coordenadas
def escalar_y_desplazar(x, y, centrox, centroy, escala, centroide_x, centroide_y):
    # Desplazar las coordenadas hacia el nuevo centro y aplicar la escala
    nuevo_x = centrox + (x - centroide_x) * escala
    nuevo_y = centroy + (y - centroide_y) * escala
    return (nuevo_x, nuevo_y)

def punto_medio(x1, y1, x2, y2):
    return ((x1 + x2) / 2, (y1 + y2) / 2)

# Función para calcular la distancia entre dos puntos
def distancia(x1, y1, x2, y2):
    return math.sqrt((x2 - x1)**2 + (y2 - y1)**2)

# Función para calcular los puntos de tangencia
def tangentes(xc1, yc1, x_tangente, y_tangente, radio):
    p_m = punto_medio(xc1, yc1, x_tangente, y_tangente)
    d = distancia(p_m[0], p_m[1], xc1, yc1)
    a = (radio**2) / (2 * d)
    h = math.sqrt(radio**2 - a**2)
    x2 = xc1 + a * (p_m[0] - xc1) / d
    y2 = yc1 + a * (p_m[1] - yc1) / d
    x3_1 = x2 + h * (p_m[1] - yc1) / d
    y3_1 = y2 - h * (p_m[0] - xc1) / d
    x3_2 = x2 - h * (p_m[1] - yc1) / d
    y3_2 = y2 + h * (p_m[0] - xc1) / d
    return [(x3_1, y3_1), (x3_2, y3_2)]

def calcular_centroid(x1, y1, x2, y2, x3, y3):
    cx = (x1 + x2 + x3) / 3
    cy = (y1 + y2 + y3) / 3
    return (cx, cy)

def generar_espiral(centro, tamaño, progresion=5, direccion='abajo',sentido='antihorario', orden='fuera-dentro', cantidad_puntos = 150):
    """
    Genera los puntos de una espiral según los parámetros dados.
    
    :param centro: El centro de la espiral (x, y)
    :param tamaño: El tamaño del rectángulo que contiene la espiral (ancho, alto)
    :param progresion: Factor que controla la amplitud de la espiral
    :param direccion: Dirección de la espiral ('abajo', 'izquierda', 'derecha', 'arriba')
    :param sentido: Sentido de la espiral ('horario' o 'antihorario')
    :param orden: Orden de impresión ('dentro-afuera' o 'fuera-dentro')
    :param cantidad_puntos: Número de puntos que formarán la espiral
    :return: Lista de puntos que forman la espiral
    """
    # Inicializamos los puntos de la espiral
    puntos = []

    # Extraer las dimensiones del tamaño
    ancho, alto = tamaño
    
    # Parámetros de inicio
    x_centro, y_centro = centro
    angulo_inicial = 0
    incremento_radio = progresion  # Esto controla cómo se expande la espiral
    
    # Calcular el ángulo y el radio para cada punto
    for i in range(cantidad_puntos):
        # El radio aumenta a medida que aumenta el índice
        radio = incremento_radio * i
        
        # Calcular el ángulo, dependiendo del sentido de la espiral
        if sentido == 'horario':
            angulo = angulo_inicial - (i * math.pi / 20)  # Reduciendo el ángulo para horario
        else:
            angulo = angulo_inicial + (i * math.pi / 20)  # Aumentando el ángulo para antihorario
        
        # Cálculo de las coordenadas
        x = x_centro + radio * math.cos(angulo)
        y = y_centro + radio * math.sin(angulo)
        
         # Asegurarnos de que los puntos se quedan dentro de los límites del rectángulo
        if x < x_centro - ancho / 2 or x > x_centro + ancho / 2:
            continue  # Si el punto está fuera del ancho, no lo añadimos
        if y < y_centro - alto / 2 or y > y_centro + alto / 2:
            continue  # Si el punto está fuera de la altura, no lo añadimos
        
        # Agregar el punto a la lista
        puntos.append((x, y))
    
    # Invertir los puntos si es necesario (para dibujar de dentro hacia fuera o al revés)
    if orden == 'fuera-dentro':
        puntos = puntos[::-1]
    
    # Dependiendo del origen, reorientar los puntos
    if direccion == 'abajo':
        puntos = [(x, y_centro + (y - y_centro)) for x, y in puntos]
    elif direccion == 'izquierda':
        puntos = [(x_centro + (x - x_centro), y) for x, y in puntos]
    elif direccion == 'derecha':
        puntos = [(x_centro - (x - x_centro), y) for x, y in puntos]
    elif direccion == 'arriba':
        puntos = [(x, y_centro - (y - y_centro)) for x, y in puntos]

    return puntos


# Función para dibujar el corazón
def dibujar_corazon(pantalla, centrox, centroy, escala):
    centroide_x = 315
    centroide_y = 385
    xc1, yc1 = 350, 350
    xc2, yc2 = 280, 350
    xv, yv = 315, 455

    xc1_yc1 = escalar_y_desplazar(xc1, yc1, centrox, centroy, escala, centroide_x, centroide_y)
    xc2_yc2 = escalar_y_desplazar(xc2, yc2, centrox, centroy, escala, centroide_x, centroide_y)
    xv_yv = escalar_y_desplazar(xv, yv, centrox, centroy, escala, centroide_x, centroide_y)

    xc1, yc1 = xc1_yc1
    xc2, yc2 = xc2_yc2
    xv, yv = xv_yv

    radio = escala * 50

    # Dibujar los círculos (lóbulos del corazón)
    pygame.draw.circle(pantalla, ROJO, (int(xc1), int(yc1)), int(radio))
    pygame.draw.circle(pantalla, ROJO, (int(xc2), int(yc2)), int(radio))

    # Calcular los puntos de tangencia
    puntos_tangencia1 = tangentes(xc1, yc1, xv, yv, radio)
    puntos_tangencia2 = tangentes(xc2, yc2, xv, yv, radio)


    # Dibujar el triángulo de tangencia
    puntos_triangulo = [
        (xv, yv),
        puntos_tangencia1[0],
        puntos_tangencia2[1]
    ]
    
    pygame.draw.polygon(pantalla, ROJO, puntos_triangulo)


# Función para dibujar el trébol
def dibujar_trebol(pantalla, centrox, centroy, escala):
    # Definir los puntos originales de los círculos y el triángulo
    xc1, yc1 = 330, 350
    xc2, yc2 = 250, 350
    xc3, yc3 = 290, 270

    xv1, yv1 = 290, 379
    xv2, yv2 = 250, 425
    xv3, yv3 = 330, 425

    # Calcular el centroide del trébol
    centroide = calcular_centroid(xc1, yc1, xc2, yc2, xc3, yc3)
    centroide_x, centroide_y = centroide

    # Escalar y desplazar los centros de los círculos
    xc1_yc1 = escalar_y_desplazar(xc1, yc1, centrox, centroy, escala, centroide_x, centroide_y)
    xc2_yc2 = escalar_y_desplazar(xc2, yc2, centrox, centroy, escala, centroide_x, centroide_y)
    xc3_yc3 = escalar_y_desplazar(xc3, yc3, centrox, centroy, escala, centroide_x, centroide_y)

    # Escalar y desplazar los vértices del triángulo
    xv1_yv1 = escalar_y_desplazar(xv1, yv1, centrox, centroy, escala, centroide_x, centroide_y)
    xv2_yv2 = escalar_y_desplazar(xv2, yv2, centrox, centroy, escala, centroide_x, centroide_y)
    xv3_yv3 = escalar_y_desplazar(xv3, yv3, centrox, centroy, escala, centroide_x, centroide_y)

    # Extraer las coordenadas escaladas
    xc1, yc1 = xc1_yc1
    xc2, yc2 = xc2_yc2
    xc3, yc3 = xc3_yc3

    xv1, yv1 = xv1_yv1
    xv2, yv2 = xv2_yv2
    xv3, yv3 = xv3_yv3

    radio = escala * 50  # Radio de los círculos

    # Dibujar los círculos del trébol
    pygame.draw.circle(pantalla, NEGRO, (int(xc1), int(yc1)), int(radio))
    pygame.draw.circle(pantalla, NEGRO, (int(xc2), int(yc2)), int(radio))
    pygame.draw.circle(pantalla, NEGRO, (int(xc3), int(yc3)), int(radio))

    # Dibujar el triángulo (con los vértices ya desplazados y escalados)
    puntos_triangulo = [
        (xv1, yv1),
        (xv2, yv2),
        (xv3, yv3)
    ]
    
    pygame.draw.polygon(pantalla, NEGRO, puntos_triangulo)

# Función para dibujar la pica
def dibujar_pica(pantalla, centrox, centroy, escala):
    # Definir los puntos originales de los círculos y el vértice superior
    xc1, yc1 = 250, 350
    xc2, yc2 = 330, 350
    xv, yv = 290, 230  # Vértice superior de la pica

    # Calcular el centroide de la pica (entre los dos círculos)
    centroide_x, centroide_y = (xc1 + xc2) / 2, (yc1 + yc2) / 2

    # Escalar y desplazar los centros de los círculos
    xc1_yc1 = escalar_y_desplazar(xc1, yc1, centrox, centroy, escala, centroide_x, centroide_y)
    xc2_yc2 = escalar_y_desplazar(xc2, yc2, centrox, centroy, escala, centroide_x, centroide_y)

    # Escalar y desplazar el vértice superior
    xv_yv = escalar_y_desplazar(xv, yv, centrox, centroy, escala, centroide_x, centroide_y)

    # Extraer las coordenadas escaladas
    xc1, yc1 = xc1_yc1
    xc2, yc2 = xc2_yc2
    xv, yv = xv_yv

    radio = escala * 50  # Radio de los círculos

    # Dibujar los dos círculos de la pica
    pygame.draw.circle(pantalla, NEGRO, (int(xc1), int(yc1)), int(radio))
    pygame.draw.circle(pantalla, NEGRO, (int(xc2), int(yc2)), int(radio))

    # Calcular las tangentes entre los círculos y el vértice
    der = tangentes(xc1, yc1, xv, yv, radio)
    izq = tangentes(xc2, yc2, xv, yv, radio)

    # Puntos de las tangentes
    x3_1, y3_1 = der[0]
    x3_2, y3_2 = izq[1]

    # Dibujar el polígono superior que conecta las tangentes con el vértice
    puntos_triangulo_superior = [(x3_1, y3_1), (x3_2, y3_2), (xv, yv)]
    pygame.draw.polygon(pantalla, NEGRO, puntos_triangulo_superior)

    # Dibujar el polígono inferior de la pica
    xv1_yv1 = escalar_y_desplazar(290, 379, centrox, centroy, escala, centroide_x, centroide_y)
    xv2_yv2 = escalar_y_desplazar(250, 425, centrox, centroy, escala, centroide_x, centroide_y)
    xv3_yv3 = escalar_y_desplazar(330, 425, centrox, centroy, escala, centroide_x, centroide_y)

    xv1, yv1 = xv1_yv1
    xv2, yv2 = xv2_yv2
    xv3, yv3 = xv3_yv3

    # Dibujar el polígono inferior de la pica
    puntos_triangulo_inferior = [(xv1, yv1), (xv2, yv2), (xv3, yv3)]
    pygame.draw.polygon(pantalla, NEGRO, puntos_triangulo_inferior)

# Función para dibujar el diamante
def dibujar_diamante(pantalla, centrox, centroy, escala):
    # Centroide original del diamante
    centroide_x = 300
    centroide_y = 200

    # Definir los puntos del diamante
    p1 = escalar_y_desplazar(240, 200, centrox, centroy, escala, centroide_x, centroide_y)
    p2 = escalar_y_desplazar(300, 100, centrox, centroy, escala, centroide_x, centroide_y)
    p3 = escalar_y_desplazar(360, 200, centrox, centroy, escala, centroide_x, centroide_y)
    p4 = escalar_y_desplazar(300, 300, centrox, centroy, escala, centroide_x, centroide_y)

    # Extraer las coordenadas escaladas
    x1, y1 = p1
    x2, y2 = p2
    x3, y3 = p3
    x4, y4 = p4

    # Dibujar el diamante
    puntos_diamante = [(x1, y1), (x2, y2), (x3, y3), (x4, y4)]
    pygame.draw.polygon(pantalla, ROJO, puntos_diamante)

def dibujar_corazon(pantalla, centrox, centroy, escala):
    centroide_x = 315
    centroide_y = 385
    xc1, yc1 = 350, 350
    xc2, yc2 = 280, 350
    xv, yv = 315, 455

    xc1_yc1 = escalar_y_desplazar(xc1, yc1, centrox, centroy, escala, centroide_x, centroide_y)
    xc2_yc2 = escalar_y_desplazar(xc2, yc2, centrox, centroy, escala, centroide_x, centroide_y)
    xv_yv = escalar_y_desplazar(xv, yv, centrox, centroy, escala, centroide_x, centroide_y)

    xc1, yc1 = xc1_yc1
    xc2, yc2 = xc2_yc2
    xv, yv = xv_yv

    radio = escala * 50

    # Dibujar los círculos (lóbulos del corazón)
    pygame.draw.circle(pantalla, ROJO, (int(xc1), int(yc1)), int(radio))
    pygame.draw.circle(pantalla, ROJO, (int(xc2), int(yc2)), int(radio))

    # Calcular los puntos de tangencia
    puntos_tangencia1 = tangentes(xc1, yc1, xv, yv, radio)
    puntos_tangencia2 = tangentes(xc2, yc2, xv, yv, radio)


    # Dibujar el triángulo de tangencia
    puntos_triangulo = [
        (xv, yv),
        puntos_tangencia1[0],
        puntos_tangencia2[1]
    ]
    
    pygame.draw.polygon(pantalla, ROJO, puntos_triangulo)

# Función para dibujar la lista de puntos de una carta
def dibujar_lista(pantalla, lista_asociacion, letra, coordx, coordy, escala, color):
    # Obtener la lista de puntos de la letra en la lista de asociación
    puntos_originales = lista_asociacion.get(str(letra), [])

    # Inicializamos una lista vacía para los puntos transformados
    puntos_transformados = []

    # Iterar sobre los puntos originales
    for p in puntos_originales:
        x, y = p  # Obtenemos la coordenada (x, y)
        
        # Aplicamos la transformación de escalado y desplazamiento
        punto_transformado = escalar_y_desplazar(x, y, coordx, coordy, escala, 100, 85)
        
        # Convertimos el punto transformado en una tupla (x, y) y lo agregamos a la lista
        puntos_transformados.append(punto_transformado)
    
    # Dibujar el polígono con los puntos transformados
    pygame.draw.polygon(pantalla, color, puntos_transformados)

# Función para dibujar el cuerpo de la carta con contorno pasado como argumento
def dibujar_carta(pantalla, cx, cy, escala, palo, valor, lista_asociacion, list_cuerpo):
    # Variables de escala y color para el palo
    escala_objetos = escala * 0.75
    color = ROJO if palo in ['corazon', 'diamante'] else NEGRO

    desplazamiento_numero_x, desplazamiento_palo_x = cx, cx
    desplazamiento_numero_y = cy + escala * (350 - 480)
    desplazamiento_palo_y = cy + escala * (350 - 530)

    # Dibujar el contorno de la carta
     # Transformar cada punto en list-cuerpo usando transformar-coordenadas
    list_cuerpo_transformado = [escalar_y_desplazar(p[0], p[1], cx, cy,escala, 400, 300) for p in list_cuerpo]
    pygame.draw.polygon(pantalla, BLANCO, list_cuerpo_transformado)
    pygame.draw.polygon(pantalla, NEGRO, list_cuerpo_transformado, 2)

    # Dibujar el número de la carta
    dibujar_lista(pantalla, lista_asociacion, valor, desplazamiento_numero_x, desplazamiento_numero_y, escala_objetos, color)

    # Dibujar el símbolo del palo
    if palo == 'corazon':
        dibujar_corazon(pantalla, desplazamiento_palo_x, desplazamiento_palo_y, escala_objetos)
    elif palo == 'pica':
        dibujar_pica(pantalla, desplazamiento_palo_x, desplazamiento_palo_y, escala_objetos)
    elif palo == 'trebol':
        dibujar_trebol(pantalla, desplazamiento_palo_x, desplazamiento_palo_y, escala_objetos)
    elif palo == 'diamante':
        dibujar_diamante(pantalla, desplazamiento_palo_x, desplazamiento_palo_y, escala_objetos)
    else:
        raise ValueError("Palo no válido")

# Función para dibujar la carta por detrás
def dibujar_carta_por_detras(pantalla, cx, cy, escala, contorno_carta, contorno_patita):
    
    # Escala de los objetos
    escala_objetos = escala * 1.2
    escala2 = escala * 0.91

    # Transformar los puntos del cuerpo y el interior
    contorno_carta_transformado = [escalar_y_desplazar(p[0], p[1], cx, cy,escala, 400, 300) for p in contorno_carta]
    contorno_patita_transformado = [escalar_y_desplazar(p[0], p[1], cx, cy,escala2, 400, 308) for p in contorno_carta]

    # Dibujar el contorno de la carta
    pygame.draw.polygon(pantalla, BLANCO, contorno_carta_transformado)
    pygame.draw.polygon(pantalla, NEGRO, contorno_carta_transformado, 2)

    # Dibujar el interior de la carta
    pygame.draw.polygon(pantalla, MOROSA, contorno_patita_transformado)

    # Dibujar la patita del gato (simulación con un polígono)
    patita_puntos = [escalar_y_desplazar(p[0], p[1], cx, cy,escala_objetos, 99, 180) for p in contorno_patita]
    pygame.draw.polygon(pantalla, BLANCO, patita_puntos)

# Función para dibujar la patita del gato
def dibujar_patita(pantalla, centrox, centroy, escala, puntos_patita):
    # Parte externa de la pata
    puntos_externo = puntos_patita["exterior"]
    puntos_externo_transformados = [
        (escalar_y_desplazar(x, y, centrox, centroy, escala, 100, 100)) 
        for (x, y) in puntos_externo
    ]
    pygame.draw.polygon(pantalla, NEGRO, puntos_externo_transformados)

    # Parte interna de la pata
    puntos_interno = puntos_patita["interior"]
    puntos_interno_transformados = [
        (escalar_y_desplazar(x, y, centrox, centroy, escala, 100, 100)) 
        for (x, y) in puntos_interno
    ]
    pygame.draw.polygon(pantalla, BEISH, puntos_interno_transformados)

# Función para dibujar los círculos de la ficha
def dibujar_ficha(pantalla, centrox, centroy, escala, color):
    # Dibujar círculos concéntricos de la ficha
    pygame.draw.circle(pantalla, color, (int(centrox), int(centroy)), int(escala * 50))  # Círculo externo
    pygame.draw.circle(pantalla, BLANCO, (int(centrox), int(centroy)), int(escala * 44))  # Círculo medio blanco
    pygame.draw.circle(pantalla, color, (int(centrox), int(centroy)), int(escala * 30))  # Círculo interno

    # Dibujar triángulos escalados (Usando los mismos puntos transformados para cada uno)
    # Triángulo 1
    p1 = escalar_y_desplazar(109, 72.5, centrox, centroy, escala, 100, 100)
    p2 = escalar_y_desplazar(114.6, 56, centrox, centroy, escala, 100, 100)
    p3 = escalar_y_desplazar(129.5, 66, centrox, centroy, escala, 100, 100)
    p4 = escalar_y_desplazar(119, 78, centrox, centroy, escala, 100, 100)
    pygame.draw.polygon(pantalla, color, [p1, p2, p3, p4])

    # Triángulo 2
    p1 = escalar_y_desplazar(128.4, 94, centrox, centroy, escala, 100, 100)
    p2 = escalar_y_desplazar(144, 91, centrox, centroy, escala, 100, 100)
    p3 = escalar_y_desplazar(144, 109, centrox, centroy, escala, 100, 100)
    p4 = escalar_y_desplazar(128.4, 106, centrox, centroy, escala, 100, 100)
    pygame.draw.polygon(pantalla, color, [p1, p2, p3, p4])

    # Triángulo 3
    p1 = escalar_y_desplazar(119, 122, centrox, centroy, escala, 100, 100)
    p2 = escalar_y_desplazar(129, 134, centrox, centroy, escala, 100, 100)
    p3 = escalar_y_desplazar(114, 142, centrox, centroy, escala, 100, 100)
    p4 = escalar_y_desplazar(109, 127, centrox, centroy, escala, 100, 100)
    pygame.draw.polygon(pantalla, color, [p1, p2, p3, p4])

    # Triángulo 4
    p1 = escalar_y_desplazar(90.5, 127, centrox, centroy, escala, 100, 100)
    p2 = escalar_y_desplazar(85, 142.5, centrox, centroy, escala, 100, 100)
    p3 = escalar_y_desplazar(70.5, 134, centrox, centroy, escala, 100, 100)
    p4 = escalar_y_desplazar(81, 122, centrox, centroy, escala, 100, 100)
    pygame.draw.polygon(pantalla, color, [p1, p2, p3, p4])

    # Triángulo 5
    p1 = escalar_y_desplazar(71.6, 106, centrox, centroy, escala, 100, 100)
    p2 = escalar_y_desplazar(56, 109, centrox, centroy, escala, 100, 100)
    p3 = escalar_y_desplazar(56, 91, centrox, centroy, escala, 100, 100)
    p4 = escalar_y_desplazar(71.6, 94, centrox, centroy, escala, 100, 100)
    pygame.draw.polygon(pantalla, color, [p1, p2, p3, p4])

    # Triángulo 6
    p1 = escalar_y_desplazar(81, 78, centrox, centroy, escala, 100, 100)
    p2 = escalar_y_desplazar(70.6, 65.9, centrox, centroy, escala, 100, 100)
    p3 = escalar_y_desplazar(86, 57, centrox, centroy, escala, 100, 100)
    p4 = escalar_y_desplazar(91, 72.6, centrox, centroy, escala, 100, 100)
    pygame.draw.polygon(pantalla, color, [p1, p2, p3, p4])


# Función para dibujar una letra
def dibujar_letra(pantalla, letra, x, y, escala, color):
    if letra == " ":
        return None
    puntos = letras.get(letra)  # Obtiene los puntos de la letra desde el JSON
    if puntos:
        # Aplicamos la transformación de escala y desplazamiento
        puntos_transformados = [escalar_y_desplazar(px, py, x, y, escala, 0, 0) for px, py in puntos]
        # Dibujar la letra
        pygame.draw.polygon(pantalla, color, puntos_transformados, 2)
    else:
        print(f"Carácter no encontrado: {letra}")

# Función para dibujar un texto completo
def dibujar_texto(pantalla, texto, x, y, escala, color):
    for letra in texto:
        dibujar_letra(pantalla, letra, x, y, escala, color)
        x += escala * 2  # Ajusta el espacio entre las letras

# Función para dibujar el campo de entrada
def input_field(superficie_virtual,ventana, x, y, ancho, alto):
    # Asegurarse que el alto sea al menos 40
    alto = max(alto, 40)

    # Posición de las letras
    letra_pos = (y // 2) - 10

    # Crear los cuadros de texto (contorno y fondo blanco)
    pygame.draw.polygon(superficie_virtual, NEGRO, [
        (x, y), 
        (x + ancho, y), 
        (x + ancho, y + alto), 
        (x, y + alto)
    ])  # Contorno negro

    pygame.draw.polygon(superficie_virtual, BLANCO, [
        (x + 5, y + 5), 
        (x + ancho - 5, y + 5), 
        (x + ancho - 5, y + alto - 5), 
        (x + 5, y + alto - 5)
    ])  # Fondo blanco

    

    pygame.display.update()
    # Capturar texto
    texto = ""
    input_active = True
    while input_active:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
            elif event.type == pygame.KEYDOWN:
                if event.key == pygame.K_RETURN:  # Salir cuando se presiona Enter
                    return texto
                elif event.key == pygame.K_BACKSPACE:  # Eliminar el último carácter
                    texto = texto[:-1]
                elif len(texto) < 10:  # Limitar a 10 caracteres
                    if event.unicode.isalnum() or event.key == pygame.K_SPACE:  # Permitir letras y números
                        texto += event.unicode.upper()

        
        # Volver a dibujar el campo de entrada y el texto
        pygame.draw.polygon(superficie_virtual, NEGRO, [
            (x, y), 
            (x + ancho, y), 
            (x + ancho, y + alto), 
            (x, y + alto)
        ])  # Contorno negro
        pygame.draw.polygon(superficie_virtual, BLANCO, [
            (x + 5, y + 5), 
            (x + ancho - 5, y + 5), 
            (x + ancho - 5, y + alto - 5), 
            (x + 5, y + alto - 5)
        ])  # Fondo blanco

        # Dibujar el texto dentro del campo
        dibujar_texto(superficie_virtual, texto, x + 10, y + letra_pos - 107, 10, NEGRO)
        redimension(superficie_virtual, ventana, ventana.get_size())
        # Actualizar la pantalla
        pygame.display.update()

# Función para dibujar el contador del jugador
def contador_jugador(pantalla, valor, tipo):
    # Dibujar el fondo del contador (rectángulo gris)
    pygame.draw.polygon(pantalla, CONTADOR, [
        (0, 500), (220, 500), (220, 600), (0, 600)
    ])

    # Dibujar el recuadro interior blanco
    pygame.draw.polygon(pantalla, BLANCO, [
        (10, 530), (210, 530), (210, 590), (10, 590)
    ])

    # Dibujar el borde negro del recuadro interior
    pygame.draw.polygon(pantalla, NEGRO, [
        (15, 535), (205, 535), (205, 585), (15, 585)
    ])

    # Dibujar el texto según el tipo
    if tipo == 'fichas':
        dibujar_texto(pantalla, "FICHAS", 60, 507, 8, FONDO)
    else:
        dibujar_texto(pantalla, "GANADAS", 60, 507, 8, FONDO)

    # Dibujar el valor del contador
    dibujar_texto(pantalla, str(valor), 25, 550, 8, BLANCO)

# Función para dibujar el contador del crupier
def contador_crupier(pantalla, fichas):
    # Dibujar el texto "BANCA"
    dibujar_texto(pantalla, "BANCA", 350, 5, 10, NEGRO)

    # Dibujar el fondo gris del contador (rectángulo)
    pygame.draw.polygon(pantalla, CONTADOR2, [
        (290, 30), (510, 30), (510, 100), (290, 100)
    ])

    # Dibujar el recuadro blanco dentro del contador
    pygame.draw.polygon(pantalla, BLANCO, [
        (295, 35), (505, 35), (505, 95), (295, 95)
    ])

    # Dibujar el borde negro interior
    pygame.draw.polygon(pantalla, NEGRO, [
        (300, 40), (500, 40), (500, 90), (300, 90)
    ])

    # Dibujar el valor de fichas
    dibujar_texto(pantalla, str(fichas), 305, 55, 10, BLANCO)

def mesa(pantalla, valor_crupier, valor_jugador, tipo):
    # Tapete
    pygame.draw.polygon(pantalla, FONDO, [
        (0, 0), (800, 0), (800, 600), (0, 600)
    ])
    pygame.draw.polygon(pantalla, TAPETE, [
        (0, 50), (800, 50), (800, 600), (0, 600)
    ])
    
    # Línea tapete
    pygame.draw.ellipse(pantalla, ORO, pygame.Rect(0, 50, 800, 100), 2)
    pygame.draw.polygon(pantalla, TAPETE, [
        (0, 50), (800, 50), (800, 100), (0, 100)
    ])
    
    # Hueco arriba
    pygame.draw.ellipse(pantalla, FONDO, pygame.Rect(0, 0, 800, 100))

    # Cuadrante de operaciones
    pygame.draw.polygon(pantalla, FONDO, [
        (0, 500), (800, 500), (800, 600), (0, 600)
    ])
    contador_jugador(pantalla, valor_jugador, tipo)

    # Botones de juego
    if tipo == 'fichas':
        pygame.draw.polygon(pantalla, NARANJA, [
            (240, 520), (500, 520), (500, 580), (240, 580)
        ])
        dibujar_texto(pantalla, "DOBLAR", 250, 530, 20, FONDO)
    
    pygame.draw.polygon(pantalla, MAS, [
        (520, 520), (600, 520), (600, 580), (520, 580)
    ])
    dibujar_texto(pantalla, "+", 545, 533, 20, MAS_OPP)

    pygame.draw.polygon(pantalla, MENOS, [
        (620, 520), (700, 520), (700, 580), (620, 580)
    ])
    dibujar_texto(pantalla, "-", 645, 530, 20, MAS_OPP)

    # Cuadrante fichas crupier
    contador_crupier(pantalla, valor_crupier)

    # Dibujar texto "CRUPIER" y "JUGADOR"
    dibujar_texto(pantalla, "CRUPIER", 60, 200, 5, BLANCO)
    dibujar_texto(pantalla, "JUGADOR", 60, 350, 5, BLANCO)

def redimension(superficie_virtual, ventana, nueva_resolucion):
    # Obtener las dimensiones de la nueva resolución
    ancho_ventana, alto_ventana = nueva_resolucion
    
    # Redimensionar la superficie virtual para que se ajuste a la nueva resolución de la ventana
    superficie_redimensionada = pygame.transform.scale(superficie_virtual, (ancho_ventana, alto_ventana))
    
    # Dibujar la superficie redimensionada en la ventana
    ventana.blit(superficie_redimensionada, (0, 0))

# Función de animación general
def animacion(superficie_virtual, ventana,  resolucion,elementos, punto_inicio, punto_final, puntos_intermedios, duracion, frames):
    # Dividir la duración en frames para calcular el tiempo entre frames
    tiempo_por_frame = duracion / frames
    
    # Combina los puntos de inicio, intermedios y final en una lista completa de puntos
    if punto_inicio is None:
        punto_inicio = []
    else:
        punto_inicio = [punto_inicio]
    if punto_final is None:
        punto_final = []
    else:
        punto_final = [punto_final]
    
    puntos_trayectoria = punto_inicio + puntos_intermedios + punto_final
    
    # Segmentos
    segmentos = len(puntos_trayectoria) - 1

    # Calculamos cuántos frames se le asignan a cada segmento
    frames_por_segmento = frames // segmentos

    # Bucle principal de la animación
    for segmento in range(segmentos):
        punto_inicial = puntos_trayectoria[segmento]
        punto_final = puntos_trayectoria[segmento + 1]

        # Calcular el desplazamiento en cada eje para este segmento
        dx_total = punto_final[0] - punto_inicial[0]
        dy_total = punto_final[1] - punto_inicial[1]
        
        # Calcular el número de pasos en cada eje según la cantidad de frames para este segmento
        dx = dx_total / frames_por_segmento
        dy = dy_total / frames_por_segmento

        # Animación dentro de este segmento
        for frame in range(frames_por_segmento):
            # Calcular la posición actual en el frame
            x_actual = punto_inicial[0] + dx * frame
            y_actual = punto_inicial[1] + dy * frame

            # Limpiar la pantalla o redibujar la capa de fondo
            superficie_virtual.fill((255, 255, 255))  # Blanco como fondo, pero se puede personalizar
            
            # Recorrer los elementos a dibujar en el orden especificado
            for elem, orden, estatico, *params in sorted(elementos, key=lambda x: x[1]):
                # Llamar a la función correspondiente y pasarle los parámetros adecuados
                if elem is mesa:
                    # La mesa se imprime sin punto x e y
                    elem(superficie_virtual, *params)

                elif "estatico " in estatico and punto_inicio is not None:
                    punto = None
                    tipo = estatico.strip().split()[1]
                    id = estatico.strip().split()[2]
                    if tipo not in posicion:
                        # Guardar estado en diccionario de elementos estaticos
                        posicion[tipo] = {id : punto_inicio[0]}
                        punto = punto_inicio[0]
                    elif tipo in posicion and posicion.get(tipo).get(id) is None:
                        posicion[tipo][id] = punto_inicio[0]
                        punto = punto_inicio[0]
                    elif tipo in posicion and posicion[tipo][id]:
                        punto = posicion[tipo][id]
                    elem(superficie_virtual, punto[0], punto[1], *params)
                else:    
                    elem(superficie_virtual, x_actual, y_actual, *params)
            
            # Actualizar la superficie_virtual
            pygame.display.update()

            # Redimensionar la superficie para ajustarse a la nueva resolución
            redimension(superficie_virtual, ventana, resolucion)
            
            # Esperar entre frames para hacer la animación más fluida
            time.sleep(tiempo_por_frame)







#-------------------------------------------------------------------------------------
# Función para capturar el clic y adaptarlo a la escala de la ventana
def capturar_click(ventana, superficie_virtual, clic):
    # Obtener las dimensiones de la ventana y la superficie virtual
    ancho_ventana, alto_ventana = ventana.get_size()
    ancho_virtual, alto_virtual = superficie_virtual.get_size()
    
    # Obtener las coordenadas del clic en la ventana
    x_click, y_click = clic
    
    # Calcular el factor de escala
    escala_x = ancho_virtual / ancho_ventana
    escala_y = alto_virtual / alto_ventana
    
    # Transformar las coordenadas del clic para que se ajusten a la superficie virtual
    x_virtual = x_click * escala_x
    y_virtual = y_click * escala_y
    
    return x_virtual, y_virtual

# Función principal para gestionar la apuesta
def apostar(superficie_virtual,ventana, fichas_jugador):
    # Dibujar el fondo del área de apuesta
    pygame.draw.polygon(superficie_virtual, MOROSA, [
        (140, 120), (140, 480), (660, 480), (660, 120)
    ])  # Color morosa
    pygame.draw.polygon(superficie_virtual, (0, 0, 0), [
        (140, 120), (140, 480), (660, 480), (660, 120)
    ],2)  # Borde negro

    # Dibujar el texto
    # Aquí deberías utilizar la función dibujar_texto para los textos, pero por ahora solo los imprimimos en superficie_virtual
    # Ejemplo:
    dibujar_texto(superficie_virtual, "ELIGE CUANTO APOSTAR", 200, 170, 10, NEGRO)


    # Dibujar las fichas (ejemplo de cómo hacerlo)
    dibujar_ficha(superficie_virtual, 200, 420, 0.8, (255, 0, 0))  # Ficha 20
    dibujar_texto(superficie_virtual, "20", 183, 410, 10, BLANCO)

    dibujar_ficha(superficie_virtual, 250, 340, 0.8, (235, 220, 0))  # Ficha 50
    dibujar_texto(superficie_virtual, "50", 233, 330, 10, BLANCO)

    dibujar_ficha(superficie_virtual, 330, 280, 0.8, (0, 0, 128))   # Ficha 100
    dibujar_texto(superficie_virtual, "100", 313, 275, 6, BLANCO)

    dibujar_ficha(superficie_virtual, 470, 280, 0.8, (128, 0, 128))  # Ficha 200
    dibujar_texto(superficie_virtual, "200", 453, 275, 6, BLANCO)

    dibujar_ficha(superficie_virtual, 550, 340, 0.8, (255, 165, 0))  # Ficha 500
    dibujar_texto(superficie_virtual, "500", 533, 335, 6, BLANCO)

    dibujar_ficha(superficie_virtual, 600, 420, 0.8, (255, 210, 5))  # Ficha 1000
    dibujar_texto(superficie_virtual, "1000", 576, 415, 6, BLANCO)

    redimension(superficie_virtual, ventana, ventana.get_size())

    # Bucle para capturar clics
    loop = True
    while loop:
        for evento in pygame.event.get():
            if evento.type == pygame.QUIT:
                pygame.quit()
                exit()

            if evento.type == pygame.MOUSEBUTTONDOWN:
                # Capturar las coordenadas del clic
                clic = pygame.mouse.get_pos()
                
                # Adaptar las coordenadas del clic a la superficie virtual
                x_virtual, y_virtual = capturar_click(ventana, superficie_virtual, clic)

                # Verificar en qué área se hizo clic
                if D2(x_virtual, y_virtual, 200, 420) <= 40 and fichas_jugador >= 20:
                    fichas_jugador -= 20
                    print("Apostaste 20 fichas.")
                elif D2(x_virtual, y_virtual, 250, 340) <= 40 and fichas_jugador >= 50:
                    fichas_jugador -= 50
                    print("Apostaste 50 fichas.")
                elif D2(x_virtual, y_virtual, 330, 280) <= 40 and fichas_jugador >= 100:
                    fichas_jugador -= 100
                    print("Apostaste 100 fichas.")
                elif D2(x_virtual, y_virtual, 470, 280) <= 40 and fichas_jugador >= 200:
                    fichas_jugador -= 200
                    print("Apostaste 200 fichas.")
                elif D2(x_virtual, y_virtual, 550, 340) <= 40 and fichas_jugador >= 500:
                    fichas_jugador -= 500
                    print("Apostaste 500 fichas.")
                elif D2(x_virtual, y_virtual, 600, 420) <= 40 and fichas_jugador >= 1000:
                    fichas_jugador -= 1000
                    print("Apostaste 1000 fichas.")

                # Salir del bucle de apuestas
                loop = False

        # Actualizar pantalla
        pygame.display.update()

def cantidad(superficie_virtual, ventana):

    # Dibuja el área de la cantidad con contorno y fondo
    pygame.draw.polygon(superficie_virtual, MOROSA, [
        (140, 120), (140, 480), (660, 480), (660, 120)
    ])

    # Dibuja el borde del rectángulo
    pygame.draw.polygon(superficie_virtual, NEGRO, [
        (140, 120), (140, 480), (660, 480), (660, 120)
    ],2)
    
    # Mostrar texto con desplazamientos para crear un efecto
    dibujar_texto(superficie_virtual, "CON CUANTO QUIERES JUGAR", 163, 171, 10, NEGRO)

    # Actualizar la superficie_virtual para mostrar el texto
    redimension(superficie_virtual, ventana, ventana.get_size())

    # Capturar la entrada del jugador usando el campo de entrada
    resultado = input_field(superficie_virtual, ventana,250, 250, 300, 20)
    
    # Comprobar si la entrada es válida
    while not resultado:
        # Mostrar un mensaje de error si la entrada es incorrecta
        dibujar_texto(superficie_virtual, "ENTRADA ERRONEA", 250, 300, 10, BLANCO)
        redimension(superficie_virtual, ventana, ventana.get_size())
        # error_text = font.render("ENTRADA ERRONEA", True, blanco)
        # superficie_virtual.blit(error_text, (250, 300))
        pygame.display.update()
        time.sleep(2)  # Esperar un par de segundos para mostrar el mensaje de error
        
        # Limpiar el área del mensaje de error
        pygame.draw.polygon(superficie_virtual, MOROSA, [
            (250, 300), (550, 300), (550, 340), (250, 340)
        ])
        pygame.display.update()
        
        # Volver a solicitar la entrada
        resultado = input_field(superficie_virtual, ventana,250, 250, 300, 20)

    # Devolver el resultado
    return resultado

def mensaje(pantalla, texto, color, max_chars_per_line=23, escala=12):
    """
    Función para dibujar un mensaje en el cuadro de texto, ajustando el tamaño y
    el texto según el número de caracteres y líneas que tenga.
    """
    # Dividir el texto en palabras
    palabras = texto.split()
    lineas = []
    linea_actual = ""
    
    # Dividir las palabras en líneas, asegurándonos de que no sobrepasen los 23 caracteres
    for palabra in palabras:
        # Si añadir la palabra a la línea no excede el máximo de caracteres
        if len(linea_actual) + len(palabra) + 1 <= max_chars_per_line:
            if linea_actual == "":
                linea_actual = palabra
            else:
                linea_actual += " " + palabra
        else:
            # Si no cabe, guardamos la línea y comenzamos una nueva
            lineas.append(linea_actual)
            linea_actual = palabra
    
    # Añadir la última línea
    if linea_actual:
        lineas.append(linea_actual)
    
    # Calcular la altura del cuadro de texto
    base_x, base_y = 100, 200
    altura_cuadro = 67 * len(lineas)
    
    pygame.draw.polygon(pantalla, MOROSA, [
        (base_x, base_y),
        (base_x + 600, base_y),
        (base_x + 600, base_y + altura_cuadro),
        (base_x, base_y + altura_cuadro)
    ])  # Fondo moroso

    # Dibujar el fondo del cuadro de texto
    pygame.draw.polygon(pantalla, (0, 0, 0), [
        (base_x, base_y),
        (base_x + 600, base_y),
        (base_x + 600, base_y + altura_cuadro),
        (base_x, base_y + altura_cuadro)
    ], 2)  # Fondo negro
    
    # Dibujar cada línea de texto dentro del cuadro
    for i, linea in enumerate(lineas):
        # Dibujar cada línea en la posición correspondiente
        dibujar_texto(pantalla, linea, base_x + 20, base_y + 20 + i * 67, escala, color)