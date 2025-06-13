extends Node2D

var hamburguesa_actual = null
var hamburguesa_scene = preload("res://Escenas/Nivel1/Hamburguesa.tscn")
var juego_iniciado = false



func _ready():
	print("Inicializando juego...")
	# Carga asíncrona para evitar problemas
	var modal = preload("res://Escenas/Nivel1/ModalInicio.tscn").instantiate()
	# Asegurar que se añade al árbol antes de conectar señales
	add_child(modal)
	await get_tree().process_frame  # Reemplazo correcto para yield
	# Conexión con banderas especiales
	modal.connect("modal_closed", _on_modal_closed, CONNECT_DEFERRED | CONNECT_PERSIST)
	modal.open()
	print("Modal listo en árbol:", modal.is_inside_tree()) # Debug

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
