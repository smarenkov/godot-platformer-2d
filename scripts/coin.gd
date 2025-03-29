class_name Coin extends Area2D

@onready var level_manager: LevelManager = %LevelManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body: CharacterBody2D) -> void:
	print("Coin was picked")
	animation_player.play("pick_up")
	level_manager.add_coin()
