extends Control

onready var Res = get_node("/root/MenusResolutions")

func _process(delta):
	set_margin(MARGIN_TOP, Res.get_selection_res().position.y)
	set_margin(MARGIN_LEFT, Res.get_selection_res().position.x)
	set_margin(MARGIN_RIGHT, Res.get_selection_res().size.x)
	set_margin(MARGIN_BOTTOM, Res.get_selection_res().size.y)
