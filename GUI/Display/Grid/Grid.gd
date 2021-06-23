extends Control

var axis_center_position = Vector2.ZERO
var color = ColorN("black")
var clicked_position = null
var is_clicking = false
var distX = 0
var distY = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	axis_center_position = Vector2(rect_size.x/2, rect_size.y/2)

func _process(delta):
	update()
	if (is_clicking == true and clicked_position != null):
		axis_center_position.x = get_global_mouse_position().x+distX
		axis_center_position.y = get_global_mouse_position().y+distY

func _input(event):
	if event is InputEventMouseButton:
		if (event.pressed == true):
			is_clicking = true
			clicked_position = event.position
			distX = axis_center_position.x - clicked_position.x
			distY = axis_center_position.y - clicked_position.y
		else:
			is_clicking = false
			clicked_position = null

func create_axis():
	draw_line(Vector2(rect_position.x,axis_center_position.y), Vector2(rect_size.x,axis_center_position.y), color, 1.25, false)
	draw_line(Vector2(axis_center_position.x,rect_position.y), Vector2(axis_center_position.x,rect_size.y), color, 1.25, false)
	
func _draw():
	create_axis()
	
