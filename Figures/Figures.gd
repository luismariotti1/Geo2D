extends Control

# Singletons
onready var CP = get_node("/root/CartesianPlane")
onready var Insp = get_node("/root/SetInspector")
onready var SM = get_node("/root/SelectionMenu")

# Load Scenes
var button = load("res://GUI/Menus/SideMenu/Selection/SelectionObject/SelectionObject.tscn")

#Properties
var _id: int setget , get_id
var _figure_name = "" setget set_figure_name, get_figure_name
var is_select = false setget set_is_selected, get_is_selected
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
var inital_pos: Vector2
var mirror_vertex: Vector2
var selected_color = ColorN("green")
var flip_x = false
var flip_y = false


#Getters and Setters
func get_id():
	return _id


func set_is_selected(boolean):
	is_select = boolean


func get_is_selected():
	return is_select


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


#Methods
func start_coord(start):
	coord_x = start.x
	coord_y = start.y
	translate = Vector2(coord_x, coord_y)


func select_figure():
	SM.set_selected()
	Insp.set_properties(info)
	is_select = true
	Insp.reload_atributes = true


func create_dic_to_properties():
	info = [
		{"id": "rotation", "label": "rotation", "value": rotation},
		{"type": "checkbox", "id": "flip", "label": "Flip", "value": {"X": flip_x, "Y": flip_y}},
		{"id": "line_width", "label": "line width", "value": line_width},
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
	]


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


func flip():
	x_axis = Vector2(-1, 0) if flip_x else Vector2(1, 0)
	y_axis = Vector2(0, -1) if flip_y else Vector2(0, 1)


func update_values():
	filled = false
	flip_x = bool(Insp.get_properties_by_id("flip")["X"])
	flip_y = bool(Insp.get_properties_by_id("flip")["Y"])
	scaleX = Insp.get_properties_by_id("scaleX")
	scaleY = Insp.get_properties_by_id("scaleY")
	rotation = Insp.get_properties_by_id("rotation")
	line_width = float(Insp.get_properties_by_id("line_width"))
	coord_x = float(Insp.get_properties_by_id("coord_x"))
	coord_y = float(Insp.get_properties_by_id("coord_y"))
	translate = Vector2(coord_x, coord_y)



# func _draw():
# 	draw_set_transform_matrix(t)
# 	if ! filled:
# 		custom_draw_polygon()
# 	else:
# 		custom_draw_polygon_filled()


# func custom_draw_polygon():
# 	var vertex_mod = convert_vertex_to_distance()
# 	if vertex_mod.size() > 1:
# 		for i in range(vertex_mod.size()-1):
# 			draw_line(vertex_mod[i], vertex_mod[i+1], color, line_width)
# 		# if i == vertex_mod.size() - 1:
# 		# 	draw_line(vertex_mod[i], vertex_mod[0], color, line_width)
# 		# else:
# 	for i in range(vertex_mod.size()):
# 		draw_circle(vertex_mod[i], 4, Color(0, 0, 0, 1))
# 		# if is_select:
# 		# 	draw_circle(vertex_mod[i], 4, selected_color)
# 		# else:


# func custom_draw_polygon_filled():
# 	var vertex_mod = convert_vertex_to_distance()
# 	draw_colored_polygon(vertex, color)
# 	for i in range(vertex_mod.size()):
# 		draw_circle(vertex_mod[i], 4, Color(0, 0, 0, 1))
