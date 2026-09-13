extends Node3D

var player_in_range = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	%Spin.play("spinnn")
	if player_in_range and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://scenes/thanks4playing.tscn")
func _on_computer_exit_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		player_in_range = true
func _on_computer_exit_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		player_in_range = false

func _on_touch_grass_exit_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		$grasscamera.make_current()
		player_in_range = true


func _on_touch_grass_exit_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		$grasscamera.clear_current()
		player_in_range = false
