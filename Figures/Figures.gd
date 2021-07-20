extends Control

onready var CP = get_node("/root/CartesianPlane")
onready var Insp = get_node("/root/SetInspector")
onready var SM = get_node("/root/SelectionMenu")

var button = load("res://GUI/Menus/SideMenu/Selection/SelectionObject/SelectionObject.tscn")
var _id: int setget , get_id
var _figure_name = "" setget set_figure_name, get_figure_name
var is_select = false setget set_is_selected, get_is_selected
var edge = 0 setget set_edge
var selection_button: Button setget , get_selection_button
var line_width = 2
var color = ColorN("blue")
var t: Transform2D
var rotation = 0
var scaleX = 1
var scaleY = 1
var coord_x: float
var coord_y: float
var translate = Vector2(0, 0)
var info: Array
var filled = false
var vertex = PoolVector2Array()
var x_axis = Vector2(1, 0)
var y_axis = Vector2(0, 1)
var origin = Vector2(0, 0)
var set_inspector = false
var new_pivot = Vector2(0, 0)
var vertice = Vector2(1, 1)
var ready = false
var inital_pos: Vector2
var mirror_vertex: Vector2
var selected_color = ColorN("green")
var flip_x = false
var flip_y = false
var shear_x = false
var shear_y = false
var shear_value = 0


func select_figure():
	SM.set_selected()
	Insp.set_properties(info)
	is_select = true
	SM.set_position()
	Insp.reload_atributes = true


func get_id():
	return _id


func set_is_selected(boolean):
	is_select = boolean


func get_is_selected():
	return is_select


func set_edge(value):
	edge = value


func set_figure_name(new_name):
	_figure_name = new_name


func get_figure_name():
	return _figure_name


func get_selection_button():
	return selection_button


func save_inital_position(clicked_position):
	inital_pos = CP.mouse_position_to_cartesian(clicked_position)


func _ready():
	selection_button = button.instance()


func _draw():
	draw_set_transform_matrix(t)
	if ! filled:
		custom_draw_polygon()
	else:
		custom_draw_polygon_filled()


func delete():
	selection_button._remove = true
	SM.remove_object = true


func create_dic_to_properties():
	info = [
		{"id": "rotation", "label": "Rotation", "value": rotation},
		{"type": "checkbox", "id": "flip", "label": "Flip", "value": {"X": flip_x, "Y": flip_y}},
		{"id": "line_width", "label": "Line Width", "value": line_width},
		{
			"listLabel": "Translate",
			"type": "list",
			"infos":
			[
				{"id": "coord_x", "label": "X", "value": coord_x},
				{"id": "coord_y", "label": "Y", "value": coord_y},
			]
		},
		{
			"listLabel": "Scales",
			"type": "list",
			"infos":
			[
				{"id": "scaleX", "label": "X", "value": scaleX},
				{"id": "scaleY", "label": "Y", "value": scaleY},
			]
		},
		{
			"listLabel": "Shear",
			"type": "list",
			"infos":
			[
				{
					"type": "shear",
					"id": "shear",
					"label": "Shear",
					"value": {"X": shear_x, "Y": shear_y, "Porcent": shear_value}
				}
			]
		},
	]


func set_coord(value):
	coord_x = value.x
	coord_y = value.y
	translate = Vector2(coord_x, coord_y)


func set_quadrant(angle):
	if angle >= 0 and angle <= 90:
		mirror_vertex = Vector2(-1, 1)
	elif angle < 0 and angle >= -90:
		mirror_vertex = Vector2(-1, -1)
	elif angle < -90 and angle >= -180:
		mirror_vertex = Vector2(1, -1)
	else:
		mirror_vertex = Vector2(1, 1)


func set_properties_in_inspector():
	Insp.init_properties(info)


func update_values():
	filled = false
	var shear_var = Insp.get_properties_by_id("shear")
	shear_x = shear_var["X"]
	shear_y = shear_var["Y"]
	shear_value = shear_var["Porcent"]
	flip_x = bool(Insp.get_properties_by_id("flip")["X"])
	flip_y = bool(Insp.get_properties_by_id("flip")["Y"])
	edge = float(Insp.get_properties_by_id("edge"))
	scaleX = Insp.get_properties_by_id("scaleX")
	scaleY = Insp.get_properties_by_id("scaleY")
	rotation = Insp.get_properties_by_id("rotation")
	line_width = float(Insp.get_properties_by_id("line_width"))
	coord_x = float(Insp.get_properties_by_id("coord_x"))
	coord_y = float(Insp.get_properties_by_id("coord_y"))
	translate = Vector2(coord_x, coord_y)


func flip():
	x_axis = Vector2(-1, 0) if flip_x else Vector2(1, 0)
	y_axis = Vector2(0, -1) if flip_y else Vector2(0, 1)


func shear():
	if shear_x and shear_value != 0:
		t.x = Vector2(1, shear_value/100)
	elif shear_y and shear_value != 0:
		t.y = Vector2(shear_value/100, 1)


func _physics_process(_delta):
	if is_select:
		selection_button.pressed = true
		update_values()
	else:
		selection_button.pressed = false
	flip()
	t = Transform2D(x_axis, y_axis, origin)
	shear()
	t = t.rotated(deg2rad(float(rotation)))
	t = t.scaled(Vector2(scaleX, scaleY))
	t.origin = CP.convert_cartesian_to_pos(translate)
	update()


func convert_vertex_to_distance():
	var vertex_to_draw = []
	for i in range(vertex.size()):
		vertex_to_draw.append(CP.convert_catersian_to_dist(vertex[i]))
	return vertex_to_draw


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
