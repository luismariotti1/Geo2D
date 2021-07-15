extends Control

onready var Res = get_node("/root/MenusResolutions")

func _process(_delta):
	set_margin(MARGIN_TOP, Res.get_side_menu_res().position.y)
	set_margin(MARGIN_LEFT, Res.get_side_menu_res().position.x)
	set_margin(MARGIN_RIGHT, Res.get_side_menu_res().size.x)
	set_margin(MARGIN_BOTTOM, Res.get_side_menu_res().size.y)
	
