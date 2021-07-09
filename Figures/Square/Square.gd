extends "res://Figures/Figures.gd"

var new_pivot = Vector2(0, 0)
var edge = 0


func init():
	print(coord_x, coord_y)
	create_dic_to_properties()
	info.insert(0, {"id": "edge", "label": "edge", "value": edge})
	set_properties_in_inspector()

func set_edge(value):
	edge = value

func _physics_process(_delta):
	var new_vertex = []
	# new_pivot = Vector2(float(l)/2, float(l)/2)
	new_vertex.append(CP.convert_catersian_to_dist(Vector2(0, 0) - new_pivot))
	new_vertex.append(CP.convert_catersian_to_dist(Vector2(0, edge) - new_pivot))
	new_vertex.append(CP.convert_catersian_to_dist(Vector2(edge, edge) - new_pivot))
	new_vertex.append(CP.convert_catersian_to_dist(Vector2(edge, 0) - new_pivot))
	vertex = new_vertex
	if is_select:
		update_local_variables()


func update_local_variables():
	edge = float(Insp.get_properties_by_id("edge"))


func _draw():
	draw_set_transform_matrix(t)
	if ! filled:
		custom_draw_polygon(vertex, color, float(line_width))
	else:
		custom_draw_polygon_filled(vertex, color)
