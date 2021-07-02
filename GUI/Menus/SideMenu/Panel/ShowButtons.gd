extends HBoxContainer

var imgs = [
	"res://assets/Icons/Buttons/Triangle/buttonTriangulo.png",
	"res://assets/Icons/Buttons/Triangle/buttonTrianguloPressed.png",
	"res://assets/Icons/Buttons/Square/buttonQuadrado.png",
	"res://assets/Icons/Buttons/Square/buttonQuadradoPressed.png",
	"res://assets/Icons/Buttons/Hexagon/buttonHexagono.png",
	"res://assets/Icons/Buttons/Hexagon/buttonHexagonoPressed.png",
	"res://assets/Icons/Buttons/Vertex/buttonVertice.png",
	"res://assets/Icons/Buttons/Vertex/buttonVerticePressed.png"
]

var button = load("res://GUI/Menus/SideMenu/Panel/FigureButton/FigureButton.tscn")
var buttons = []
var button_clicked = -1


func _ready():
	for i in range(imgs.size() / 2):
		buttons.append(button.instance())
		buttons[buttons.size() - 1].init(i, [imgs[i * 2], imgs[i * 2 + 1]])
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
