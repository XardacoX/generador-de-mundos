extends KinematicBody2D
var velocidad=Vector2.ZERO
var gravedad=10

func _ready():
	pass

func _physics_process(delta):
	velocidad.y+=gravedad
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			velocidad.y=-325
	if Input.is_action_pressed("ui_right"):
		velocidad.x=200
	elif Input.is_action_pressed("ui_left"):
		velocidad.x=-200
	else:
		velocidad.x=0
	
	velocidad=move_and_slide(velocidad,Vector2.UP)
