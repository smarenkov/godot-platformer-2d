class_name Coin extends Area2D

@onready var level_manager: LevelManager = %LevelManager


func _on_body_entered(body: CharacterBody2D) -> void:
	level_manager.add_coin()
	queue_free()
