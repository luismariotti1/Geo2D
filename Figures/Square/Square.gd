extends Control

onready var CP = get_node("/root/CartesianPlane")
var l = 48;
var line_width = 2.0;
var color = ColorN("red")

func _ready():
	l = CP.convert_catersian_to_dist(Vector2(4,0)).x

func _physics_process(delta):
	update()

func _draw():
	var axis_center_position = Vector2(	get_parent().get_rect().size.x/2, get_parent().get_rect().size.y/2 - l)
	draw_rect ( Rect2(axis_center_position,Vector2(l,l)),color, false, 2.0, false )
