extends Control

onready var Res = get_node("/root/MenusResolutions")
onready var CP = get_node("/root/CartesianPlane")
onready var PN = get_node("/root/PanelInfo")
onready var Insp = get_node("/root/SetInspector")

var clicked_position = null
var is_clicking = false
var is_selecting = false
var selection_tool = load("res://GUI/Display/Tools/SelectionTool/SelectionTool.tscn")
var selection_area
var figures = []


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
	new_object.save_inital_position(clicked_position)
	new_object.set_quadrant(rad2deg(clicked_position.angle_to_point(get_global_mouse_position())))
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
				if PN.get_button_selected() == "Square":
					new_figure = load("res://Figures/Square/Square.tscn").instance()
				elif PN.get_button_selected() == "Triangle":
					new_figure = load("res://Figures/Triangle/Triangle.tscn").instance()
				elif PN.get_button_selected() == "Hexagon":
					new_figure = load("res://Figures/Hexagon/Hexagon.tscn").instance()
				add_child(new_figure)
				figures.append(new_figure)
				figures[figures.size() - 1].set_coord(CP.mouse_position_to_cartesian(clicked_position))

		if event.is_action_released("move_vertex"):
			is_clicking = false
			if figures.size() > 0:
				if figures[figures.size() - 1].edge <= 0.2:
					figures[figures.size() - 1].queue_free()
					figures.remove(figures.size() - 1)
				else:
					figures[figures.size() - 1].init(figures.size() - 1)
					for i in range(figures.size()):
						if figures[i]._id == (figures.size() - 1):
							figures[i].is_select = true
						else:
							figures[i].is_select = false
					if is_in_display(clicked_position):
						Insp.reload_atributes = true