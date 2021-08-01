extends Control


func center_pop_up(popup):
	var popupSizeX = popup.get_margin(MARGIN_RIGHT) - popup.get_margin(MARGIN_LEFT)
	var popupSizeY = popup.get_margin(MARGIN_BOTTOM) - popup.get_margin(MARGIN_TOP)
	popup.margin_left = get_viewport().size.x / 2 - popupSizeX / 2
	popup.margin_right = popup.margin_left + popupSizeX
	popup.margin_top = get_viewport().size.y / 2 - popupSizeY / 2
	popup.margin_bottom = popup.margin_top + popupSizeY
