extends WindowDialog

var num_ControlPoints: int
var ControlPoint = load("res://GUI/CreateMenus/VerticesEdit.tscn")
var ControlPoints = []
var line_edit
onready var GF = get_node("/root/GenerateFigures")
var degree
var min_controls
var max_controls = 10
var max_degree = 5


func _ready():
	line_edit = get_node("HBoxContainer/VBoxContainer/Degree/SpinBox").get_line_edit()


func create_control():
	var new_control = ControlPoint.instance()
	ControlPoints.append(new_control)
	get_node("HBoxContainer/VBoxContainer/ScrollContainer/VBoxContainer").add_child(new_control)
	ControlPoints[ControlPoints.size() - 1].init("v" + String(ControlPoints.size()))


func _physics_process(_delta):
	if int(line_edit.text) > 5:
		degree = 5
		line_edit.text = String(5)
	else:
		degree = int(line_edit.text)
	min_controls = degree + 1
	num_ControlPoints = min_controls
	if num_ControlPoints > ControlPoints.size():
		for _i in range(num_ControlPoints - ControlPoints.size()):
			create_control()


func _on_Create_button_down():
	var controls = PoolVector2Array()
	for vet in ControlPoints:
		var new_vet = Vector2(
			float(vet.get_node("Value1").text), float(vet.get_node("Value2").text)
		)
		controls.push_back(new_vet)
	var info = {"degree": degree, "controls": controls}
	GF.create_curve_by_menu(info)


func _on_Add_button_down():
	if ControlPoints.size() < max_controls:
		create_control()


func _on_Remove_button_down():
	if ControlPoints.size() > min_controls:
		ControlPoints.pop_back().queue_free()
