extends Control

# Singletons
onready var SM = get_node("/root/SelectionMenu")
onready var Insp = get_node("/root/SetInspector")

# Load Scenes
var button = load("res://GUI/Menus/SideMenu/Selection/SelectionObject/SelectionObject.tscn")

#Properties
var transform = Transform2D.IDENTITY
var points = PoolVector2Array()
var controllers
var degree = 1
var knots = []
var num_knots
var sub_division = 100
var num_controls_min = 0
var num_controls = 4
var selection_button = button.instance() setget , get_selection_button
var is_select = false setget set_is_selected, get_is_selected
var _id: int setget , get_id
var _figure_name = "" setget set_figure_name, get_figure_name


#getters and setters
func get_selection_button():
	return selection_button


func get_id():
	return _id


func set_figure_name(new_name):
	_figure_name = new_name


func get_figure_name():
	return _figure_name


func select_figure():
	SM.deselect()
	# Insp.set_properties(info)
	Insp.reload_atributes = true
	selection_button.pressed = true
	is_select = true
	SM.set_position()


func set_is_selected(boolean):
	is_select = boolean


func get_is_selected():
	return is_select


#methods 
func create_knots():
	var knot_remaining = num_knots
	for _i in range(degree + 1):
		knots.append(0)
	knot_remaining -= degree + 1
	var medium_knots = knot_remaining - (degree + 1)
	for i in range(knot_remaining - (degree + 1)):
		knots.append(float(i + 1) / (medium_knots + 1))
	for _i in range(degree + 1):
		knots.append(1)


func init(id):
	_id = id
	_figure_name = "Curve (" + String(_id) + ")"
	selection_button.init(_figure_name, self)


func _ready():
	num_controls_min = degree + 1
	num_knots = num_controls + degree + 1
	create_knots()
	controllers = [Vector2(-4, -4), Vector2(-2, 4), Vector2(2, -4), Vector2(4, 4)]
	points = PoolVector2Array()
	var u = 0
	for _i in range(0, sub_division + 1):
		points.push_back(bspline(u, knots, controllers, degree) * 50)
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
			sum += controle[i] * b
		return sum


func _physics_process(_delta):
	if is_select:
		pass
		# update_values()
	else:
		if selection_button:
			selection_button.pressed = false
	transform = Transform2D.IDENTITY
	transform = transform.translated(Vector2(500, 250))


func _draw():
	draw_set_transform_matrix(transform)
	draw_polyline(points, ColorN("red"), 4.0)
	for control in controllers:
		draw_circle(control * 50, 5, ColorN("black"))
