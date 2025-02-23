extends Node2D

@onready var w_key: ColorRect = $W
@onready var a_key: ColorRect = $A
@onready var s_key: ColorRect = $S
@onready var d_key: ColorRect = $D

func _process(delta: float) -> void:
	w_key.modulate.a = 0.5 if Input.is_action_pressed("jump") else 1.0
	a_key.modulate.a = 0.5 if Input.is_action_pressed("move_left") else 1.0
	s_key.modulate.a = 0.5 if Input.is_action_pressed("down") else 1.0
	d_key.modulate.a = 0.5 if Input.is_action_pressed("move_right") else 1.0
