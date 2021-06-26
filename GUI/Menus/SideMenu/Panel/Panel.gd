extends Control

var img = [
	"res://assets/Icons/Buttons/Triangle/buttonTriangulo.png",
	"res://assets/Icons/Buttons/Triangle/buttonTrianguloPressed.png",
	"res://assets/Icons/Buttons/Square/buttonQuadrado.png",
	"res://assets/Icons/Buttons/Square/buttonQuadradoPressed.png",
	"res://assets/Icons/Buttons/Hexagon/buttonHexagono.png",
	"res://assets/Icons/Buttons/Hexagon/buttonHexagonoPressed.png",
	"res://assets/Icons/Buttons/Vertex/buttonVertice.png"
	]

onready var spr0 =$trianguloButton
onready var spr1 =$quadradoButton
onready var spr2 =$HexagonoButton
onready var spr3 =$verticeButton

func swap_button():
	
	pass

func mouse_entered_exited(button, a):
	button.modulate.r = a
	button.modulate.g = a
	button.modulate.b = a
	pass

# config botao triangulo
func _on_trianguloButton_mouse_entered():
	mouse_entered_exited(spr0, 0.7)
	pass # Replace with function body.

func _on_trianguloButton_mouse_exited():
	mouse_entered_exited(spr0, 1)
	pass # Replace with function body.

func _on_trianguloButton_pressed():
	pass # Replace with function body.



# config botao quadrado
func _on_quadradoButton_mouse_entered():
	mouse_entered_exited(spr1, 0.7)
	pass # Replace with function body.

func _on_quadradoButton_mouse_exited():
	mouse_entered_exited(spr1, 1)
	pass # Replace with function body.

func _on_quadradoButton_pressed():
	pass # Replace with function body.



# config botao hexagona
func _on_HexagonoButton_mouse_entered():
	mouse_entered_exited(spr2, 0.7)
	pass # Replace with function body.

func _on_HexagonoButton_mouse_exited():
	mouse_entered_exited(spr2, 1)
	pass # Replace with function body.

func _on_HexagonoButton_pressed():
	pass # Replace with function body.



# config botao vertice
func _on_verticeButton_mouse_entered():
	mouse_entered_exited(spr3, 0.7)
	pass # Replace with function body.

func _on_verticeButton_mouse_exited():
	mouse_entered_exited(spr3, 1)
	pass # Replace with function body.

func _on_verticeButton_pressed():
	pass # Replace with function body.














