extends Node2D

func _ready() -> void:
	for i in range(5):
		#come up with new spawning placement method
		spawn_Tree()

func spawn_Tree():
	var new_tree = preload("res://scenes//pinetree.tscn").instantiate()
	
	var notifier = new_tree.get_node("VisibleOnScreenNotifier2D")
	notifier.screen_exited.connect(spawn_Tree)
	
	%PathFollow2D.progress_ratio = randf()
	new_tree.global_position = %PathFollow2D.global_position
	add_child(new_tree)

func spawn_mob():
	var new_mob = preload("res://scenes/mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout() -> void:
	spawn_mob()
	


func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true
