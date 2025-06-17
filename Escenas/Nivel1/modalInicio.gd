extends CanvasLayer

signal modal_closed

@export var boton_comenzar: TextureButton

func _ready():
	if boton_comenzar:
		# Debug de propiedades críticas del botón
		print("Propiedades del botón:")
		print(" - Disabled:", boton_comenzar.disabled)
		print(" - Visible:", boton_comenzar.visible)
		print(" - Mouse Filter:", boton_comenzar.mouse_filter)
		print(" - Global Position:", boton_comenzar.global_position)
		print(" - Size:", boton_comenzar.size)
		
		# Conexión alternativa directa
		boton_comenzar.pressed.connect(_on_button_pressed, CONNECT_PERSIST)
		
		# Forzar focus (opcional pero recomendado)
		boton_comenzar.grab_focus()

func _on_button_pressed():
	print("¡SEÑAL DE BOTÓN RECIBIDA!")  # Debug en mayúsculas para destacar
	get_viewport().set_input_as_handled()  # Asegurar que el input se procesa
	hide()
	get_tree().paused = false
	modal_closed.emit()
	queue_free()
	
