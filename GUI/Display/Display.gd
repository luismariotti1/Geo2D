extends Control

onready var Res = get_node("/root/MenusResolutions")
onready var CP = get_node("/root/CartesianPlane")

var clicked_position = null
var is_clicking = false
var is_selecting = false


func _process(delta):
	set_margin(MARGIN_TOP, Res.get_menu_bar_res().position.y)
	set_margin(MARGIN_RIGHT, Res.get_display_res().size.x)
	set_margin(MARGIN_BOTTOM, Res.get_display_res().size.y)
	move_vertex()
	update()

func is_in_display(Position):
	if Res.get_display_res().size.y > Position.y and Position.y > Res.get_menu_bar_res().size.y and Res.get_display_res().size.x > Position.x and Position.x > Res.get_display_res().position.x: 
		return true
	else:
		return false

func _input(event):
	if event.is_action_pressed("move_vertex"):
		is_clicking = true
		clicked_position = event.position
	if event.is_action_released("move_vertex"):
		is_clicking = false
		clicked_position = null


func move_vertex():
	if is_clicking == true and clicked_position != null:
		if is_in_display(get_global_mouse_position()):
			print(get_global_mouse_position())
#		print(get_global_mouse_position())
#		print(CP.convert_cartesian_to_pos(get_global_mouse_position()))

func _draw():
	if is_clicking:
		draw_rect(Rect2(clicked_position,Vector2(get_global_mouse_position().x, get_global_mouse_position().y)), Color(0,0,0,1))
