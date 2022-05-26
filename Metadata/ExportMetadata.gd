extends Node

static func get_planet_text(type):
	var file = File.new()
	file.open("res://texts.json", File.READ)
	var data_text = file.get_as_text()
	file.close()
	var parsed = JSON.parse(data_text).result
	if parsed.has(type):
		var arr = parsed[type]
		arr.shuffle()
		return arr[0]
	return ""

static func export_metadata(planet, colorscheme, pixels, background, type, nme):
	var csvFile = File.new()
	# general info
	csvFile.open("res://%s.csv"%nme, File.WRITE)
	csvFile.store_string("Type,Pixels")
	csvFile.store_string('\n')
	csvFile.store_string(type + ',')
	csvFile.store_string(str(pixels) + ',')
	csvFile.store_string('\n\n')
	
	# planet info
	csvFile.store_string("Colorscheme,")
	var shader_info = planet.get_material_properties()
	for v in shader_info.keys():
		csvFile.store_string(v+',')
	csvFile.store_string('\n')
	csvFile.store_string(colorscheme+',')
	for v in shader_info.keys():
		csvFile.store_string(str(shader_info[v]).replace(",", " ") + ',')
	csvFile.store_string('\n\n')
	
	# background info
	for v in background.keys():
		csvFile.store_string(v+',')
	csvFile.store_string('\n')
	for v in background.keys():
		csvFile.store_string(str(background[v]).replace(",", " ") + ',')
	csvFile.store_string('\n\n')
	
	# flavor text
	csvFile.store_string("Text")
	csvFile.store_string("\n")
	csvFile.store_string(get_planet_text(type))
	
	csvFile.close()
