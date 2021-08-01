extends Control

onready var Res = get_node("/root/MenusResolutions")
onready var CP = get_node("/root/CartesianPlane")
onready var PN = get_node("/root/PanelInfo")
onready var Insp = get_node("/root/SetInspector")
onready var SM = get_node("/root/SelectionMenu")
onready var GF = get_node("/root/GenerateFigures")

var clicked_position = null
var is_clicking = false
var is_selecting = false
var selection_tool = load("res://GUI/Display/Tools/SelectionTool/SelectionTool.tscn")
var selection_area
var figures = []
var creating = false
var creating_regular = false


func _ready():
	figures = SM.get_figures()


func _process(_delta):
	update()
	set_margin(MARGIN_TOP, Res.get_menu_bar_res().position.y)
	set_margin(MARGIN_RIGHT, Res.get_display_res().size.x)
	set_margin(MARGIN_BOTTOM, Res.get_display_res().size.y)
	if is_clicking and is_in_display(clicked_position) and clicked_position != null:
		create_object()
	if creating and PN.get_button_selected() != "Vertex":
		figures[figures.size() - 1].queue_free()
		figures.remove(figures.size() - 1)
		creating = false


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
	new_object.preview(get_global_mouse_position())


# func delete_object():
# 	var position_list = SM.get_position()
# 	GF.ids_avaiable.append(figures[position_list].get_id())
# 	figures[position_list].delete()
# 	figures[figures.size() - 1].set_is_selected(false)
# 	figures[position_list].queue_free()
# 	figures.remove(position_list)
# 	if figures.size() != 0:
# 		figures[figures.size() - 1].select_figure()
# 	else:
# 		Insp.clear()
# 		Insp.reload_atributes = true


func _input(event):
	if PN.get_button_selected() != "":
		if event.is_action_pressed("move_vertex"):
			is_clicking = true
			clicked_position = event.position
			if is_in_display(clicked_position):
				var new_figure
				match PN.get_button_selected():
					"Square":
						GF.start_create_regular_by_mouse("Square", clicked_position)
						creating_regular = true
					"Triangle":
						GF.start_create_regular_by_mouse("Triangle", clicked_position)
						creating_regular = true
					"Hexagon":
						GF.start_create_regular_by_mouse("Hexagon", clicked_position)
						creating_regular = true
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
								if GF.ids_avaiable.size() > 0:
									GF.ids_avaiable.sort()
									figures[figures.size() - 1].init(GF.ids_avaiable[0])
									GF.ids_avaiable.remove(0)
								else:
									figures[figures.size() - 1].init(figures.size() - 1)
								figures[figures.size() - 1].select_figure()
								SM.new_object = true
								SM.set_position()
								Insp.reload_atributes = true
								creating = false

	if event.is_action_released("move_vertex"):
		is_clicking = false
		if is_in_display(clicked_position) and creating_regular:
			GF.finish_create_regular_by_mouse()
			creating_regular = false
	# if event.is_action_pressed("delete_figure") and figures.size() > 0:
	# 	delete_object()

	if event.is_action_pressed("cancel") and creating:
		figures[figures.size() - 1].queue_free()
		figures.remove(figures.size() - 1)
		creating = false
