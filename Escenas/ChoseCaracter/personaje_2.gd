extends TextureButton
func _on_pressed() -> void:
	Global.selected_character_path = "res://ui//niño_brocoli.png"
	print("niño brocoli")
	get_tree().change_scene_to_file("res://Escenas//Nivel1//Main.tscn")
