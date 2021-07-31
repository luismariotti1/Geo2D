extends Node

onready var Insp = get_node("/root/SetInspector")
onready var SM = get_node("/root/SelectionMenu")
var figures: Array


func create_regular(figure, coord, edge):
	figures = SM.get_figures()
	figures.append(figure)
	get_node("/root/Main/Layout/Display").add_child(figure)
	figure.set_coord(coord)
	figure.set_edge(edge)
	figure.set_quadrant(45)
	figure.init(0)
	figure.select_figure()
	SM.new_object = true
	SM.set_position()
	Insp.reload_atributes = true
