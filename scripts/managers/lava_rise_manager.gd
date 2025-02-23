class_name LavaRiseManager 
extends Node2D

@onready var player: Player = %Player
@onready var lava: TileMapLayer = %Lava

var is_lava_started: bool = false

func start_lava() -> void:
	is_lava_started = true
	lava.get_node("AnimationPlayer").play("rise")
