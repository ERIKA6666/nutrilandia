extends Node2D

var ventana_escena = preload("res://Escenas/LevelsMenu/Regresar.tscn")


func _on_play_level_1_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas//ChoseCaracter//Main.tscn") # Replace with function body.

func _on_return_button_pressed() -> void:
	# Crear overlay de fondo usando CanvasLayer para mejor control
	var overlay_layer = CanvasLayer.new()
	overlay_layer.layer = 10  # Capa para el overlay
	var overlay = ColorRect.new()
	overlay.color = Color(0, 0, 0, 0.5)  # Negro semitransparente
	overlay.size = get_viewport_rect().size  # Cubre toda la pantalla
	overlay_layer.add_child(overlay)
	
	# Instanciar la ventana
	var ventana = ventana_escena.instantiate()
	
	# Configurar capa para la ventana (encima del overlay)
	var window_layer = CanvasLayer.new()
	window_layer.layer = 20  # Capa superior
	window_layer.add_child(ventana)
	
	# Añadir todo a la escena
	add_child(overlay_layer)
	add_child(window_layer)
	
	# Mostrar la ventana según su tipo
	ventana.popup_centered()
	
	# Conectar señal para limpiar al cerrar
	if ventana.has_signal("popup_hide") || ventana.has_signal("tree_exiting"):
		ventana.connect("popup_hide" if ventana is Popup else "tree_exiting", 
			self._on_ventana_closed.bind(overlay_layer, window_layer))

func _on_ventana_closed(overlay_layer: CanvasLayer, window_layer: CanvasLayer) -> void:
	overlay_layer.queue_free()
	window_layer.queue_free()

func _on_menu_button_pressed() -> void:
	pass # Replace with function body.
