extends Area2D

@onready var timer: Timer = $Timer
@onready var player: Player = %Player


func _on_body_entered(body: CharacterBody2D) -> void:
	print(str(body.get_class()) + " reach kill zone")
		
	if !player.is_dead: 
		player._die()
		timer.start()


func _on_timer_timeout() -> void:
	var sceneThree: SceneTree = get_tree()
	sceneThree.reload_current_scene()
