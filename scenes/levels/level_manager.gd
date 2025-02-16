class_name LevelManager extends Node2D

@onready var player: Player = %Player
signal coin_pick_up

var coin_count: int = 0
const coin_count_limit: int = 5


func add_coin() -> void:
	coin_count += 1
	coin_pick_up.emit()
	
	if coin_count == coin_count_limit && player.jump_count_limit < 2:
		_unlock_double_jump()
	
func _unlock_double_jump() -> void:
	player.jump_count_limit = 2
