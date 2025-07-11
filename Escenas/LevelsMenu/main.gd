extends Node2D

var ventana_escena = preload("res://Escenas/LevelsMenu/Regresar.tscn")
# 1. AÑADE ESTA LÍNEA - Ruta a tu nivel 2
const NIVEL2_PATH = "res://Escenas/Nivel2/Game.tscn"

func _ready():
	# 2. AÑADE ESTE BLOQUE - Hacer "nivel 2" clickeable
	if has_node("nivel 2"):
		$"nivel 2".mouse_filter = Control.MOUSE_FILTER_PASS
		$"nivel 2".gui_input.connect(_on_nivel2_gui_input)
		$"nivel 2".mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_play_level_1_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas//ChoseCaracter//Main.tscn")

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

# 3. MODIFICA ESTA FUNCIÓN - Completar función existente
func _on_menu_button_pressed() -> void:
	# Navegar al menú principal
	get_tree().change_scene_to_file("res://Escenas/LewebMenu/main.tscn")

# AÑADE ESTA FUNCIÓN - Manejar clics en "nivel 2"
func _on_nivel2_gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		get_tree().change_scene_to_file(NIVEL2_PATH)
