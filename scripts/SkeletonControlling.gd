extends CharacterBody2D

	
signal timeout

@onready var player = $"../Player"


const TIME_PERIOD = 3.0 # 10sec
var speed = 25
var go = false
var left = false
var time = 0
var last_velocity


# Called when the node enters the scene tree for the first time.
func _ready():
	idle()


func _process(delta):
	#time += delta
	#if time > TIME_PERIOD:
	#		left = !left
	#	$AnimatedSprite2D.flip_h = left
	#	time = 0
	pass

func idle():
	$AnimatedSprite2D.speed_scale = 1
	$AnimatedSprite2D.play("idle")

func walk():
	$AnimatedSprite2D.speed_scale = 4
	$AnimatedSprite2D.play("walk")

func attack():
	$AnimatedSprite2D.play("attack")

func _physics_process(delta):
	if go == true:
		attack()
	else:
		idle()
		
	
func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		go = true


func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		go = false
