extends CanvasLayer


func _on_salir_button_2_pressed() -> void:
	get_tree().quit()


func _on_reinicio_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	
