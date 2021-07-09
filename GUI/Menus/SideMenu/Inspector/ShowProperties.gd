extends VBoxContainer

onready var Insp = get_node("/root/SetInspector")
var atributes = []
var AtributEdit = load("res://GUI/Menus/SideMenu/Inspector/Atributes/AtributEdit.tscn")
var ListEdit = load("res://GUI/Menus/SideMenu/Inspector/List/ListEdit.tscn")

func _process(_delta):
	if Insp.reload_atributes:
			for atribute in Insp.get_properties():
				if atribute.has("type") and atribute["type"] == "list":
					atributes.append(ListEdit.instance())
					atributes[atributes.size() - 1].init(atribute["listLabel"], atribute["infos"])
				else:
					atributes.append(AtributEdit.instance())
					atributes[atributes.size() - 1].init(atribute)
				add_child(atributes[atributes.size() - 1])
	Insp.reload_atributes = false

	for i in range(atributes.size()):
		if atributes[i] is HBoxContainer:
			Insp.set_properties_by_id(atributes[i].get_id(), atributes[i].get_node("Value").text)
		else:
			for atr in atributes[i].get_children():
				if atr is HBoxContainer:
					Insp.set_properties_by_id(atr.get_id(), atr.get_node("Value").text)
