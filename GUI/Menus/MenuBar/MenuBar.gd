extends Control

onready var Res = get_node("/root/MenusResolutions")

func _process(_delta):
	set_margin(MARGIN_TOP, Res.get_menu_bar_res().position.y)
	set_margin(MARGIN_LEFT, Res.get_menu_bar_res().position.x)
	set_margin(MARGIN_RIGHT, Res.get_menu_bar_res().size.x)
	set_margin(MARGIN_BOTTOM, Res.get_menu_bar_res().size.y)
