extends WindowDialog

var type: int
var coord: Vector2
var edge: float
onready var PN = get_node("/root/PanelInfo")
onready var GF = get_node("/root/GenerateFigures")
var Square = load("res://Figures/Square/Square.tscn")

func _ready():
	PN._button_selected = ""

func _on_Button_button_down():
	type = get_node("VBoxContainer/FigureType/OptionButton").get_selected_id()
	coord.x = float(get_node("VBoxContainer/Coords/Coords/Value1").text)
	coord.y = float(get_node("VBoxContainer/Coords/Coords/Value2").text)
	edge = float(get_node("VBoxContainer/Edge/Value").text)
	if edge < 0.2:
		print("o valor minimo a para aresta eh 0.2")
	else:
		match type:
			0:
				GF.create_regular(Square.instance(),coord,edge)
			1:
				print("triangulo")
			2:
				print("hexagono")
