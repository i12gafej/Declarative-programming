import subprocess
import psutil
import time
import pygetwindow as gw  # Biblioteca para manejar ventanas del sistema operativo

def get_all_window_titles():
    """
    Lista todos los títulos de las ventanas abiertas.
    """
    windows = gw.getAllTitles()
    #print("Ventanas abiertas:")
    #for title in windows:
        #print(f"- {title}")

def is_viewport_open(title_contains="CatJack!"): 
    """
    Verifica si una ventana con el título que contiene `title_contains` está abierta.
    """
    windows = gw.getAllTitles()
    for title in windows:
        if title_contains.lower() in title.lower():
            return True
    return False

def main():
    # Ruta al ejecutable de Catjack
    executable = "catjack.exe"

    #print(f"Lanzando {executable}...")
    
    # Lanza el programa como un proceso
    process = subprocess.Popen([executable], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    process_pid = process.pid
    #print(f"Proceso iniciado con PID: {process_pid}")

    time.sleep(2)  # Espera 2 segundos para que la ventana tenga tiempo de abrirse
    # get_all_window_titles()  # Lista los títulos de las ventanas

    # Verifica si el proceso está activo y supervisa la ventana
    try:
        while True:
            # Verifica si el proceso sigue activo
            if not psutil.pid_exists(process_pid):
                #print("El proceso ha finalizado.")
                break

            # Verifica si la ventana del viewport está abierta
            viewport_open = is_viewport_open("CatJack!")  # Ajusta esto según el título correcto
            # if viewport_open:
            ##     print("Ventana del viewport detectada.")
            # else:
            ##     print("No se detecta la ventana del viewport.")

            # Si el proceso sigue activo pero la ventana ya no está, termina el proceso
            if not viewport_open and psutil.pid_exists(process_pid):
                #print("Ventana cerrada. Terminando el proceso...")
                process.terminate()
                break

            time.sleep(1)  # Espera un segundo antes de la próxima verificación
    #except KeyboardInterrupt:
        #print("Interrumpido manualmente.")
    finally:
        # Si el proceso sigue activo, intenta cerrarlo
        if psutil.pid_exists(process_pid):
            #print("Terminando el proceso...")
            process.terminate()

        #print("Programa terminado.")

if __name__ == "__main__":
    main()
