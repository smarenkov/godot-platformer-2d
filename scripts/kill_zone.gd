extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body) -> void:
	print("Someone reach bottom kill zone" + str(body))
	if !%Player.is_death: 
		%Player._death()
		timer.start()


func _on_timer_timeout() -> void:
	var sceneThree: SceneTree = get_tree()
	sceneThree.reload_current_scene()
