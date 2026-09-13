extends Node3D

@onready var moneylabel = $moneylabel

var money = 1000
var bet := 50

func _ready() -> void:
	randomize()
	update_money_ui()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		get_tree().change_scene_to_file("res://scenes/main.tscn")

	if Input.is_action_just_pressed("interact"):
		money -= bet
		var winnings = randi_range(-5000, 10000)
		money += winnings
		update_money_ui()
	
	# win/lose conditions
	if money >= 100000:
		get_tree().change_scene_to_file("res://scenes/win.tscn")
	if money <= 0:
		get_tree().change_scene_to_file("res://scenes/loss.tscn")


func update_money_ui():
	moneylabel.text = "money: $" + str(money)
