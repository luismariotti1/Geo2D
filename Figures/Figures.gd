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
var selection_button = button.instance() setget , get_selection_button
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
var mirror_vertex: Vector2 setget set_mirror_vertex
var selected_color = ColorN("green")
var flip_x = false
var flip_y = false
var shear_x = false
var shear_y = false
var shear_value = 0


func select_figure():
	SM.deselect()
	Insp.set_properties(info)
	is_select = true
	SM.set_position()
	Insp.reload_atributes = true
	selection_button.pressed = true


func get_id():
	return _id


func set_mirror_vertex(mirror):
	mirror_vertex = mirror


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
	inital_pos = clicked_position
	set_coord_clicked()


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


func set_coord_clicked():
	var new_coord = CP.mouse_position_to_cartesian(inital_pos)
	coord_x = new_coord.x
	coord_y = new_coord.y
	translate = Vector2(coord_x, coord_y)


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


func flip():
	x_axis = Vector2(-1, 0) if flip_x else Vector2(1, 0)
	y_axis = Vector2(0, -1) if flip_y else Vector2(0, 1)


func update_values():
	filled = false
	var shear_var = Insp.get_properties_by_id("shear")
	shear_x = shear_var["X"]
	shear_y = shear_var["Y"]
	shear_value = shear_var["Porcent"]
	flip_x = bool(Insp.get_properties_by_id("flip")["X"])
	flip_y = bool(Insp.get_properties_by_id("flip")["Y"])
	scaleX = Insp.get_properties_by_id("scaleX")
	scaleY = Insp.get_properties_by_id("scaleY")
	rotation = Insp.get_properties_by_id("rotation")
	line_width = float(Insp.get_properties_by_id("line_width"))
	coord_x = float(Insp.get_properties_by_id("coord_x"))
	coord_y = float(Insp.get_properties_by_id("coord_y"))
	translate = Vector2(coord_x, coord_y)


func shear():
	if shear_x and shear_value != 0:
		t.x = Vector2(0, shear_value / 100) + x_axis
	elif shear_y and shear_value != 0:
		t.y = Vector2(shear_value / 100, 0) + y_axis


func convert_vertex_to_distance():
	var vertex_to_draw = []
	for i in range(vertex.size()):
		vertex_to_draw.append(CP.convert_catersian_to_dist(vertex[i]))
	return vertex_to_draw


func _physics_process(_delta):
	if is_select:
		update_values()
	else:
		if selection_button:
			selection_button.pressed = false

	#transformations
	flip()
	t = Transform2D(x_axis, y_axis, origin)
	shear()
	t = t.rotated(deg2rad(float(rotation)))
	t = t.scaled(Vector2(scaleX, scaleY))
	t.origin = CP.convert_cartesian_to_pos(translate)
	update()
