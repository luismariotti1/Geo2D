extends Node

var figures = [] setget set_figures, get_figures
var new_object = false


func set_figures(Figurelist):
	figures = Figurelist


func get_figures():
	return figures


func set_selected():
	for i in range(figures.size()):
		figures[i].set_is_selected(false)
