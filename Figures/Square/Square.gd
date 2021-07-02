extends Control

onready var CP = get_node("/root/CartesianPlane")
onready var Insp = get_node("/root/SetInspector")
var l = 1;
var line_width = 2.0
var color = ColorN("red")
var t : Transform2D
var rotation = 0
var scaleX = 1
var scaleY = 1
var pivot = Vector2(-24,24)
var translate = Vector2(0,0)
var info : Array

func set_properties_in_inspector():
	info = [
#		{"ids":["scaleX","sacaleY"], "listLabel":"lista", "labels":["scaleX:","scaleY"], "values":[scaleX,scaleY]},
		{"id":"scaleX", "label":"scaleX:", "value":scaleX},
		{"id":"scaleY", "label":"scaleY:", "value":scaleY},
		{"id":"rotation", "label":"rotation:", "value":rotation},
	]
	Insp.init_properties(info)

func _adjust_variable_by_id(variable, dictionary, id):
	if dictionary["id"] == id:
		return dictionary["value"]
	else:
		return variable

func update_values():
	for i in range(info.size()):
		scaleX = _adjust_variable_by_id(scaleX, info[i], "scaleX")
		scaleY = _adjust_variable_by_id(scaleY, info[i],"scaleY")
		rotation = _adjust_variable_by_id(rotation, info[i],"rotation")

func _ready():
	set_properties_in_inspector()

func _physics_process(delta):
	update_values()
	t = Transform2D.IDENTITY
	t = t.rotated(deg2rad(float(rotation)))
	t = t.scaled(Vector2(scaleX,scaleY))
#	Cisalhamento
#	t.y = Vector2(1,1)
	t.origin = CP.convert_cartesian_to_pos(translate)
	update()

func _draw():
	draw_set_transform_matrix(t)
	draw_rect(Rect2(pivot,CP.convert_catersian_to_dist(Vector2(l,l))),color,false, 2.0, false)

