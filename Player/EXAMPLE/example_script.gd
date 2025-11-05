extends CharacterBody2D

@export var MAX_SPEED = 160.0
@export var ACCELERATION = 15.0
@export var FRICTION = 10.0

func _physics_process(delta: float) -> void:
	var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	var vel_change = ACCELERATION if input_vector != Vector2.ZERO else FRICTION
	
	velocity.x = lerp(velocity.x, input_vector.x * MAX_SPEED, vel_change * delta)
	velocity.y = lerp(velocity.y, input_vector.y * MAX_SPEED, vel_change * delta)
	
	move_and_slide()