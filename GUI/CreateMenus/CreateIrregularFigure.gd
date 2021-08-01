extends WindowDialog

var num_vertices: int
var vertice = load("res://GUI/CreateMenus/VerticesEdit.tscn")
var vertices = []
var line_edit

func _ready():
	line_edit = get_node("VBoxContainer/NumVertices/SpinBox").get_line_edit( )

func _physics_process(delta):
	num_vertices = int(line_edit.text)
	if num_vertices > vertices.size():
		for i in range(num_vertices - vertices.size()):
			var new_vertice = vertice.instance()
			vertices.append(new_vertice)
			get_node("VBoxContainer/ScrollContainer/VBoxContainer").add_child(new_vertice)

func _on_Button_button_down():
	pass


