extends CanvasLayer

signal modal_closed

@onready var start_button: TextureButton = $BotonComenzar

func open():
	show()
	get_tree().paused = true
	
	# Conexión segura con verificación
	if start_button.is_connected("pressed", _on_button_pressed):
		start_button.disconnect("pressed", _on_button_pressed)
	
	start_button.connect("pressed", _on_button_pressed, CONNECT_DEFERRED | CONNECT_PERSIST)
	print("Botón conectado:", start_button.is_connected("pressed", _on_button_pressed)) # Debug

func _on_button_pressed():
	print("Señal de botón recibida EN EL MODAL") # Debug crucial
	hide()
	get_tree().paused = false
	emit_signal("modal_closed")
	queue_free() # Eliminar el modal después de usarlo
