extends Control

onready var CP = get_node("/root/CartesianPlane")
var l = 5;
var h = 2;
var line_width = 2.0;
var color = ColorN("red")

func _physics_process(delta):
	update()

func _draw():
	draw_rect (Rect2(CP.get_center_plane(),CP.convert_catersian_to_dist(Vector2(l,h))),color, false, 2.0, false )
