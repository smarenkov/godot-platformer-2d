class_name Princess
extends Node2D

func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	print("Priness was activated by: " + body.get_class())
	$Timer.start()


func _on_timer_timeout() -> void:
	print("Loading next level")
	get_tree().change_scene_to_file("res://scenes/levels/lava_level.tscn")
