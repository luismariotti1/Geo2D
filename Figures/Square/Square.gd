extends "res://Figures/Figures.gd"

var l = 1
var new_pivot = Vector2(float(l)/2, float(l)/2)

func _ready():
	create_dic_to_properties()
	info.insert(0,{"id": "l", "label": "edge", "value": l})
	set_properties_in_inspector()

func _physics_process(delta):
	var new_vertex = []
	new_vertex.append(CP.convert_catersian_to_dist(Vector2(0, 0)-new_pivot)) 
	new_vertex.append(CP.convert_catersian_to_dist(Vector2(0, l)-new_pivot))
	new_vertex.append(CP.convert_catersian_to_dist(Vector2(l, l)-new_pivot))
	new_vertex.append(CP.convert_catersian_to_dist(Vector2(l, 0)-new_pivot))
	vertex = new_vertex
	update_local_variables()

func update_local_variables():
	l = Insp.get_properties_by_id("l")

func _draw():
	draw_set_transform_matrix(t)
	if ! filled:
		custom_draw_polygon(vertex, color, float(line_width))
	else:
		custom_draw_polygon_filled(vertex, color)
