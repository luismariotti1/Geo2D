extends Node

var figures = [] setget , get_figures
var new_object = false
var position_list 
var remove_object = false

func get_figures():
	return figures


func deselect():
	for i in range(figures.size()):
		figures[i].set_is_selected(false)

func set_position():
	for i in range(figures.size()):
		if figures[i].get_is_selected():
			position_list = i
			break
			
func get_position():
	return position_list
