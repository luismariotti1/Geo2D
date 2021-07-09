extends HBoxContainer

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
]

var button = load("res://GUI/Menus/SideMenu/Panel/FigureButton/FigureButton.tscn")
var buttons = []
var has_one_clicked = false
var button_clicked = -1


func _ready():
	for i in range(buttons_configs.size()):
		buttons.append(button.instance())
		buttons[buttons.size() - 1].init(i, buttons_configs[i])
		add_child(buttons[buttons.size() - 1])


func _process(delta):
	for i in len(buttons):
		if button_clicked == -1:
			buttons[i].disabled = false
	for i in len(buttons):
		if buttons[i].pressed:
			button_clicked = buttons[i].get_id()
	for i in len(buttons):
		if button_clicked != -1:
			if buttons[i].get_id() != button_clicked:
				buttons[i].disabled = true
