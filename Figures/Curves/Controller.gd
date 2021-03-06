extends Control

onready var CP = get_node("/root/CartesianPlane")

var radius = 5
var t = Transform2D.IDENTITY
var mouse_in = false
var is_clicking = false
var moving = false
var has_priority = false
var trying_to_move = false
var start
var cartesian_coord = Vector2(0, 0) setget set_coord, get_coord
var curve_selected
var _id setget , get_id


func get_id():
	return _id


func get_coord():
	return cartesian_coord


func set_coord(coord):
	cartesian_coord = Vector2(coord[0], coord[1])


func check_collision(pos):
	if pos.distance_to(get_global_mouse_position()) <= radius:
		mouse_in = true
	else:
		mouse_in = false


func init(id, coord):
	_id = id
	cartesian_coord = coord


func _process(_delta):
	t = Transform2D.IDENTITY
	var mouse_coord = CP.mouse_position_to_cartesian(get_global_mouse_position())
	if is_clicking and mouse_in and curve_selected:
		trying_to_move = true
		if has_priority:
			cartesian_coord = mouse_coord
			moving = true
	if ! mouse_in:
		if moving:
			cartesian_coord = mouse_coord
	t.origin = CP.convert_cartesian_to_pos(cartesian_coord)
	check_collision(t.origin)
	update()


func _input(event):
	if event.is_action_pressed("move_vertex"):
		is_clicking = true
	if event.is_action_released("move_vertex"):
		is_clicking = false
		mouse_in = false
		moving = false
		trying_to_move = false
		has_priority = false


func _draw():
	draw_set_transform_matrix(t)
	if curve_selected:
		draw_circle(Vector2(0, 0), radius, ColorN("green"))
	else:
		draw_circle(Vector2(0, 0), radius, ColorN("black"))
