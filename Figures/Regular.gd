extends "res://Figures/Figures.gd"

var _type = "Regular" setget , get_type
var edge = 0 setget set_edge
var created_by_center = false setget set_created_by_center

func get_type():
	return _type

func set_created_by_center(boolean):
	created_by_center = boolean

func set_edge(value):
	edge = value


func update_local_values():
	if Insp.get_properties_by_id("edge"):
		edge = float(Insp.get_properties_by_id("edge"))


func _physics_process(_delta):
	if is_select:
		update_local_values()


func _draw():
	draw_set_transform_matrix(t)
	if ! filled:
		custom_draw_polygon()
	else:
		custom_draw_polygon_filled()


func custom_draw_polygon():
	var vertex_mod = convert_vertex_to_distance()
	for i in range(vertex_mod.size()):
		if i == vertex_mod.size() - 1:
			draw_line(vertex_mod[i], vertex_mod[0], color, line_width)
		else:
			draw_line(vertex_mod[i], vertex_mod[i + 1], color, line_width)
	for i in range(vertex_mod.size()):
		if is_select:
			draw_circle(vertex_mod[i], 4, selected_color)
		else:
			draw_circle(vertex_mod[i], 4, Color(0, 0, 0, 1))


func custom_draw_polygon_filled():
	var vertex_mod = convert_vertex_to_distance()
	draw_colored_polygon(vertex, color)
	for i in range(vertex_mod.size()):
		draw_circle(vertex_mod[i], 4, Color(0, 0, 0, 1))
