extends Control

onready var CP = get_node("/root/CartesianPlane")
var l = 1;
var line_width = 2.0
var color = ColorN("red")
var t : Transform2D
var rotate = false

func _ready():
	t = Transform2D(Vector2(1,0),Vector2(0,1),Vector2(0,0))

func _physics_process(delta):
#	rot += 0.5 * delta
	if rotate == false:
		t = t.rotated(deg2rad(180))
		print(t)
		rotate = true
#	t.x.x = cos(rot)
#	t.y.y = cos(rot)
#	t.x.y = sin(rot)
#	t.y.x = -sin(rot)
#	t.x *= 2
#	t.y *= 2
	t.origin = CP.convert_cartesian_to_pos(Vector2(0,0))
#	print(t)
	update()

func _draw():
	draw_set_transform_matrix(t)
	draw_rect(Rect2(Vector2(0,0),CP.convert_catersian_to_dist(Vector2(l,l))),color, false, 2.0, false)

