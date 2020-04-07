extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var cursor=$generador.world_to_map(get_global_mouse_position())
	$cursor.global_position=$generador.map_to_world(cursor)+Vector2(8,8)
	
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		if $generador.get_cellv(cursor)==-1:
			$generador.set_cellv(cursor,2)
	elif Input.is_mouse_button_pressed(BUTTON_RIGHT):
		if $generador.get_cellv(cursor)!=-1:
			$generador.set_cellv(cursor,-1)
