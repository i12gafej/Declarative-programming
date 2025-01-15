import json
from graficos import *
from juego import *
import time

# Datos de ejemplo que queremos guardar
animaciones = [
    {
        "elementos": [
            ("mesa", 0, "-", 100, 100, 'fichas'),
            ("dibujar_carta", 1, "estatico crupier 1", 0.3, "corazon", "A", "valores", "contorno_carta"),
            ("dibujar_carta_por_detras", 2, "estatico crupier 2", 0.3, "contorno_carta", "patita['interior']"),
            ("dibujar_patita", 3, "no-estatico", 0.6, "patita")
        ],
        "punto_inicio": (290, 400),
        "punto_final": (290, 400),
        "puntos_intermedios": [],
        "duracion": 2,
        "frames": 200
    },
    {
        "elementos": [
            ("mesa", 0, "-", 100, 100, 'fichas'),
            ("dibujar_carta", 1, "estatico crupier 1", 0.3, "corazon", "K", "valores", "contorno_carta"),
            ("dibujar_carta_por_detras", 2, "estatico crupier 2", 0.3, "contorno_carta", "patita['interior']"),
            ("dibujar_patita", 3, "no-estatico", 0.6, "patita")
        ],
        "punto_inicio": (300, 400),
        "punto_final": (300, 400),
        "puntos_intermedios": [],
        "duracion": 3,
        "frames": 250
    }
]

# Guardar en un archivo JSON
with open("animaciones.json", "w") as file:
    json.dump(animaciones, file, indent=4)


def cargar_animaciones():
    with open("animaciones.json", "r") as file:
        animaciones = json.load(file)
    return animaciones

# Ejecutar las animaciones cargadas
def ejecutar_animaciones(superficie_virtual, ventana):
    animaciones = cargar_animaciones()
    
    for animacion_data in animaciones:
        elementos = animacion_data["elementos"]
        punto_inicio = animacion_data["punto_inicio"]
        punto_final = animacion_data["punto_final"]
        puntos_intermedios = animacion_data["puntos_intermedios"]
        duracion = animacion_data["duracion"]
        frames = animacion_data["frames"]
        
        # Llamar a la función de animación con los parámetros cargados
        animacion(superficie_virtual, ventana, ventana.get_size(), elementos, punto_inicio, punto_final, puntos_intermedios, duracion, frames)
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
        ejecutar_animaciones(superficie_virtual, ventana)
        #dibujar_lista(superficie_virtual, valores, '5', 300, 400, 0.7, ROJO)
        #dibujar_carta(superficie_virtual, 100, 200, 0.6, 'diamante', '2', valores, contorno_carta)
        #redimension(superficie_virtual, ventana, ventana.get_size())
        pygame.display.update()

        # Controlar la tasa de frames por segundo
        reloj.tick(60)

# Ejecutar el juego
juego()
# Esto se ejecuta en el loop principal
