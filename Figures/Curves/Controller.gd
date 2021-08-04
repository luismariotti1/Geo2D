extends Control

onready var CP = get_node("/root/CartesianPlane")

var radius = 5
var t = Transform2D.IDENTITY
var position = Vector2(0, 0)
var mouse_in = false
var is_clicking = false
var moving = false
var start
var cartesian_position = position

func check_collision(pos):
	if pos.distance_to(get_global_mouse_position()) <= radius:
		mouse_in = true
	else:
		mouse_in = false

func _process(_delta):
	t = Transform2D.IDENTITY
	var mouse_coord = CP.mouse_position_to_cartesian(get_global_mouse_position())
	if is_clicking and mouse_in:
		cartesian_position = mouse_coord
		moving = true
	if ! mouse_in:
		if moving:
			cartesian_position = mouse_coord
	t.origin = CP.convert_cartesian_to_pos(cartesian_position)
	check_collision(t.origin)
	update()


func _input(event):
	if event.is_action_pressed("move_vertex"):
		is_clicking = true
	if event.is_action_released("move_vertex"):
		is_clicking = false
		mouse_in = false
		moving = false


func _draw():
	draw_set_transform_matrix(t)
	draw_circle(position, radius, ColorN("black"))
