extends VBoxContainer

var AtributEdit = load("res://GUI/Menus/SideMenu/Inspector/Atributes/AtributEdit.tscn")
var list = []
var _label : String

func init(label):
	 get_node("ShowList").text = label

func _on_Button_toggled(button_pressed):
	if button_pressed:
		for i in range(3):
			list.append(AtributEdit.instance())
			add_child(list[list.size()-1])
	else:
		for n in get_children():
			if n is HBoxContainer: 
				n.queue_free()
