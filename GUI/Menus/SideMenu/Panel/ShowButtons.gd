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
var has_one_clicked = false
# var enable = buttons.set_disabled(true)

func _ready():
	for i in range(4):
		buttons.append(button.instance()) 
		buttons[buttons.size() - 1].init([imgs[i*2], imgs[i*2+1]])
		add_child(buttons[buttons.size() - 1])

#func _process(delta):
#	has_one_clicked = false
#	for i in range(buttons.size()):
#		# buttons[i].disabled = true
#		if buttons[i].pressed:
#			has_one_clicked = true
#		buttons[i].disabled = true	

