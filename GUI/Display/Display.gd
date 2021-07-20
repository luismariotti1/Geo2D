extends Control

onready var Res = get_node("/root/MenusResolutions")
onready var CP = get_node("/root/CartesianPlane")
onready var PN = get_node("/root/PanelInfo")
onready var Insp = get_node("/root/SetInspector")
onready var SM = get_node("/root/SelectionMenu")

var clicked_position = null
var is_clicking = false
var is_selecting = false
var selection_tool = load("res://GUI/Display/Tools/SelectionTool/SelectionTool.tscn")
var selection_area
var figures = []
var ids_avaiable = []
var creating = false


func _ready():
	SM.set_figures(figures)


func _process(_delta):
	update()
	set_margin(MARGIN_TOP, Res.get_menu_bar_res().position.y)
	set_margin(MARGIN_RIGHT, Res.get_display_res().size.x)
	set_margin(MARGIN_BOTTOM, Res.get_display_res().size.y)
	if is_clicking and is_in_display(clicked_position) and clicked_position != null:
		create_object()


func is_in_display(Position):
	if Position:
		if (
			Res.get_display_res().size.y > Position.y
			and Position.y > Res.get_menu_bar_res().size.y
			and Res.get_display_res().size.x > Position.x
			and Position.x > Res.get_display_res().position.x
		):
			return true
		else:
			return false


func create_object():
	var new_object = figures[figures.size() - 1]
	if new_object.get_type() == "Regular":
		new_object.save_inital_position(clicked_position)
		new_object.set_quadrant(
			rad2deg(clicked_position.angle_to_point(get_global_mouse_position()))
		)
		new_object.set_edge(
			(
				(
					clicked_position.distance_to(get_global_mouse_position())
					/ CP.get_cartesian_distance()
				)
				* 0.75
			)
		)


func _input(event):
	if PN.get_button_selected() != "":
		if event.is_action_pressed("move_vertex"):
			is_clicking = true
			clicked_position = event.position
			if is_in_display(clicked_position):
				var new_figure
				match PN.get_button_selected():
					"Square":
						new_figure = load("res://Figures/Square/Square.tscn").instance()
					"Triangle":
						new_figure = load("res://Figures/Triangle/Triangle.tscn").instance()
					"Hexagon":
						new_figure = load("res://Figures/Hexagon/Hexagon.tscn").instance()
					"Vertex":
						if creating == false:
							new_figure = load("res://Figures/Irregular.tscn").instance()
							add_child(new_figure)
							figures.append(new_figure)
							creating = true
						if creating:
							figures[figures.size() - 1].create_next_vertex(
								CP.mouse_position_to_cartesian(clicked_position)
							)
							if figures[figures.size() - 1]._is_ready == true:
								if ids_avaiable.size() > 0:
									figures[figures.size() - 1].init(ids_avaiable[0])
								else:
									figures[figures.size() - 1].init(figures.size() - 1)
								figures[figures.size() - 1].select_figure()
								creating = false

				if PN.get_button_selected() != "Vertex":
					add_child(new_figure)
					figures.append(new_figure)
					figures[figures.size() - 1].set_coord(
						CP.mouse_position_to_cartesian(clicked_position)
					)

	if event.is_action_released("move_vertex"):
		is_clicking = false
		if is_in_display(clicked_position):
			if figures.size() > 0 and figures[figures.size() - 1].get_type() == "Regular":
				if figures[figures.size() - 1].edge <= 0.2:
					figures[figures.size() - 1].queue_free()
					figures.remove(figures.size() - 1)
				else:
					if ids_avaiable.size() > 0:
						ids_avaiable.sort()
						figures[figures.size() - 1].init(ids_avaiable[0])
						ids_avaiable.remove(0)
					else:
						figures[figures.size() - 1].init(figures.size() - 1)

					figures[figures.size() - 1].select_figure()
					SM.new_object = true
					SM.set_position()
					Insp.reload_atributes = true

	if event.is_action_pressed("delete_figure") and figures.size() > 0:
		var position_list = SM.get_position()
		ids_avaiable.append(figures[position_list].get_id())
		figures[position_list].delete()
		figures[figures.size() - 1].set_is_selected(false)
		figures[position_list].queue_free()
		figures.remove(position_list)
		if figures.size() != 0:
			figures[figures.size() - 1].select_figure()
		else:
			Insp.clear()
			Insp.reload_atributes = true
