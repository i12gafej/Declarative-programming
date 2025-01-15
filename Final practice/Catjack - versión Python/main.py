from graficos import *
from juego import *
import time



# Ejemplo de cómo usar la función en un juego
def juego():
    pygame.init()
    pygame.display.set_caption('Catjack!')

    # Resolución original del juego
    ANCHO_ORIGINAL = 800
    ALTO_ORIGINAL = 600

    # Resolución deseada para la ventana
    ANCHO_VENTANA = 1250
    ALTO_VENTANA = 800

    # Crear la ventana con la resolución de la ventana
    ventana = pygame.display.set_mode((ANCHO_VENTANA, ALTO_VENTANA))

    # Crear una superficie virtual con la resolución original del juego
    superficie_virtual = pygame.Surface((ANCHO_ORIGINAL, ALTO_ORIGINAL))

    # Crear un reloj para controlar el framerate
    reloj = pygame.time.Clock()

    puntos_intermedios1 = [(80, 20),(160, 40),(240, 60),(280, 80),(320, 100),(280, 120),(240, 140),(220, 160), (210, 180)]
    puntos_intermedios2 = puntos_espiral = generar_espiral(
        centro=(200, 200), 
        tamaño=(800, 700), 
        progresion=5, 
        direccion='abajo', 
        sentido='antihorario', 
        orden='fuera-dentro', 
        cantidad_puntos=150
    )
    
    # Bucle principal del juego
    while True:
        for evento in pygame.event.get():
            if evento.type == pygame.QUIT:
                pygame.quit()
                exit()

        # Rellenar la superficie virtual con el color de fondo
        superficie_virtual.fill((255, 255, 255))  # Color blanco

        #animacion(superficie_virtual, ventana, (ANCHO_VENTANA, ALTO_VENTANA),[(mesa, 0, 100, 100, 'fichas'),(dibujar_carta_por_detras, 1, 0.3, contorno_carta, patita["interior"]),(dibujar_patita, 2, 0.6, patita)],None, (200, 200), puntos_intermedios2, 2, 200)
        # Actualizar la pantalla
        #apostar(superficie_virtual, ventana, 1000)
        #input_field(superficie_virtual, ventana, 100, 100, 400, 20)
        #cantidad(superficie_virtual, ventana)
        #mensaje(superficie_virtual, "NO PUEDES DOBLAR", BLANCO, escala=12)
        #valor_mano(superficie_virtual,[('A', 'corazon'), ('7', 'diamante'), ('K', 'trebol')], 'jugador')
        #valor_mano(superficie_virtual,[('A', 'corazon'), ('7', 'diamante'), ('K', 'trebol')], 'crupier')
        #redimension(superficie_virtual, ventana, ventana.get_size())
        reparto_inicial(superficie_virtual, ventana, mazo)
        #dibujar_lista(superficie_virtual, valores, '5', 300, 400, 0.7, ROJO)
        #dibujar_carta(superficie_virtual, 100, 200, 0.6, 'diamante', '2', valores, contorno_carta)
        #redimension(superficie_virtual, ventana, ventana.get_size())
        pygame.display.update()

        # Controlar la tasa de frames por segundo
        reloj.tick(60)

# Ejecutar el juego
juego()