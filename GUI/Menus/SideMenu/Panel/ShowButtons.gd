extends VBoxContainer

var buttons_configs = [
	{
		"figure": "Triangle",
		"img_default": "res://assets/Icons/Buttons/Triangle/buttonTriangulo.png",
		"img_pressed": "res://assets/Icons/Buttons/Triangle/buttonTrianguloPressed.png",
	},
	{
		"figure": "Square",
		"img_default": "res://assets/Icons/Buttons/Square/buttonQuadrado.png",
		"img_pressed": "res://assets/Icons/Buttons/Square/buttonQuadradoPressed.png",
	},
	{
		"figure": "Hexagon",
		"img_default": "res://assets/Icons/Buttons/Hexagon/buttonHexagono.png",
		"img_pressed": "res://assets/Icons/Buttons/Hexagon/buttonHexagonoPressed.png",
	},
	{
		"figure": "Vertex",
		"img_default": "res://assets/Icons/Buttons/Vertex/buttonVertice.png",
		"img_pressed": "res://assets/Icons/Buttons/Vertex/buttonVerticePressed.png",
	},
	{
		"figure": "Curve",
		"img_default": "res://assets/Icons/Buttons/Curve/buttonCurve.png",
		"img_pressed": "res://assets/Icons/Buttons/Curve/buttonCurvePressed.png",
	},
]

var button = load("res://GUI/Menus/SideMenu/Panel/FigureButton/FigureButton.tscn")
var buttons = []
var has_one_clicked = false
var button_clicked = -1
onready var PN = get_node("/root/PanelInfo")


func _ready():
	for i in range(buttons_configs.size()):
		buttons.append(button.instance())
		buttons[buttons.size() - 1].init(i, buttons_configs[i])
		if i < 4:
			get_node("Linha1").add_child(buttons[buttons.size() - 1])
		else:
			get_node("Linha2").add_child(buttons[buttons.size() - 1])


func _process(_delta):
	for i in len(buttons):
		if buttons[i]._figure == PN.get_button_selected():
			buttons[i].pressed = true
		else:
			buttons[i].pressed = false
		
