extends "res://Planets/Planet.gd"


func set_pixels(amount):
	$Land.material.set_shader_param("pixels", amount)
	$Land.rect_size = Vector2(amount, amount)
func set_light(pos):
	$Land.material.set_shader_param("light_origin", pos)
func set_seed(sd):
	var converted_seed = sd%1000/100.0
	$Land.material.set_shader_param("seed", converted_seed)
func get_seed():
	return $Land.material.get_shader_param("seed")
func set_rotate(r):
	$Land.material.set_shader_param("rotation", r)
func update_time(t):
	$Land.material.set_shader_param("time", t * get_multiplier($Land.material) * 0.02)
func set_custom_time(t):
	$Land.material.set_shader_param("time", t * get_multiplier($Land.material))

func set_dither(d):
	$Land.material.set_shader_param("should_dither", d)

func get_dither():
	return $Land.material.get_shader_param("should_dither")

func get_colors():
	return _get_colors_from_gradient($Land.material, "colors")

func set_colors(colors):
	_set_colors_from_gradient($Land.material, "colors", colors)

func randomize_colors():
	var seed_colors = _generate_new_colorscheme(5 + randi()%3, rand_range(0.3, 0.65), 1.0)
	var cols=[]
	for i in 5:
		var new_col = seed_colors[i].darkened(i/5.0)
		new_col = new_col.lightened((1.0 - (i/5.0)) * 0.2)

		cols.append(new_col)

	set_colors(cols)

func get_material_properties():
	var m = $Land.material
	return {
		"pixels": m.get_shader_param("pixels"),
		"light_distance": m.get_shader_param("light_distance1"),
		"light_distance2": m.get_shader_param("light_distance2"),
		"light_origin": m.get_shader_param("light_origin"),
		"rotation": m.get_shader_param("rotation"),
		"seed": m.get_shader_param("seed"),
		"fbm_octaves": m.get_shader_param("OCTAVES"),
		"fbm_size": m.get_shader_param("size"),
		"dither_size": m.get_shader_param("dither_size"),
		"dithered": m.get_shader_param("should_dither"),
	}
