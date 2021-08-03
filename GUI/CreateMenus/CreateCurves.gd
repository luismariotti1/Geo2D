extends WindowDialog

var num_vertices: int
var vertice = load("res://GUI/CreateMenus/VerticesEdit.tscn")
var vertices = []
var line_edit
onready var GF = get_node("/root/GenerateFigures")


func _ready():
	line_edit = get_node("VBoxContainer/NumVertices/SpinBox").get_line_edit()


func _physics_process(_delta):
	num_vertices = int(line_edit.text)
	if num_vertices > vertices.size():
		for _i in range(num_vertices - vertices.size()):
			var new_vertice = vertice.instance()
			vertices.append(new_vertice)
			get_node("VBoxContainer/ScrollContainer/VBoxContainer").add_child(new_vertice)
			vertices[vertices.size() - 1].init(
				"v" + String(vertices.size()), [vertices.size(), vertices.size()]
			)
	if num_vertices < vertices.size() and num_vertices >= 3:
		for _i in range(vertices.size() - num_vertices):
			vertices.pop_back().queue_free()
	elif num_vertices < vertices.size() and num_vertices < 3:
		for _i in range(abs(vertices.size() - 3)):
			vertices.pop_back().queue_free()


func _on_Button_button_down():
	var controls = PoolVector2Array()
	for vet in vertices:
		var new_vet = Vector2(
			float(vet.get_node("Value1").text), float(vet.get_node("Value2").text)
		)
		controls.push_back(new_vet)
	controls.push_back(controls[0])
	GF.create_curve_by_menu(controls)
