class_name Slime extends CharacterBody2D

@export var gravity: int = 500
@export var max_fall_speed: int = 300

var direction: int = 1

@onready var ray_cast_right: RayCast2D = $RayCasts/RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCasts/RayCastLeft

@onready var animated_sprite: AnimatedSprite2D  = $AnimatedSprite2D

func _physics_process(delta: float) -> void:	
	var speed = %LevelManager.slime_speed
	
	if !is_on_floor():
		velocity += get_gravity() * delta
	
	if ray_cast_right.is_colliding() && direction == 1:
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding() && direction == -1:
		direction = 1
		animated_sprite.flip_h = false
		
	velocity.x = direction * speed
	
	move_and_slide()
	
