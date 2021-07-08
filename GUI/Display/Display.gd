extends Control

onready var Res = get_node("/root/MenusResolutions")
onready var CP = get_node("/root/CartesianPlane")
onready var PN = get_node("/root/PanelInfo")

var clicked_position = null
var is_clicking = false
var is_selecting = false
var selection_tool = load("res://GUI/Display/Tools/SelectionTool/SelectionTool.tscn")
var selection_area
var figures = []


func _process(_delta):
	set_margin(MARGIN_TOP, Res.get_menu_bar_res().position.y)
	set_margin(MARGIN_RIGHT, Res.get_display_res().size.x)
	set_margin(MARGIN_BOTTOM, Res.get_display_res().size.y)
	if is_clicking == true and clicked_position != null:
		create_object()
	# 	move_vertex()
	# selection_area()
	update()


func is_in_display(Position):
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
	figures[0].set_transform(rad2deg(clicked_position.angle_to_point(get_global_mouse_position())))
	figures[0].set_edge(
		(clicked_position.distance_to(get_global_mouse_position()) / CP.get_cartesian_distance())*0.75
	)


func _input(event):
	if event.is_action_pressed("move_vertex"):
		is_clicking = true
		clicked_position = event.position
		var new_figure = load("res://Figures/Square/Square.tscn").instance()
		new_figure.init(CP.mouse_position_to_cartesian(clicked_position))
		add_child(new_figure)
		figures.append(new_figure)
		# move_vertex()
		# selection_area = selection_tool.instance()
		# selection_area.init(clicked_position)
		# add_child(selection_area)
	if event.is_action_released("move_vertex"):
		is_clicking = false
		clicked_position = null
		# selection_area.queue_free()

# func move_vertex():
# 	CP.mouse_position_to_cartesian(clicked_position)

# func selection_area():
# 	if is_clicking == true and clicked_position != null:
# 		if is_in_display(get_global_mouse_position()):
# 			selection_area.set_tool_area(get_global_mouse_position()-clicked_position)
