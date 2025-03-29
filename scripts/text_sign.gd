extends Node2D

@onready var label: Label = $Label


func _on_ready() -> void:
	_toggle_lable_visibility(false)

func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	print("Text sign was activated by: " + body.get_class())
	_toggle_lable_visibility(true)

func _on_area_2d_body_exited(body: CharacterBody2D) -> void:
	_toggle_lable_visibility(false)
	
func _toggle_lable_visibility(value: bool) -> void:
	if label:
		label.visible = value
	else:
		printerr("Label node is now exist")
