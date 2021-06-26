extends Control



var img = [
	"res://assets/Icons/Buttons/Triangle/buttonTriangulo.png",
	"res://assets/Icons/Buttons/Triangle/buttonTrianguloPressed.png",
	"res://assets/Icons/Buttons/Square/buttonQuadrado.png",
	"res://assets/Icons/Buttons/Square/buttonQuadradoPressed.png",
	"res://assets/Icons/Buttons/Hexagon/buttonHexagono.png",
	"res://assets/Icons/Buttons/Hexagon/buttonHexagonoPressed.png",
	"res://assets/Icons/Buttons/Vertex/buttonVertice.png",
	"res://assets/Icons/Buttons/Vertex/buttonVerticePressed.png"
	]

onready var click = 1
onready var spr0 =$trianguloButton/Sprite
onready var spr1 =$quadradoButton/Sprite
onready var spr2 =$HexagonoButton/Sprite
onready var spr3 =$verticeButton/Sprite

func disabled_button():
	pass

func _ready():
	for x in ['t', 'q', 'h', 'v']:
		if x == $trianguloButton.get_text():
			$trianguloButton.set_disabled(false)
		elif x == $quadradoButton.get_text():
			$quadradoButton.set_disabled(false)
		elif x == $HexagonoButton.get_text():
			$HexagonoButton.set_disabled(false)
		elif x == $verticeButton.get_text():
			$verticeButton.set_disabled(false)
	pass

func swap_button(button, a, b):
	if click == InputEventMouseButton.CONNECT_DEFERRED:
		button.texture = load(img[a])
#		button1.visible = !$Sprite.visible
#		button3.visible = !$Sprite.visible
#		button3.visible = !$Sprite.visible
		click = 0
	else:
		button.texture = load(img[b])
		click = 1
	pass

func mouse_entered_exited(button, a):
	button.modulate.r = a
	button.modulate.g = a
	button.modulate.b = a
	pass

# config botao triangulo
func _on_trianguloButton_mouse_entered():
	$trianguloButton.set_tooltip("Triangle Button")
	mouse_entered_exited(spr0, 0.7)
	pass # Replace with function body.

func _on_trianguloButton_mouse_exited():
	mouse_entered_exited(spr0, 1)
	pass # Replace with function body.

func _on_trianguloButton_pressed():
	swap_button(spr0, 0, 1)
	pass # Replace with function body.



# config botao quadrado
func _on_quadradoButton_mouse_entered():
	$quadradoButton.set_tooltip("Square Button")
	mouse_entered_exited(spr1, 0.7)
	pass # Replace with function body.

func _on_quadradoButton_mouse_exited():
	mouse_entered_exited(spr1, 1)
	pass # Replace with function body.

func _on_quadradoButton_pressed():
	swap_button(spr1, 2, 3)
	
	pass # Replace with function body.



# config botao hexagona
func _on_HexagonoButton_mouse_entered():
	$HexagonoButton.set_tooltip("Hexagon Button")
	mouse_entered_exited(spr2, 0.7)
	pass # Replace with function body.

func _on_HexagonoButton_mouse_exited():
	mouse_entered_exited(spr2, 1)
	pass # Replace with function body.

func _on_HexagonoButton_pressed():
	swap_button(spr2, 4, 5)
	pass # Replace with function body.



# config botao vertice
func _on_verticeButton_mouse_entered():
	$verticeButton.set_tooltip("Vertex Button")
	mouse_entered_exited(spr3, 0.7)
	pass # Replace with function body.

func _on_verticeButton_mouse_exited():
	mouse_entered_exited(spr3, 1)
	pass # Replace with function body.

func _on_verticeButton_pressed():
	swap_button(spr3, 6, 7)
	pass # Replace with function body.














