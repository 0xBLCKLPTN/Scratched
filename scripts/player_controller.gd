extends CharacterBody2D

@export var speed = 100

var target = position

func player():
	pass
	
	
func _input(event):
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	if velocity[0] > 0:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true
	# look_at(target)
	
	if position.distance_to(target) > 10:
		$AnimatedSprite2D.play("run")
		move_and_slide()
	else:
		$AnimatedSprite2D.play("idle")
		
