extends Control

var _start_position : Vector2 
var _size: Vector2

func init(start_position):
	_start_position = start_position
	
func set_tool_area(value):
	_size = value
	
func _physics_process(delta):
	update()

func _draw():
	draw_rect (Rect2(_start_position,_size), ColorN("black"), false,  true)
