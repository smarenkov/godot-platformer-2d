extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: CharacterBody2D) -> void:
	print(str(body.get_class()) + " reach kill zone")
	if !%Player.is_death: 
		%Player._death()
		timer.start()


func _on_timer_timeout() -> void:
	var sceneThree: SceneTree = get_tree()
	sceneThree.reload_current_scene()
