import json
import math

# Función para calcular los puntos de un cuarto de círculo
def lista_cuarto_circulo(centrox, centroy, radio, num_puntos, cuadrante, sentido):
    # Definir una función para calcular los puntos de la circunferencia
    def punto_circulo(r, theta):
        x = r * math.cos(theta)
        y = r * math.sin(theta)
        # Ajustar los signos según el cuadrante
        if cuadrante == 'arriba-derecha':
            return [centrox + x, centroy - y]
        elif cuadrante == 'arriba-izquierda':
            return [centrox - x, centroy - y]
        elif cuadrante == 'abajo-izquierda':
            return [centrox - x, centroy + y]
        elif cuadrante == 'abajo-derecha':
            return [centrox + x, centroy + y]
        else:
            raise ValueError("Cuadrante no válido")

    # Generar la lista de puntos en función del sentido
    puntos = []
    for i in range(num_puntos):
        theta = (i / (num_puntos - 1)) * (math.pi / 2)  # Rango de 0 a pi/2
        if sentido == 'horario':
            theta = (num_puntos - i - 1) * (math.pi / 2) / (num_puntos - 1)  # Sentido horario
        puntos.append(punto_circulo(radio, theta))
    return puntos

concatenated_structure = [
    [50, 190], [50, 150], [150, 150], [150, 190],
    *lista_cuarto_circulo(100, 270, 50, 20, 'abajo-derecha', 'antihorario'),
    [60, 320], [60, 290],
    *lista_cuarto_circulo(100, 270, 20, 20, 'abajo-derecha', 'horario'),
    [120, 190]
]
  
# This is the equivalent of the Scheme expression in Python
print(concatenated_structure)


