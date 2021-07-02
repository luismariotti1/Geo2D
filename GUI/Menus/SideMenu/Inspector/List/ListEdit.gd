extends VBoxContainer

var AtributEdit = load("res://GUI/Menus/SideMenu/Inspector/Atributes/AtributEdit.tscn")
var list = []
var _infos = []
var _label: String


func init(label, infos):
	get_node("ShowList").text = label
	_infos = infos
	print(infos)


func _on_Button_toggled(button_pressed):
	if button_pressed:
		for i in range(_infos.size()):
			list.append(AtributEdit.instance())
			list[list.size() - 1].init(_infos[i])
			add_child(list[list.size() - 1])
	else:
		for n in get_children():
			if n is HBoxContainer:
				n.queue_free()
