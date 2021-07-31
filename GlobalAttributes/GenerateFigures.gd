extends Node

onready var Insp = get_node("/root/SetInspector")
onready var SM = get_node("/root/SelectionMenu")
var figures: Array
var Square = load("res://Figures/Square/Square.tscn")
var Triangle = load("res://Figures/Triangle/Triangle.tscn")
var Hexagon = load("res://Figures/Hexagon/Hexagon.tscn")


func get_figure(figure_name):
	match figure_name:
		"Square":
			return Square.instance()
		"Triangle":
			return Triangle.instance()
		"Hexagon":
			return Hexagon.instance()

func create_regular_by_menu(figure_name, coord, edge):
	var figure = get_figure(figure_name)
	figures = SM.get_figures()
	figures.append(figure)
	get_node("/root/Main/Layout/Display").add_child(figure)
	figure.set_created_by_center(true)
	figure.set_center(edge)
	figure.set_coord(coord)
	figure.set_edge(edge)
	figure.set_mirror_vertex(Vector2(1,1))
	figure.init(0)
	figure.select_figure()
	SM.new_object = true
	SM.set_position()
	Insp.reload_atributes = true


func create_regular_by_mouse():
	pass
