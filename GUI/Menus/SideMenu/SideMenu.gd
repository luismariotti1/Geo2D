extends Control

func _process(delta):
	set_margin(MARGIN_RIGHT,get_viewport().size.x)
	set_margin(MARGIN_LEFT,(get_viewport().size.x-256))
	set_margin(MARGIN_BOTTOM,get_viewport().size.y)
