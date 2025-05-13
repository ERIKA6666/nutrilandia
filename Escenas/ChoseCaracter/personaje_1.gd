extends TextureButton
func _on_pressed() -> void:
	Global.selected_character_path = "res://ui//niña_brocoli.png"
	print("niña brocoli")
	get_tree().change_scene_to_file("res://Escenas//Nivel1//Main.tscn")
