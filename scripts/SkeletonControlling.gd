extends CharacterBody2D

	
signal timeout

const TIME_PERIOD = 10.0 # 500ms
var left = false
var time = 0
var speed = 25
var target_position
@onready var player = $"../Player"

var go = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.speed_scale = 1
	$AnimatedSprite2D.play("idle")


func _process(delta):
	time += delta
	if time > TIME_PERIOD:
		left = !left
		$AnimatedSprite2D.flip_h = left
		time = 0
		
func _physics_process(delta):
	if go:
		velocity = (player.position - position).normalized() * speed
		$AnimatedSprite2D.speed_scale = 3
		$AnimatedSprite2D.play("walk")	
		move_and_slide()

	



func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		print("I see you!")
		go = true
	else:
		go = false
	
