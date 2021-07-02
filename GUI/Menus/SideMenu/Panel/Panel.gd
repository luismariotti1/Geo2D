extends Control


var click = 1
onready var spr0 = $trianguloButton
onready var spr1 = $quadradoButton
onready var spr2 = $HexagonoButton
onready var spr3 = $verticeButton

var img = [
	"res://assets/Icons/Buttons/Triangle/buttonTriangulo.png",
	"res://assets/Icons/Buttons/Triangle/buttonTrianguloPressed.png",
	"res://assets/Icons/Buttons/Square/buttonQuadrado.png",
	"res://assets/Icons/Buttons/Square/buttonQuadradoPressed.png",
	"res://assets/Icons/Buttons/Hexagon/buttonHexagono.png",
	"res://assets/Icons/Buttons/Hexagon/buttonHexagonoPressed.png",
	"res://assets/Icons/Buttons/Vertex/buttonVertice.png"
]



func swap_button(button, a, b):
	if click == InputEventMouseButton.CONNECT_PERSIST:
		button.Texture = load(img[a])
#		button.set_texture(img[a])
		click = 0
	else:
		button.Texture = load(img[b])
#		button.set_texture(img[b])
		click = 1
	pass
	
func efect_entered_exited(button, a):
	button.modulate.r = a
	button.modulate.g = a
	button.modulate.b = a
	pass


# config botao triangulo
func _on_trianguloButton_mouse_entered():
	spr0.set_tooltip("triangle")
	efect_entered_exited($trianguloButton, 0.7)
	pass # Replace with function body.

func _on_trianguloButton_mouse_exited():
	efect_entered_exited($trianguloButton, 1)
	pass # Replace with function body.

func _on_trianguloButton_pressed():
	if click == InputEventMouseButton.CONNECT_DEFERRED:
		spr0.Texture = load(img[0])
#		button.set_texture(img[a])
		click = 0
	else:
		spr0.StreamTexture = load(img[1])
#		button.set_texture(img[b])
		click = 1
	pass # Replace with function body.



# config botao quadrado
func _on_quadradoButton_mouse_entered():
	spr1.set_tooltip("Square")
	efect_entered_exited($quadradoButton, 0.7)
	pass # Replace with function body.

func _on_quadradoButton_mouse_exited():
	efect_entered_exited($quadradoButton, 1)
	pass # Replace with function body.

func _on_quadradoButton_pressed():
	
	pass # Replace with function body.



# config botao hexagona
func _on_HexagonoButton_mouse_entered():
	efect_entered_exited($HexagonoButton, 0.7)
	pass # Replace with function body.

func _on_HexagonoButton_mouse_exited():
	efect_entered_exited($HexagonoButton, 1)
	pass # Replace with function body.

func _on_HexagonoButton_pressed():
	pass # Replace with function body.



# config botao vertice
func _on_verticeButton_mouse_entered():
	efect_entered_exited($verticeButton, 0.7)
	pass # Replace with function body.

func _on_verticeButton_mouse_exited():
	efect_entered_exited($verticeButton, 1)
	pass # Replace with function body.

func _on_verticeButton_pressed():
	pass # Replace with function body.














