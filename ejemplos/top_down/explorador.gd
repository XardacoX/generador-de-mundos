extends KinematicBody2D


var velocidad=Vector2()
var vel=100


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	velocidad=Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocidad=Vector2.RIGHT
	elif Input.is_action_pressed("ui_left"):
		velocidad=Vector2.LEFT
	
	if Input.is_action_pressed("ui_up"):
		velocidad=Vector2.UP
	if Input.is_action_pressed("ui_down"):
		velocidad=Vector2.DOWN
	
	move_and_collide(velocidad*vel*delta)
