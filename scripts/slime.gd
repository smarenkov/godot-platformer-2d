extends Node2D

@export var speed: int = 20
@export var gravity: int = 500
@export var max_fall_speed: int = 300

var velocity: Vector2 = Vector2.ZERO
var direction: int = 1

@onready var ray_cast_ground: RayCast2D = $RayCasts/RayCastGround
@onready var ray_cast_right: RayCast2D = $RayCasts/RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCasts/RayCastLeft

@onready var animated_sprite: AnimatedSprite2D  = $AnimatedSprite2D

func _physics_process(delta: float) -> void:	
	if ray_cast_right.is_colliding() && direction == 1:
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding() && direction == -1:
		direction = 1
		animated_sprite.flip_h = false
		
	if not ray_cast_ground.is_colliding():
		velocity.y += gravity * delta
		velocity.y = min(velocity.y, max_fall_speed)
	else:
		velocity.y = 0
		
	velocity.x = direction * speed
	position += velocity * delta
	
