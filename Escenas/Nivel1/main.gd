extends Node2D

var hamburguesa_actual = null
var hamburguesa_scene = preload("res://Escenas/Nivel1/Hamburguesa.tscn")
var juego_iniciado = false

func _ready():
	print("Inicializando juego...")
	
	var modal = preload("res://Escenas/Nivel1/ModalInicio.tscn").instantiate()
	add_child(modal)
	
	# Verificación visual temporal (debug)
	modal.modal_closed.connect(_on_modal_closed, CONNECT_DEFERRED)
	# Asegurar posición z-index
	modal.layer = 100
	print("Z-index del modal:", modal.layer)

func _on_modal_closed():
	print("Señal modal_closed recibida en Main")
	juego_iniciado = true
	spawnear_hamburguesa()

func spawnear_hamburguesa():
	if hamburguesa_actual == null and juego_iniciado:
		hamburguesa_actual = hamburguesa_scene.instantiate()
		print("Clase de la instancia:", hamburguesa_actual.get_class())  # Debug
		add_child(hamburguesa_actual)

func _on_hamburguesa_destruida():
	hamburguesa_actual = null
	spawnear_hamburguesa()  # Vuelve a generar otra cuando se destruye

func _on_stop_button_pressed() -> void:
	pass # Replace with function body.
