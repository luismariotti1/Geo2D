extends Control

onready var CP = get_node("/root/CartesianPlane")
onready var Insp = get_node("/root/SetInspector")
var l = 1
var line_width = 2.0
var color = ColorN("red")
var t: Transform2D
var rotation = 0
var scaleX = 1
var scaleY = 1
var pivot = Vector2(-24, 24)
var translate = Vector2(0, 0)
var info: Array


func set_properties_in_inspector():
	info = [
		{"id": "rotation", "label": "rotation", "value": rotation},
		{
			"listLabel": "Scales",
			"type": "list",
			"infos":
			[
				{"id": "scaleX", "label": "X", "value": scaleX},
				{"id": "scaleY", "label": "Y", "value": scaleY}
			]
		},
	]
	Insp.init_properties(info)


func update_values():
	scaleX = Insp.get_properties_by_id("scaleX")
	scaleY = Insp.get_properties_by_id("scaleY")
	rotation = Insp.get_properties_by_id("rotation")


func _ready():
	set_properties_in_inspector()


func _physics_process(delta):
	update_values()
	t = Transform2D.IDENTITY
	t = t.rotated(deg2rad(float(rotation)))
	t = t.scaled(Vector2(scaleX, scaleY))
#	Cisalhamento
#	t.y = Vector2(1,1)
	t.origin = CP.convert_cartesian_to_pos(translate)
	update()


