extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_margin(MARGIN_RIGHT,get_viewport().size.x-256)
