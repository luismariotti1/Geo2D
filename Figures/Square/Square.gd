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

func set_properties_in_inspector():
	var info = {
	"scaleX":scaleX, 
	"scaleY":scaleY, 
	"rotation":rotation
	}
	Insp.init_properties(info)

func _ready():
	set_properties_in_inspector()
	
func update_values():
	scaleX = Insp.get_properties()["scaleX"]
	scaleY = Insp.get_properties()["scaleY"]
	rotation = Insp.get_properties()["rotation"]

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

