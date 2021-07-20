extends "res://Figures/Figures.gd"

var _type = "Irregular" setget , get_type
var _is_ready = false
var geometry = Geometry
var new_line: PoolVector2Array
var can_create_vertex = true

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
		if can_create_vertex:
			vertex.append(pos - inital_pos)
			if inital_pos.distance_to(pos) <= 0.2 and vertex.size() > 2:
				set_ready()


func _physics_process(_delta):
	if is_select:
		selection_button.pressed = true
		update_values()
	else:
		selection_button.pressed = false
	can_create_new_vertex()
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
	
func valid_position(line):
	var can_draw = true
	if vertex.size() > 1:
		for i in range(vertex.size()-2):
			var other_line = PoolVector2Array()
			for j in range(2):
				other_line.append(CP.convert_catersian_to_dist(vertex[i+j]))
			if geometry.segment_intersects_segment_2d(other_line[0],other_line[1],line[0],line[1]) != null:
				can_draw = false
				break
			other_line.resize(0)
	return can_draw
	
func valid_angle(new_point):
	var theta1 = new_point[0].angle_to_point(new_point[1])
	var theta2 = new_point[0].angle_to_point(vertex[vertex.size()-2])
	theta1 = rad2deg(theta1)
	theta2 = rad2deg(theta2)
	if abs((theta1 - theta2)) < 4:
		return false
	else:
		return true

func pre_render(vertex_mod):
	var next_position = CP.mouse_position_to_cartesian(get_global_mouse_position()) - inital_pos
	new_line = PoolVector2Array([vertex_mod[vertex_mod.size()-1], CP.convert_catersian_to_dist(next_position)])
	if can_create_vertex:	
		color = ColorN("blue")
	else:
		color = ColorN("red")
	draw_line(new_line[0], new_line[1], color, line_width)
	draw_circle(new_line[1], 4, Color(0, 0, 0, 1))		

func can_create_new_vertex():
	var next_position = CP.mouse_position_to_cartesian(get_global_mouse_position()) - inital_pos
	if vertex.size() > 1:
		if valid_angle(PoolVector2Array([vertex[vertex.size()-1], next_position])) and valid_position(new_line):
			can_create_vertex = true
		else:
			can_create_vertex = false


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
