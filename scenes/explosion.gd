extends CollisionShape2D

func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()


func _on_bullet_explode() -> void:
	
	for bodies in $Area2D.get_overlapping_bodies():
		_on_body_entered(bodies)
	
