extends VBoxContainer

var AtributEdit = load("res://GUI/Menus/SideMenu/Inspector/Atributes/AtributEdit.tscn")
var DoubleAtributEdit = load("res://GUI/Menus/SideMenu/Inspector/Atributes/DoubleAtributEdit.tscn")
var _list = [] setget , get_list
var _infos = []
var _label: String
var is_visible = false


func init(data):
	get_node("ShowList").text = data["listLabel"]
	_infos = data["infos"]
	instance_atributes()
	set_visibility()


func instance_atributes():
	for i in range(_infos.size()):
		if _infos[i].has("type") and _infos[i]["type"] == "double_atribute":
			_list.append(DoubleAtributEdit.instance())
			_list[_list.size() - 1].init(_infos[i])
		else:
			_list.append(AtributEdit.instance())
			_list[_list.size() - 1].init(_infos[i])
		add_child(_list[_list.size() - 1])


func set_visibility():
	for n in get_children():
		if n is HBoxContainer:
			n.visible = is_visible


func _on_Button_toggled(button_pressed):
	if button_pressed:
		is_visible = true
		set_visibility()
	else:
		is_visible = false
		set_visibility()

func get_list():
	return _list