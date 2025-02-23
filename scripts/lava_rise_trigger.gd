class_name LavaRiseTrigger
extends Area2D

@onready var level_rise_manager: LavaRiseManager = %LavaRiseManager

func _on_body_entered(body: Node2D) -> void:
	print("Lava rise trigger was activated by: " + body.get_class())
	if not level_rise_manager.is_lava_started:
		level_rise_manager.start_lava()
