class_name Player extends CharacterBody2D

const SPEED: int = 130.0
const JUMP_VELOCITY: int = -300.0

var jump_count: int = 0
var jump_count_limit: int = 1

var is_death: bool = false

@onready var death_sound: AudioStreamPlayer2D = $DeathSound
@onready var jump_sound: AudioStreamPlayer2D = $JumpSound
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var coyote_timer: Timer = $CoyoteTimer

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")

	if !is_on_floor():
		velocity += get_gravity() * delta
		
	if Input.is_action_just_pressed("jump") && _is_jump_available():
		_jump()
		
	var was_on_floor: bool = is_on_floor()
	
	move_and_slide()

	if !was_on_floor and is_on_floor():
		jump_count = 0
		
	_update_animation(direction)
	_update_movement(direction)
	
	if was_on_floor and !is_on_floor():
		coyote_timer.start()

func _jump() -> void:
	if is_death:
		return
		
	jump_count += 1
	jump_sound.play()
	velocity.y = JUMP_VELOCITY

func _is_jump_available() -> bool:
	var has_jumps_left = jump_count < jump_count_limit
	return has_jumps_left || (is_on_floor() || !coyote_timer.is_stopped())

func _update_animation(direction: float) -> void:
	if is_death:
		return
		
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	if direction != 0:
		animated_sprite.flip_h = direction < 0

func _update_movement(direction: float) -> void:
	if is_death:
		velocity.x = 0
		return
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
func _death() -> void:
	print("Player die")
	is_death =  true
	death_sound.play()
	animated_sprite.play("death")
