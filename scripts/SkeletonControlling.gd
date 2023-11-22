extends CharacterBody2D

	
signal timeout

const TIME_PERIOD = 10.0 # 500ms
var left = false
var time = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("idle")


func _process(delta):
	time += delta
	if time > TIME_PERIOD:
		left = !left
		$AnimatedSprite2D.flip_h = left
		time = 0
		
