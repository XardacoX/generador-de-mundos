tool
extends TileMap
enum tipo {plataformas,top_down}
var perlin=OpenSimplexNoise.new()
var canttiles

export (bool) var habilitado=true
export var map_size=Vector2(100,50)
export (tipo) var tipo_de_mapa
export (bool) var semilla_aleatoria=false
export (int) var semilla


func _ready():
	pass

func _process(delta):
	if Engine.editor_hint:
		if Input.is_action_just_pressed("ui_accept") and habilitado:
			canttiles=tile_set.get_tiles_ids().size()
			genMap()

func genMap():
	if semilla_aleatoria:
		perlin.seed=randi()
		semilla=perlin.seed
		print("Semilla: "+str(perlin.seed))
		
	else:
		perlin.seed=semilla
	clear()
	
	match tipo_de_mapa:
		tipo.plataformas:
			for x in range(map_size.x):
				var noise = perlin.get_noise_1d(x)
				noise=range_lerp(noise,-1,1,0,25)
#				set_cell(x,noise,0)
				
				for y in range(noise,map_size.y):
					var ruido=perlin.get_noise_2d(x,y)
					ruido=int(range_lerp(ruido,-1,1,0,23))
					
					if ruido==0:
						set_cell(x,y,randi()%canttiles)
						print("soy cero")
					elif ruido>1 and ruido<9:
						if ruido<5:
							set_cell(x,y,1)
						else:
							set_cell(x,y,2)
					elif ruido>9 and ruido<15:
						if ruido>13:
							set_cell(x,y,2)
						else:
							set_cell(x,y,1)
				
				
				set_cell(x,map_size.y,0)

		
		tipo.top_down:
			for x in range(map_size.x):
				for y in range(map_size.y):
					var ruido=perlin.get_noise_2d(x,y)
					ruido=range_lerp(ruido,-1,1,0,canttiles)
					set_cell(x,y,ruido)


