class_name LevelManager extends Node2D

var coin_count: int = 0
signal coin_pick_up

func add_coin() -> void:
	coin_count += 1
	coin_pick_up.emit()
