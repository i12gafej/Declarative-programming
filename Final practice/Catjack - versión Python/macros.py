import json

# Definir colores


BLANCO = (255, 255, 255)
ROJO = (229, 25, 51)
ORO = (204, 204, 7)
AMARILLO = (229, 229, 22)
GRIS = (127, 127, 127)
NAVY = (10, 10, 204)
MOROSA = (229, 178, 216)
MORADO = (153, 10, 216)
TAPETE = (51, 204, 76)
NARANJA = (229, 114, 20)
NEGRO = (0, 0, 0)
CONTADOR = (76, 76, 76)
MAS = (17, 239, 188)
MAS_OPP = (15, 40, 68)
MENOS = (239, 71, 19)
FONDO = (229, 229, 229)
CONTADOR2 = (204, 204, 204)
BEISH = (235, 218, 139)

# Cargar los puntos desde el archivo JSON
def cargar_puntos(filename="output"):
    with open(f"{filename}.json", "r") as file:
        puntos = json.load(file)
    return puntos

# Cargar los datos desde el archivo JSON al inicio
valores = cargar_puntos("cartas_puntos")

# Cargar el contorno de la carta
contorno_carta = cargar_puntos("carta")

# Cargar la caratula
caratula = cargar_puntos("caratula")

# Cargar patita
patita = cargar_puntos("patita")

# Cargar tipogafía
letras = cargar_puntos("letras")

# Mantener la posición de los elementos estaticos
posicion = {}