extends Control

onready var background = $CanvasLayer/Background
onready var starstuff = $StarStuff
onready var nebulae = $Nebulae
onready var particles = $StarParticles
onready var starcontainer = $StarContainer
onready var planetcontainer = $PlanetContainer
onready var planet_scene = preload("res://BackgroundGenerator/Planet.tscn")
onready var big_star_scene = preload("res://BackgroundGenerator/BigStar.tscn")

var should_tile = false
var reduce_background = false
var mirror_size = Vector2(200,200)

export (GradientTexture) var colorscheme
var planet_objects = []
var star_objects = []
var colorscheme_name = "Borkfest"

#func _ready():
#	_set_new_colors(colorscheme, background_color)

func get_info():
	return {
		"tiled": should_tile,
		"reduce_background": reduce_background,
		"background_seed": $StarStuff.material.get_shader_param("seed"),
		"background_pixels": $StarStuff.material.get_shader_param("pixels"),
		"background_dust_octaves": $StarStuff.material.get_shader_param("OCTAVES"),
		"background_dust_size": $StarStuff.material.get_shader_param("size"),
		"background_nebulae_octaves": $Nebulae.material.get_shader_param("OCTAVES"),
		"background_nebulae_size": $Nebulae.material.get_shader_param("size"),
		"backgroud_colorscheme": colorscheme_name,
		"backgroud_stars_visible": starcontainer.visible,
		"backgroud_dust_visible": starstuff.visible,
		"backgroud_nebulae_visible": $Nebulae.visible,
		"backgroud_planets_visible": planetcontainer.visible
	}

func set_mirror_size(new):
	mirror_size = new

func toggle_tile():
	should_tile = !should_tile
	starstuff.material.set_shader_param("should_tile", should_tile)
	nebulae.material.set_shader_param("should_tile", should_tile)
	
	_make_new_planets()
	_make_new_stars()

func toggle_reduce_background():
	reduce_background = !reduce_background
	starstuff.material.set_shader_param("reduce_background", reduce_background)
	nebulae.material.set_shader_param("reduce_background", reduce_background)

func set_pixel_size(size):
	starstuff.material.set_shader_param("pixels", size)
	nebulae.material.set_shader_param("pixels", size)
	particles.process_material.set_shader_param("emission_box_extents", Vector3(size * 0.5, size*0.5,1.0))
	rect_size = Vector2(size,size)

func generate_new(sd):
	seed(sd)
	starstuff.material.set_shader_param("seed", rand_range(1.0, 10.0))
	starstuff.material.set_shader_param("pixels", max(rect_size.x, rect_size.y))
	
	var aspect = Vector2(1,1)
	if rect_size.x > rect_size.y:
		aspect = Vector2(rect_size.x / rect_size.y, 1.0)
	else:
		aspect = Vector2(1.0, rect_size.y / rect_size.x)
	
	starstuff.material.set_shader_param("uv_correct", aspect)
	nebulae.material.set_shader_param("seed", rand_range(1.0, 10.0))
	nebulae.material.set_shader_param("pixels", max(rect_size.x, rect_size.y))
	nebulae.material.set_shader_param("uv_correct", aspect)
	
	particles.speed_scale = 1.0
	particles.amount = 1
	particles.position = rect_size * 0.5
	particles.process_material.set_shader_param("emission_box_extents", Vector3(rect_size.x * 0.5, rect_size.y*0.5,1.0))
	
	var p_amount = (rect_size.x * rect_size.y) / 150
	particles.amount = max(randi()%int(max(p_amount * 0.75 + p_amount * 0.25, 1)), 1)

	$PauseParticles.start()
	
	_make_new_planets()
	_make_new_stars()

func _make_new_stars():
	for s in star_objects:
		s.queue_free()
	star_objects = []
	
	var star_amount = int(max(rect_size.x, rect_size.y) / 20)
	star_amount = max(star_amount, 1)
	for i in randi()%star_amount:
		_place_big_star()
	
func _make_new_planets():
	for p in planet_objects:
		p.queue_free()
	planet_objects = []

	var planet_amount = 5#int(rect_size.x * rect_size.y) / 8000
	for i in randi()%planet_amount:
		_place_planet()

func set_new_colors(new_scheme, new_background, scheme_name):
	colorscheme = new_scheme
	colorscheme_name = scheme_name

	starstuff.material.get_shader_param("colorscheme").gradient.colors = colorscheme
	nebulae.material.get_shader_param("colorscheme").gradient.colors = colorscheme
	nebulae.material.set_shader_param("background_color", new_background)
	
	particles.process_material.get_shader_param("colorscheme").gradient.colors = colorscheme
	for p in planet_objects:
		p.material.get_shader_param("colorscheme").gradient.colors = colorscheme
	for s in star_objects:
		s.material.get_shader_param("colorscheme").gradient.colors = colorscheme

func _place_planet():
	var min_size = min(rect_size.x, rect_size.y)
	var scale = Vector2(1,1)*(rand_range(0.2, 0.7)*rand_range(0.5, 1.0)*min_size*0.005)
	
	var pos = Vector2()
	if (should_tile):
		var offs = scale.x * 100.0 * 0.5
		pos = Vector2(int(rand_range(offs, rect_size.x - offs)), int(rand_range(offs, rect_size.y - offs)))
	else:
		pos = Vector2(int(rand_range(0, rect_size.x)), int(rand_range(0, rect_size.y)))
	
	var planet = planet_scene.instance()
	planet.scale = scale
	planet.position = pos
	planetcontainer.add_child(planet)
	planet_objects.append(planet)

func _place_big_star():
	var pos = Vector2()
	if (should_tile):
		var offs = 10.0
		pos = Vector2(int(rand_range(offs, rect_size.x - offs)), int(rand_range(offs, rect_size.y - offs)))
	else:
		pos = Vector2(int(rand_range(0, rect_size.x)), int(rand_range(0, rect_size.y)))
	
	var star = big_star_scene.instance()
	star.position = pos
	starcontainer.add_child(star)
	star_objects.append(star)

func _on_PauseParticles_timeout():
	particles.speed_scale = 0.0

func set_background_color(c):
	background.color = c
	nebulae.material.set_shader_param("background_color", c)

func toggle_dust():
	starstuff.visible = !starstuff.visible

func toggle_stars():
	starcontainer.visible = !starcontainer.visible
	particles.visible = !particles.visible

func toggle_nebulae():
	$Nebulae.visible = !$Nebulae.visible

func toggle_planets():
	planetcontainer.visible = !planetcontainer.visible

func toggle_transparancy():
	$CanvasLayer/Background.visible = !$CanvasLayer/Background.visible
