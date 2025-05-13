extends Area2D
func _ready():
	var selected_character_texture_path = Global.selected_character_path  # Ej: "res://assets/personaje1.png"
	var texture = load(selected_character_texture_path)
	$Sprite2D.texture = texture  # Asigna la textura al Sprite2D
