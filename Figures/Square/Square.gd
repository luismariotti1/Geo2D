extends Control

onready var CP = get_node("/root/CartesianPlane")
var l = 1;
var line_width = 2.0
var color = ColorN("red")
var t : Transform2D
var rotation = 45
var scaleX = 1
var scaleY = 1 

func _physics_process(delta):
	t = Transform2D.IDENTITY
	t = t.rotated(deg2rad(0))
	t = t.scaled(Vector2(scaleX,scaleY))
	t.origin = CP.convert_cartesian_to_pos(Vector2(4,0))
	update()

func _draw():
	draw_set_transform_matrix(t)
	draw_rect(Rect2(Vector2(0,0),CP.convert_catersian_to_dist(Vector2(l,l))),color, false, 2.0, false)

