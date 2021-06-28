extends Control

onready var CP = get_node("/root/CartesianPlane")
var l = 1;
var line_width = 2.0;
var color = ColorN("red")
var transform : Transform2D
var pivot : Vector2
var rot = 0.5
var scaled 

func _ready():
	transform = Transform2D.IDENTITY
	pivot = Vector2(0,0)

func _physics_process(delta):
#	rot += 0.5 * delta
#	var t = Transform2D(Vector2(1,0),Vector2(0,1),Vector2(0,0))
#	t.x.x = cos(rot)
#	t.y.y = cos(rot)
#	t.x.y = sin(rot)
#	t.y.x = -sin(rot)
	transform = Transform2D.IDENTITY.scaled(Vector2(2,2))
#	transform = t
	transform.origin = CP.convert_cartesian_to_pos(Vector2(1,1))
	print(transform)
	update()

func _draw():
	draw_set_transform_matrix (transform)
	draw_rect (Rect2(Vector2(0,0),CP.convert_catersian_to_dist(Vector2(l,l))),color, false, 2.0, false )
