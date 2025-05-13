extends RigidBody2D

func _ready():
	print("Fresa - Layers: ", collision_layer)
	print("Fresa - Masks: ", collision_mask)
	contact_monitor = true
	max_contacts_reported = 1
	print("Fresa lista - Monitor de contactos activado")

func _on_body_entered(body):
	print("=== COLISIÓN CON ===", body.name)
	print("Grupos del cuerpo:", body.get_groups())
	
	if "reducir_tamano" in body:
		print("Método detectado!")
		body.reducir_tamano()
	else:
		print("NO tiene el método reducir_tamano")
	
	queue_free()
