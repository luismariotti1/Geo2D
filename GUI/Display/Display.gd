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
var creating_irregular = false
var creating_regular = false
var creating_curve = false


func _ready():
	figures = SM.get_figures()


func _process(_delta):
	update()
	set_margin(MARGIN_TOP, Res.get_menu_bar_res().position.y)
	set_margin(MARGIN_RIGHT, Res.get_display_res().size.x)
	set_margin(MARGIN_BOTTOM, Res.get_display_res().size.y)
	if is_clicking and is_in_display(clicked_position) and clicked_position != null:
		create_object()
	if creating_irregular and PN.get_button_selected() != "Vertex":
		figures[figures.size() - 1].queue_free()
		figures.remove(figures.size() - 1)
		creating_irregular = false
	if creating_curve and PN.get_button_selected() != "Curve":
		figures[figures.size()-1].queue_free()
		figures.remove(figures.size() - 1)
		creating_curve = false


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
	if creating_regular:
		var new_object = figures[figures.size() - 1]
		new_object.preview(get_global_mouse_position())


func _input(event):
	if PN.get_button_selected() != "":
		if event.is_action_pressed("move_vertex"):
			is_clicking = true
			clicked_position = event.position
			if is_in_display(clicked_position):
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
						if creating_irregular == false:
							GF.start_create_irregular_by_mouse()
							creating_irregular = true
						if creating_irregular:
							var new_object = figures[figures.size() - 1]
							new_object.create_next_vertex(
								CP.mouse_position_to_cartesian(clicked_position)
							)
							if figures[figures.size() - 1]._is_ready == true:
								new_object.init(GF.choose_id())
								new_object.select_figure()
								SM.new_object = true
								SM.set_position()
								Insp.reload_atributes = true
								creating_irregular = false
					"Curve":
						if creating_curve == false:
							GF.start_create_curve_by_mouse()
							creating_curve = true
						if creating_curve:
							var new_object = figures[figures.size() - 1]
							new_object.set_creating_by_mouse(true)
							new_object.create_next_control(
								CP.mouse_position_to_cartesian(clicked_position)
							)
							if new_object.controllers.size() == 10:
								GF.finish_create_curve_by_mouse()
								creating_curve = false
								PN.set_button_selected("")

	if event.is_action_pressed("finish"):
		if creating_curve:
			GF.finish_create_curve_by_mouse()
			creating_curve = false
			PN.set_button_selected("")

	if event.is_action_released("move_vertex"):
		is_clicking = false
		if is_in_display(clicked_position) and creating_regular:
			GF.finish_create_regular_by_mouse()
			creating_regular = false

	if event.is_action_pressed("delete_figure") and figures.size() > 0:
		GF.delete_object()

	if event.is_action_pressed("cancel") and (creating_irregular or creating_curve):
		figures[figures.size() - 1].queue_free()
		figures.remove(figures.size() - 1)
		creating_irregular = false
		creating_curve = false
