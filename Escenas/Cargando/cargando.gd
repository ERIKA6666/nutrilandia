extends Node2D

# Tiempo de espera en segundos (ajusta según necesites)
var tiempo_espera := 1.0
# Ruta corregida de la escena siguiente (observa la extensión .tscn)
var escena_siguiente := "res://Escenas/Historia/Bienvenida.tscn"

func _ready():
	# Validar que la escena existe antes de intentar cargarla
	if not ResourceLoader.exists(escena_siguiente):
		printerr("Error: No se encontró la escena ", escena_siguiente)
		return
	
	# Opcional: Mensaje de depuración
	print("Mostrando escena actual por ", tiempo_espera, " segundos...")
	
	# Esperar el tiempo definido
	await get_tree().create_timer(tiempo_espera).timeout
	
	# Redireccionar con manejo de errores
	if get_tree().change_scene_to_file(escena_siguiente) != OK:
		printerr("Error al cambiar a la escena: ", escena_siguiente)
