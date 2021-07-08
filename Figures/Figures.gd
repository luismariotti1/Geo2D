extends Control

onready var CP = get_node("/root/CartesianPlane")
onready var Insp = get_node("/root/SetInspector")
var line_width = 2
var color = ColorN("red")
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


func create_dic_to_properties():
	info = [
		{"id": "rotation", "label": "rotation", "value": rotation},
		{"id": "line_width", "label": "line width", "value": line_width},
		{
			"listLabel": "Translate",
			"type": "list",
			"infos":
			[
				{"id": "coord_x", "label": "X", "value": coord_x},
				{"id": "coord_y", "label": "Y", "value": coord_y}
			]
		},
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


func init(position: Vector2):
	coord_x = position.x
	coord_y = position.y


func set_properties_in_inspector():
	Insp.init_properties(info)


func update_values():
	filled = false
	scaleX = Insp.get_properties_by_id("scaleX")
	scaleY = Insp.get_properties_by_id("scaleY")
	rotation = Insp.get_properties_by_id("rotation")
	line_width = Insp.get_properties_by_id("line_width")
	coord_x = Insp.get_properties_by_id("coord_x")
	coord_y = Insp.get_properties_by_id("coord_y")
	translate = Vector2(coord_x, coord_y)


func _physics_process(delta):
	update_values()
	t = Transform2D(Vector2(-1, 0),Vector2(0, -1),Vector2(0, 0))
	t = t.rotated(deg2rad(float(rotation)))
	t = t.scaled(Vector2(scaleX, scaleY))
#	Cisalhamento
#	t.y = Vector2(1,1)
	t.origin = CP.convert_cartesian_to_pos(translate)
	update()


func custom_draw_polygon(
	vertex: PoolVector2Array, color: Color = Color(0, 0, 0, 1), line_width: float = 1.0
):
	for i in range(vertex.size()):
		if i == vertex.size() - 1:
			draw_line(vertex[i], vertex[0], color, line_width)
		else:
			draw_line(vertex[i], vertex[i + 1], color, line_width)
	for i in range(vertex.size()):
		draw_circle(vertex[i], 4, Color(0, 0, 0, 1))


func custom_draw_polygon_filled(
	vertex: PoolVector2Array, color: Color = Color(0, 0, 0, 1), line_width: float = 1.0
):
	draw_colored_polygon(vertex, color)
	for i in range(vertex.size()):
		draw_circle(vertex[i], 4, Color(0, 0, 0, 1))
