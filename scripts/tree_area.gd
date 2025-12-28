extends Area2D



func spawn_tree():
	var new_tree =preload("res://scenes//pinetree.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_tree.global_position = %PathFollow2D.global_position
	add_child(new_tree)

func _on_timer_timeout() -> void:
	spawn_tree()
