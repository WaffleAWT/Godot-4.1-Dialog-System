extends CharacterBody2D

var max_speed : int = 80
var acceleration : int = 500
var friction : int = 500

@onready var animator : AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	var input_vector : Vector2 = Vector2.ZERO
	input_vector.x = Input.get_axis("move_left", "move_right")
	input_vector.y = Input.get_axis("move_up", "move_down")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	move_and_slide()
	animate(input_vector)

func animate(input_vector):
	if input_vector != Vector2.ZERO:
		animator.play("Run")
		if input_vector.x > 0:
			animator.flip_h = false
		elif input_vector.x < 0:
			animator.flip_h = true
	else:
		animator.play("Idle")
