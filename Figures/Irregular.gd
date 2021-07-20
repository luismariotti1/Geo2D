extends "res://Figures/Figures.gd"

var _type = "Irregular" setget , get_type
var _is_ready = false

func get_type():
	return _type


func set_ready():
	_is_ready = true
	vertex.remove(vertex.size() - 1)
	vertex.push_back(Vector2(0, 0))


func create_next_vertex(pos):
	if vertex.size() == 0:
		vertex.append(Vector2(0, 0))
		inital_pos = pos
		translate = inital_pos
	else:
		vertex.append(pos - inital_pos)
		if inital_pos.distance_to(pos) <= 0.2 and vertex.size() > 2:
			set_ready()
	print(_is_ready)


func _physics_process(_delta):
	if is_select:
		selection_button.pressed = true
		update_values()
	else:
		selection_button.pressed = false
	#transformations
	flip()
	t = Transform2D(x_axis, y_axis, origin)
	t = t.rotated(deg2rad(float(rotation)))
	t = t.scaled(Vector2(scaleX, scaleY))
	t.origin = CP.convert_cartesian_to_pos(translate)
	update()


func _draw():
	draw_set_transform_matrix(t)
	# if ! filled:
	custom_draw_polygon()
	# else:
	# 	custom_draw_polygon_filled()


func convert_vertex_to_distance():
	var vertex_to_draw = []
	for i in range(vertex.size()):
		vertex_to_draw.append(CP.convert_catersian_to_dist(vertex[i]))
	return vertex_to_draw


func pre_render(vertex_mod):
	var next_position = CP.mouse_position_to_cartesian(get_global_mouse_position()) - inital_pos
	print(vertex_mod[vertex_mod.size()-1])
	draw_line(vertex_mod[vertex_mod.size()-1], CP.convert_catersian_to_dist(next_position), color, line_width)

func custom_draw_polygon():
	var vertex_mod = convert_vertex_to_distance()
	if !_is_ready:
		pre_render(vertex_mod)
	if vertex_mod.size() > 1:
		for i in range(vertex_mod.size() - 1):
			draw_line(vertex_mod[i], vertex_mod[i + 1], color, line_width)
		# if i == vertex_mod.size() - 1:
		# 	draw_line(vertex_mod[i], vertex_mod[0], color, line_width)
		# else:
	for i in range(vertex_mod.size()):
		draw_circle(vertex_mod[i], 4, Color(0, 0, 0, 1))
		# if is_select:
		# 	draw_circle(vertex_mod[i], 4, selected_color)
		# else:
