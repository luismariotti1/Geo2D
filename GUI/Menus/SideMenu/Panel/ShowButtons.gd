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


func _ready():
	for i in range(4):
		buttons.append(button.instance()) 
		buttons[buttons.size() - 1].init([imgs[i*2], imgs[i*2+1]])
		add_child(buttons[buttons.size() - 1])

func _process(delta):
	# has_one_clicked = false
	for i in range(buttons.size()):
		if buttons[i].get_index() == 0:
			if buttons[i].pressed == true:
				buttons[i].disabled = false
				has_one_clicked = true
		if buttons[i].get_index() == 1:
			if buttons[i].pressed == true:
				has_one_clicked = true
		if buttons[i].get_index() == 2:
			if buttons[i].pressed == true:
				has_one_clicked = true
		if buttons[i].get_index() == 3:
			if buttons[i].pressed == true:
				has_one_clicked = true
				
				 
			
		 
			
