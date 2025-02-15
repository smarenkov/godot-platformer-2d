extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite: AnimatedSprite2D =  $AnimatedSprite2D
@onready var coyote_timer: Timer =  $CoyoteTimer

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	var is_jump_available: bool = is_on_floor() || !coyote_timer.is_stopped()
	
	if !is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") && is_jump_available:
		velocity.y = JUMP_VELOCITY
		
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else: 
			animated_sprite.play("run")
	else: 
		animated_sprite.play("jump")
		
	if direction < 0:
		animated_sprite.flip_h = true
	elif direction > 0:
		animated_sprite.flip_h = false

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var was_on_floor: bool = is_on_floor()
	
	move_and_slide()
	
	if was_on_floor and  !is_on_floor():
		print("Start coyot timer")
		coyote_timer.start()


func _on_label_ready() -> void:
	pass # Replace with function body.
