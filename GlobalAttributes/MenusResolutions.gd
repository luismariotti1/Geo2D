extends Node

var _menu_bar_res: Rect2
var _side_menu_res: Rect2
var _display_res: Rect2


func _physics_process(delta):
	_menu_bar_res = Rect2(Vector2.ZERO, Vector2(get_viewport().size.x, 30))
	_display_res = Rect2(
		Vector2(0, _menu_bar_res.size.y),
		Vector2(get_viewport().size.x - 256, get_viewport().size.y)
	)
	_side_menu_res = Rect2(
		Vector2(_display_res.size.x, _menu_bar_res.size.y),
		Vector2(get_viewport().size.x, get_viewport().size.y)
	)


func get_menu_bar_res():
	return _menu_bar_res


func set_menu_bar_res(value):
	_menu_bar_res = value


func get_side_menu_res():
	return _side_menu_res


func set_side_menu_res(value):
	_side_menu_res = value


func get_display_res():
	return _display_res


func set_display_res(value):
	_display_res = value
