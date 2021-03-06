extends Control

# Singletons
onready var SM = get_node("/root/SelectionMenu")
onready var Insp = get_node("/root/SetInspector")
onready var CP = get_node("/root/CartesianPlane")

# Load Scenes
var button = load("res://GUI/Menus/SideMenu/Selection/SelectionObject/SelectionObject.tscn")
var controller = load("res://Figures/Curves/Controller.tscn")

#Properties
var transform = Transform2D.IDENTITY
var transform1 = Transform2D.IDENTITY
var points = PoolVector2Array()
var controllers = []
var degree = 1
var knots = []
var num_knots
var sub_division = 100
var num_controls
var selection_button = button.instance() setget , get_selection_button
var is_select = false setget set_is_selected, get_is_selected
var _id: int setget , get_id
var _figure_name = "" setget set_figure_name, get_figure_name
var translate = Vector2(0, 0)
var curve_ids
var insp_info: Array
var creating_by_mouse = false setget set_creating_by_mouse
var figure_ready = false
var rng = RandomNumberGenerator.new()


#getters and setters
func get_selection_button():
	return selection_button


func set_creating_by_mouse(boolean):
	creating_by_mouse = boolean


func get_id():
	return _id


func set_figure_name(new_name):
	_figure_name = new_name


func get_figure_name():
	return _figure_name


func set_properties_in_inspector():
	Insp.init_properties(insp_info)


func create_dic_to_properties():
	insp_info = [
		{"id": "degree", "label": "Degree", "value": degree},
	]


func select_figure():
	SM.deselect()
	Insp.set_properties(insp_info)
	Insp.reload_atributes = true
	selection_button.pressed = true
	is_select = true
	SM.set_position()


func set_is_selected(boolean):
	is_select = boolean
	if boolean == false:
		for control in controllers:
			control.curve_selected = false


func get_is_selected():
	return is_select


#methods 
func create_knots():
	knots.clear()
	var knot_remaining = num_knots
	for _i in range(degree + 1):
		knots.append(0)
	knot_remaining -= degree + 1
	var medium_knots = knot_remaining - (degree + 1)
	for i in range(knot_remaining - (degree + 1)):
		knots.append(float(i + 1) / (medium_knots + 1))
	for _i in range(degree + 1):
		knots.append(1)


func init(id, info = {}):
	_id = id
	if creating_by_mouse:
		num_controls = controllers.size()
		if num_controls < 3:
			degree = 0
		else:
			degree = 2
		_figure_name = "Curve (" + String(_id) + ")"
		selection_button.init(_figure_name, self)
		calculate_points()
		create_dic_to_properties()
		var list_of_controllers_insp = {"listLabel": "controllers", "type": "list", "infos": []}
		for i in range(controllers.size()):
			list_of_controllers_insp["infos"].insert(
				i,
				{
					"type": "double_atribute",
					"id": "controller" + String(i + 1),
					"label": "controller " + String(i + 1),
					"value": [controllers[i].get_coord().x, controllers[i].get_coord().y]
				}
			)
		insp_info.append(list_of_controllers_insp)
		set_properties_in_inspector()
		figure_ready = true
	else:
		degree = info["degree"]
		_figure_name = "Curve (" + String(_id) + ")"
		selection_button.init(_figure_name, self)
		num_controls = info["controls"].size()
		for i in range(num_controls):
			var new_control = controller.instance()
			new_control.init(i + 1, info["controls"][i])
			add_child(new_control)
			controllers.append(new_control)
		calculate_points()
		create_dic_to_properties()
		var list_of_controllers_insp = {"listLabel": "controllers", "type": "list", "infos": []}
		for i in range(controllers.size()):
			list_of_controllers_insp["infos"].insert(
				i,
				{
					"type": "double_atribute",
					"id": "controller" + String(i + 1),
					"label": "controller " + String(i + 1),
					"value": [controllers[i].get_coord().x, controllers[i].get_coord().y]
				}
			)
		insp_info.append(list_of_controllers_insp)
		set_properties_in_inspector()
		figure_ready = true


func calculate_points():
	num_knots = num_controls + degree + 1
	create_knots()
	points = PoolVector2Array()
	var u = 0
	for _i in range(0, sub_division + 1):
		points.push_back(bspline(u, knots, controllers, degree))
		u += float(1) / sub_division
		if u >= 1:
			u = 0.999


func bias(x, k, i, t):
	if k == 0:
		return 1.0 if t[i] <= x and x < t[i + 1] else 0.0
	var c1
	if t[i + k] == t[i]:
		c1 = 0.0
	else:
		c1 = (x - t[i]) / (t[i + k] - t[i]) * bias(x, k - 1, i, t)
	var c2
	if t[i + k + 1] == t[i + 1]:
		c2 = 0.0
	else:
		c2 = (t[i + k + 1] - x) / (t[i + k + 1] - t[i + 1]) * bias(x, k - 1, i + 1, t)
	return c1 + c2


func bspline(x, t, controle, k):
	var n = len(t) - k - 1
	if (n >= k + 1) and (len(controle) >= n):
		var sum = Vector2(0, 0)
		for i in range(n):
			var b = bias(x, k, i, t)
			sum += controle[i].get_coord() * b
		return sum


func update_values():
	var new_degree = int(Insp.get_properties_by_id("degree"))
	if new_degree > 5:
		new_degree = 5
	if new_degree >= controllers.size():
		for _i in range(new_degree - controllers.size() + 1):
			var new_control = controller.instance()
			var new_rand_place_x = (
				controllers[controllers.size() - 1].get_coord().x
				+ rng.randf_range(-4, 4)
			)
			var new_rand_place_y = (
				controllers[controllers.size() - 1].get_coord().y
				+ rng.randf_range(-4, 4)
			)
			new_control.init(controllers.size() + 1, Vector2(new_rand_place_x, new_rand_place_y))
			var new_id = controllers.size()
			insp_info[1]["infos"].append(
				{
					"type": "double_atribute",
					"id": "controller" + String(new_id + 1),
					"label": "controller " + String(new_id + 1),
					"value":
					[
						new_rand_place_x,
						new_rand_place_y
					]
				}
			)
			add_child(new_control)
			controllers.append(new_control)
		Insp.reload_atributes = true
	else:
		degree = new_degree
	for i in range(controllers.size()):
		controllers[i].set_coord(Insp.get_properties_by_id("controller" + String(i + 1)))


func _physics_process(_delta):
	var controls_to_move = []
	if is_select:
		for control in controllers:
			control.curve_selected = true
			if control.trying_to_move == true:
				controls_to_move.append(control)
		if controls_to_move.size() > 0:
			var change_priority = true
			for ctm in controls_to_move:
				if ctm.moving == true:
					change_priority = false
			if change_priority:
				controls_to_move[0].has_priority = true
			Insp.set_properties_by_id(
				"controller" + String(controls_to_move[0].get_id()),
				[controls_to_move[0].get_coord().x, controls_to_move[0].get_coord().y]
			)
		else:
			update_values()
		calculate_points()
	else:
		if selection_button:
			selection_button.pressed = false
	update()
	transform = Transform2D.IDENTITY
	transform.origin = CP.convert_cartesian_to_pos(translate)
	transform1 = transform


func delete():
	is_select = false
	queue_free()
	controllers.clear()
	selection_button._remove = true
	SM.remove_object = true


func create_next_control(coord):
	var new_control = controller.instance()
	new_control.init(controllers.size() + 1, coord)
	add_child(new_control)
	controllers.append(new_control)


func _ready():
	rng.randomize()


func _draw():
	if figure_ready:
		draw_set_transform_matrix(transform)
		draw_polyline(CP.convert_array_of_coord_to_distance(points), ColorN("blue"), 3.0)
	draw_set_transform_matrix(transform1)
	for i in controllers.size() - 1:
		draw_line(
			CP.convert_catersian_to_dist(controllers[i].get_coord()),
			CP.convert_catersian_to_dist(controllers[i + 1].get_coord()),
			ColorN("black"),
			1.0
		)
