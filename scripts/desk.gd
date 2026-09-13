extends Node3D

var player_in_range = false

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		player_in_range = true

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		player_in_range = false

func _process(_delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://scenes/roulette.tscn")
