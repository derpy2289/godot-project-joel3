extends Area2D

var travelled_distance = 0
signal explode

func _physics_process(_delta):
	const SPEED = 1000
	const RANGE = 600

	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * _delta

	travelled_distance += SPEED * _delta
	if travelled_distance > RANGE:
		queue_free()

#brain is not smart enough to brain I can't figure this out about to lose my mind SKDFJ;ALKFJD
func _on_body_entered(body):
	print("hit")
	if body.has_method("take_damage"):
		body.take_damage()
	explode.emit(body)

func _on_explode(body):
	queue_free()
	print("explode")
	$CollisionShape2D.scale = Vector2(8,8)
	if body.has_method("take_damage"):
		body.take_damage()
	
