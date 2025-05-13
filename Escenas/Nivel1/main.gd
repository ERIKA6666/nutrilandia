extends Node2D


var hamburguesa_actual = null  # Variable para guardar la hamburguesa actual
var hamburguesa_scene = preload("res://Escenas//Nivel1//Hamburguesa.tscn")

func _ready():
	spawnear_hamburguesa()  # Genera UNA hamburguesa al inicio

func spawnear_hamburguesa():
	if hamburguesa_actual == null:
		hamburguesa_actual = hamburguesa_scene.instantiate()
		print("Clase de la instancia:", hamburguesa_actual.get_class())  # Debug
		add_child(hamburguesa_actual)

func _on_hamburguesa_destruida():
	hamburguesa_actual = null
	spawnear_hamburguesa()  # Vuelve a generar otra cuando se destruye (opcional)
