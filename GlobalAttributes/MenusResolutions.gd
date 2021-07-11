extends Node

var _menu_bar_res: Rect2
var _side_menu_res: Rect2
var _display_res: Rect2
var _inspector_res: Rect2 setget set_inspector_res, get_inspector_res
var _selection_res: Rect2 setget set_selection_res, get_selection_res

func _physics_process(_delta):
	_menu_bar_res = Rect2(Vector2.ZERO, Vector2(get_viewport().size.x, 30))
	_display_res = Rect2(
		Vector2(0, _menu_bar_res.size.y),
		Vector2(get_viewport().size.x - 256, get_viewport().size.y)
	)
	_side_menu_res = Rect2(
		Vector2(_display_res.size.x, _menu_bar_res.size.y),
		Vector2(get_viewport().size.x, get_viewport().size.y)
	)
	_selection_res = Rect2(Vector2(4,162), Vector2(254, 280+(_side_menu_res.size.y)*0.1))
	_inspector_res = Rect2(Vector2(9, _selection_res.size.y-5), Vector2(250,_side_menu_res.size.y-40))


func set_inspector_res(value):
	_inspector_res = value


func get_inspector_res():
	return _inspector_res


func set_selection_res(value):
	_selection_res = value


func get_selection_res():
	return _selection_res


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
