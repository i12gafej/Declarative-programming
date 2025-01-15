import random
import pygame
from graficos import *
from macros import *


# Función para crear un mazo de 6 barajas de 52 cartas
def crear_mazo():
    # Definir los palos y valores de las cartas
    palos = ['corazon', 'diamante', 'trebol', 'pica']
    valores = ['A', '2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K']
    
    # Crear las cartas para una baraja
    mazo = []
    for palo in palos:
        for valor in valores:
            mazo.append((valor, palo))
    
    # Crear 6 barajas, duplicando el mazo
    mazo_completo = mazo * 6
    
    # Mezclar el mazo completo
    random.shuffle(mazo_completo)
    
    return mazo_completo

# Ejemplo de cómo usar la función
mazo = crear_mazo()


def valor_carta(carta):
    valor = carta[0]  # Obtener el valor de la carta (primer elemento de la tupla)
    
    if valor == 'A':  # Asumimos que el valor es 'A' (As)
        return 11
    elif valor == 'T':  # Si es 'T' (10)
        return 10
    elif valor in ['J', 'Q', 'K']:  # Para las cartas J, Q, K
        return 10
    else:  # Si es un número, lo convertimos en entero
        return int(valor)
    
def valor_mano(pantalla, mano, tipo):
    # Función auxiliar para calcular el valor de la mano
    def aux():
        suma = sum(map(valor_carta, mano))  # Suma los valores de las cartas
        ases = sum(1 for carta in mano if carta[0] == 'A')  # Cuenta los ases en la mano
        
        # Ajusta el valor de la mano si supera 21 y aún hay ases
        while suma > 21 and ases > 0:
            suma -= 10
            ases -= 1
        
        return suma

    resultado = aux()
    
    # Posición de la caja, dependiendo del tipo de jugador
    pos_y = 250 if tipo == 'crupier' else 400
    
    # Dibujar caja (usando pygame para dibujar los rectángulos)
    pygame.draw.polygon(pantalla, (0, 0, 0), [(60, pos_y - 30), (120, pos_y - 30), (120, pos_y + 30), (60, pos_y + 30)])
    pygame.draw.polygon(pantalla, (255, 255, 255), [(65, pos_y - 25), (115, pos_y - 25), (115, pos_y + 25), (65, pos_y + 25)])
    
    # Dibujar el texto con el resultado
    dibujar_texto(pantalla, str(resultado), 73, pos_y - 10, 10, (0, 0, 0))
    
    return resultado

def reparto_inicial(superficie_virtual, ventana, mazo):
    mano_crupier = [mazo.pop(), mazo.pop()]
    mano_jugador = [mazo.pop(), mazo.pop()]

    render = [[(mesa,0,"-", 100, 100, 'fichas'),
                (dibujar_carta_por_detras, 1,"no-estatico", 0.3, contorno_carta, patita["interior"]),
                (dibujar_patita, 2,"no-estatico", 0.6, patita)],
                [
                (mesa, 0,"-", 100, 100, 'fichas'),
                (dibujar_carta, 1,"estatico crupier 1", 0.3, mano_crupier[0][1], mano_crupier[0][0], valores, contorno_carta),
                (dibujar_patita, 2,"no-estatico", 0.6, patita)],
                [
                (mesa, 0,"-", 100, 100, 'fichas'),
                (dibujar_carta, 1,"estatico crupier 1", 0.3, mano_crupier[0][1], mano_crupier[0][0], valores, contorno_carta),
                (dibujar_carta_por_detras, 2,"no-estatico", 0.3, contorno_carta, patita["interior"]),
                (dibujar_patita, 3,"no-estatico", 0.6, patita)],
                [
                (mesa, 0,"-", 100, 100, 'fichas'),
                (dibujar_carta, 1,"estatico crupier 1", 0.3, mano_crupier[0][1], mano_crupier[0][0], valores, contorno_carta),
                (dibujar_carta_por_detras, 2,"estatico crupier 2", 0.3, contorno_carta, patita["interior"]),
                (dibujar_patita, 3,"no-estatico", 0.6, patita)],
                [
                (mesa, 0,"-", 100, 100, 'fichas'),
                (dibujar_carta, 1,"estatico crupier 1", 0.3, mano_crupier[0][1], mano_crupier[0][0], valores, contorno_carta),
                (dibujar_carta_por_detras, 2,"estatico crupier 2", 0.3, contorno_carta, patita["interior"]),
                (dibujar_carta_por_detras, 3,"no-estatico", 0.3, contorno_carta, patita["interior"]),
                (dibujar_patita, 4,"no-estatico", 0.6, patita)],
                [
                (mesa, 0,"-", 100, 100, 'fichas'),
                (dibujar_carta, 1,"estatico crupier 1", 0.3, mano_crupier[0][1], mano_crupier[0][0], valores, contorno_carta),
                (dibujar_carta_por_detras, 2,"estatico crupier 2", 0.3, contorno_carta, patita["interior"]),
                (dibujar_carta, 3,"estatico jugador 1", 0.3, mano_crupier[1][1], mano_crupier[1][0], valores, contorno_carta),
                (dibujar_patita, 4,"no-estatico", 0.6, patita)],
                [
                (mesa, 0,"-", 100, 100, 'fichas'),
                (dibujar_carta, 1,"estatico crupier 1", 0.3, mano_crupier[0][1], mano_crupier[0][0], valores, contorno_carta),
                (dibujar_carta_por_detras, 2,"estatico crupier 2", 0.3, contorno_carta, patita["interior"]),
                (dibujar_carta, 3,"estatico jugador 1", 0.3, mano_jugador[0][1], mano_jugador[0][0], valores, contorno_carta),
                (dibujar_carta_por_detras, 4,"no-estatico", 0.3, contorno_carta, patita["interior"]),
                (dibujar_patita, 5,"no-estatico", 0.6, patita)],
                [
                (mesa, 0,"-", 100, 100, 'fichas'),
                (dibujar_carta, 1,"estatico crupier 1", 0.3, mano_crupier[0][1], mano_crupier[0][0], valores, contorno_carta),
                (dibujar_carta_por_detras, 2,"estatico crupier 2", 0.3, contorno_carta, patita["interior"]),
                (dibujar_carta, 3,"estatico jugador 1", 0.3, mano_jugador[0][1], mano_jugador[0][0], valores, contorno_carta),
                (dibujar_carta, 4,"estatico jugador 2", 0.3, mano_jugador[1][1], mano_jugador[1][0], valores, contorno_carta),
                (dibujar_patita, 5,"no-estatico", 0.6, patita)],
                [
                (mesa, 0,"-", 100, 100, 'fichas'),
                (dibujar_carta, 1,"estatico crupier 1", 0.3, mano_crupier[0][1], mano_crupier[0][0], valores, contorno_carta),
                (dibujar_carta_por_detras, 2,"estatico crupier 2", 0.3, contorno_carta, patita["interior"]),
                (dibujar_carta, 3,"estatico jugador 1", 0.3, mano_jugador[0][1], mano_jugador[0][0], valores, contorno_carta),
                (dibujar_carta, 4,"estatico jugador 2", 0.3, mano_jugador[1][1], mano_jugador[1][0], valores, contorno_carta),
                (dibujar_patita, 5,"no-estatico", 0.6, patita)],]
    puntos_iniciales = [None, (200, 250), (200, 250), (290, 250),None, (200, 400), (200, 400), (290, 400), None]
    puntos_finales = [(200, 250), (200, 250), (290, 250), (290, 250),(200, 400), (200, 400), (290, 400), (290, 400), (290, 400)]
    puntos_intermedios = [generar_espiral(centro=(200, 250), tamaño=(800, 700)), [],[],[],generar_espiral(centro=(200, 400), tamaño=(800, 700)),[],[],[],generar_espiral(centro=(290, 400), tamaño=(800, 700), orden='dentro-fuera')]
    tiempos = [2, 0.2, 0.6, 0.5, 2, 0.2, 0.6, 0.5, 2]
    frames = [200, 10, 10, 10, 200, 10, 10, 10, 200]

    for i in range(len(render)):
        animacion(
            superficie_virtual,
            ventana,
            ventana.get_size(),
            render[i],
            puntos_iniciales[i],
            puntos_finales[i],
            puntos_intermedios[i],
            tiempos[i],
            frames[i]
        )
    # Carta Primera Crupier
    if False:
        animacion(superficie_virtual, 
                    ventana, 
                    ventana.get_size(),
                    [
                        (mesa,0,"-", 100, 100, 'fichas'),
                        (dibujar_carta_por_detras, 1,"no-estatico", 0.3, contorno_carta, patita["interior"]),
                        (dibujar_patita, 2,"no-estatico", 0.6, patita)],
                    None, 
                    (200, 250), 
                    generar_espiral(centro=(200, 200), tamaño=(800, 700)), 
                    2, 
                    200)
        # Carta Primera Crupier - Se para
        animacion(superficie_virtual, 
                    ventana, 
                    ventana.get_size(),
                    [
                        (mesa, 0,"-", 100, 100, 'fichas'),
                        (dibujar_carta, 1,"estatico crupier 1", 0.3, mano_crupier[0][1], mano_crupier[0][0], valores, contorno_carta),
                        (dibujar_patita, 2,"no-estatico", 0.6, patita)],
                    (200, 250), 
                    (200, 250), 
                    [], 
                    0.2, 
                    10)
        # Carta Segunda Crupier
        animacion(superficie_virtual, 
                    ventana, 
                    ventana.get_size(),
                    [
                        (mesa, 0,"-", 100, 100, 'fichas'),
                        (dibujar_carta, 1,"estatico crupier 1", 0.3, mano_crupier[0][1], mano_crupier[0][0], valores, contorno_carta),
                        (dibujar_carta_por_detras, 2,"no-estatico", 0.3, contorno_carta, patita["interior"]),
                        (dibujar_patita, 3,"no-estatico", 0.6, patita)],
                    (200, 250), 
                    (290, 250), 
                    [], 
                    0.6, 
                    10)
        print("Mano del crupier: ", mano_crupier[0])
        print(posicion)
        # Carta Segunda Crupier - Se para
        animacion(superficie_virtual, 
                ventana, 
                ventana.get_size(),
                [
                    (mesa, 0,"-", 100, 100, 'fichas'),
                    (dibujar_carta, 1,"estatico crupier 1", 0.3, mano_crupier[0][1], mano_crupier[0][0], valores, contorno_carta),
                    (dibujar_carta_por_detras, 2,"estatico crupier 2", 0.3, contorno_carta, patita["interior"]),
                    (dibujar_patita, 3,"no-estatico", 0.6, patita)],
                (290, 250), 
                (290, 250), 
                [], 
                0.5, 
                10)
        print(posicion)

        # Carta Primera Jugador
        animacion(superficie_virtual, 
                ventana, 
                ventana.get_size(),
                [
                    (mesa, 0,"-", 100, 100, 'fichas'),
                    (dibujar_carta, 1,"estatico crupier 1", 0.3, mano_crupier[0][1], mano_crupier[0][0], valores, contorno_carta),
                    (dibujar_carta_por_detras, 2,"estatico crupier 2", 0.3, contorno_carta, patita["interior"]),
                    (dibujar_carta_por_detras, 3,"no-estatico", 0.3, contorno_carta, patita["interior"]),
                    (dibujar_patita, 4,"no-estatico", 0.6, patita)],
                None, 
                    (200, 400), 
                    generar_espiral(centro=(200, 400), tamaño=(800, 700)), 
                    2, 
                    200)
        # Carta Primera Jugador - Se para
        animacion(superficie_virtual, 
                    ventana, 
                    ventana.get_size(),
                    [
                        (mesa, 0,"-", 100, 100, 'fichas'),
                        (dibujar_carta, 1,"estatico crupier 1", 0.3, mano_crupier[0][1], mano_crupier[0][0], valores, contorno_carta),
                        (dibujar_carta_por_detras, 2,"estatico crupier 2", 0.3, contorno_carta, patita["interior"]),
                        (dibujar_carta, 3,"estatico jugador 1", 0.3, mano_crupier[1][1], mano_crupier[1][0], valores, contorno_carta),
                        (dibujar_patita, 4,"no-estatico", 0.6, patita)],
                    (200, 400), 
                    (200, 400), 
                    [], 
                    0.2, 
                    10)
        # Carta Segunda Jugador
        animacion(superficie_virtual, 
                    ventana, 
                    ventana.get_size(),
                    [
                        (mesa, 0,"-", 100, 100, 'fichas'),
                        (dibujar_carta, 1,"estatico crupier 1", 0.3, mano_crupier[0][1], mano_crupier[0][0], valores, contorno_carta),
                        (dibujar_carta_por_detras, 2,"estatico crupier 2", 0.3, contorno_carta, patita["interior"]),
                        (dibujar_carta, 3,"estatico jugador 1", 0.3, mano_jugador[0][1], mano_jugador[0][0], valores, contorno_carta),
                        (dibujar_carta_por_detras, 4,"no-estatico", 0.3, contorno_carta, patita["interior"]),
                        (dibujar_patita, 5,"no-estatico", 0.6, patita)],
                    (200, 400), 
                    (290, 400), 
                    [], 
                    0.6, 
                    10)
        print("Mano del crupier: ", mano_crupier[0])
        print(posicion)
        # Carta Segunda Jugador - Se para
        animacion(superficie_virtual, 
                ventana, 
                ventana.get_size(),
                [
                    (mesa, 0,"-", 100, 100, 'fichas'),
                    (dibujar_carta, 1,"estatico crupier 1", 0.3, mano_crupier[0][1], mano_crupier[0][0], valores, contorno_carta),
                    (dibujar_carta_por_detras, 2,"estatico crupier 2", 0.3, contorno_carta, patita["interior"]),
                    (dibujar_carta, 3,"estatico jugador 1", 0.3, mano_jugador[0][1], mano_jugador[0][0], valores, contorno_carta),
                    (dibujar_carta, 4,"estatico jugador 2", 0.3, mano_jugador[1][1], mano_jugador[1][0], valores, contorno_carta),
                    (dibujar_patita, 5,"no-estatico", 0.6, patita)],
                (290, 400), 
                (290, 400), 
                [], 
                0.5, 
                10)
        
        animacion(superficie_virtual, 
                ventana, 
                ventana.get_size(),
                [
                    (mesa, 0,"-", 100, 100, 'fichas'),
                    (dibujar_carta, 1,"estatico crupier 1", 0.3, mano_crupier[0][1], mano_crupier[0][0], valores, contorno_carta),
                    (dibujar_carta_por_detras, 2,"estatico crupier 2", 0.3, contorno_carta, patita["interior"]),
                    (dibujar_carta, 3,"estatico jugador 1", 0.3, mano_jugador[0][1], mano_jugador[0][0], valores, contorno_carta),
                    (dibujar_carta, 4,"estatico jugador 2", 0.3, mano_jugador[1][1], mano_jugador[1][0], valores, contorno_carta),
                    (dibujar_patita, 5,"no-estatico", 0.6, patita)],
                None, 
                (200, 400), 
                generar_espiral(centro=(290, 400), tamaño=(800, 700), orden='dentro-fuera'), 
                2, 
                200)
        
        
        print(posicion)
        print("-------------------------")