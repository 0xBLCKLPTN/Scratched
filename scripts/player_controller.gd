extends CharacterBody2D

@export var speed = 100

var target = position
var action


func player():
	pass

# Just wrapper for AnimatedSprite2D object.
func animation_wrapper(action: String) -> void:
	$AnimatedSprite2D.play(action)


# Wrapper for actions.
func action_wrapper(action: String) -> void:
	if action == "run":
		animation_wrapper(action)
		# do something...
	elif action == "idle":
		animation_wrapper(action)
		# do something...




# Input handler.
func _input(event):
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()
		action = "run"


func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	if velocity[0] > 0:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true
		
	if position.distance_to(target) > 10:
		action_wrapper(action)
		move_and_slide()
	else:
		animation_wrapper("idle")
		
