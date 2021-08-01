extends Node

onready var Insp = get_node("/root/SetInspector")
onready var SM = get_node("/root/SelectionMenu")
var figures: Array
var Square = load("res://Figures/Square/Square.tscn")
var Triangle = load("res://Figures/Triangle/Triangle.tscn")
var Hexagon = load("res://Figures/Hexagon/Hexagon.tscn")
var ids_avaiable = []


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
	var new_figure = figures[figures.size() - 1]
	new_figure.save_inital_position(coord)
	new_figure.set_coord(coord)
	new_figure.set_center(edge)
	new_figure.set_edge(edge)
	new_figure.set_mirror_vertex(Vector2(1, 1))
	new_figure.init(choose_id())
	SM.new_object = true
	new_figure.select_figure()


func start_create_regular_by_mouse(figure_name, coord):
	var figure = get_figure(figure_name)
	figures = SM.get_figures()
	figures.append(figure)
	get_node("/root/Main/Layout/Display").add_child(figure)
	var new_figure = figures[figures.size() - 1]
	new_figure.save_inital_position(coord)

func choose_id():
	var id 
	if ids_avaiable.size() > 0:
		ids_avaiable.sort()
		id = ids_avaiable[0]
		ids_avaiable.remove(0)
		return id
	else:
		return figures.size() - 1


func finish_create_regular_by_mouse():
	var new_figure = figures[figures.size() - 1]
	if figures.size() > 0 and new_figure.get_type() == "Regular":
		if new_figure.edge <= 0.2:
			new_figure.queue_free()
			figures.remove(figures.size() - 1)
		else:
			new_figure.init(choose_id())

	SM.new_object = true
	new_figure.select_figure()
