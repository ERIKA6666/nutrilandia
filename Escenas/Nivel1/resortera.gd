extends Node2D

var arrastrando = false
var fuerza = 900
var fresa_scene = preload("res://Escenas//Nivel1//Fresa.tscn")

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		var mouse_pos = get_global_mouse_position()
		if event.pressed and $Area2D/CollisionShape2D.shape.get_rect().has_point($Area2D.to_local(mouse_pos)):
			arrastrando = true
		elif arrastrando:
			arrastrando = false
			lanzar_fresa(mouse_pos)

func lanzar_fresa(posicion_raton):
	var fresa = fresa_scene.instantiate()
	print("Fresa creada en:", $SpawnPoint.global_position)  # Debug de posición
	fresa.position = $SpawnPoint.global_position
	var direccion = ($SpawnPoint.global_position - posicion_raton).normalized()
	fresa.apply_impulse(direccion * fuerza)
	get_parent().add_child(fresa)  # O usar add_child() directamente
