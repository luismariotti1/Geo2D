extends WindowDialog

var type: int
var coord: Vector2
var edge: float
onready var SM = get_node("/root/SelectionMenu")
var figures: Array
onready var PN = get_node("/root/PanelInfo")
onready var Insp = get_node("/root/SetInspector")


func _ready():
	figures = SM.get_figures()
	PN._button_selected = ""


func _on_Button_button_down():
	type = get_node("VBoxContainer/FigureType/OptionButton").get_selected_id()
	coord.x = float(get_node("VBoxContainer/Coords/Coords/Value1").text)
	coord.y = float(get_node("VBoxContainer/Coords/Coords/Value2").text)
	edge = float(get_node("VBoxContainer/Edge/Value").text)
	if edge < 0.2:
		print("o valor minimo a para aresta eh 0.2")
	else:
		var new_figure
		match type:
			0:
				new_figure = load("res://Figures/Square/Square.tscn").instance()
			1:
				print("triangulo")
			2:
				print("hexagono")
		figures.append(new_figure)
		get_parent().get_node("Display").add_child(new_figure)
		new_figure.set_coord(coord)
		new_figure.set_edge(edge)
		new_figure.set_quadrant(45)
		new_figure.init(0)
		new_figure.select_figure()
		SM.new_object = true
		SM.set_position()
		Insp.reload_atributes = true
