extends VBoxContainer

onready var Insp = get_node("/root/SetInspector")
var atributes = []
var AtributEdit = load("res://GUI/Menus/SideMenu/Inspector/Atributes/AtributEdit.tscn")
var DoubleAtributEdit = load("res://GUI/Menus/SideMenu/Inspector/Atributes/DoubleAtributEdit.tscn")
var ListEdit = load("res://GUI/Menus/SideMenu/Inspector/List/ListEdit.tscn")


func init_atribute(scene, data, type = "atribute"):
	atributes.append({"type":type, "scene":scene})
	atributes[atributes.size() - 1]["scene"].init(data)

func _process(_delta):
	if get_parent().get_v_scrollbar().visible:
		rect_min_size.x = 210
	else:
		rect_min_size.x = 226
	if Insp.reload_atributes:
		for n in get_children():
			remove_child(n)
		for atribute in Insp.get_properties():
			if atribute.has("type"):
				if atribute["type"] == "list":
					init_atribute(ListEdit.instance(), atribute, "list")
				if atribute["type"] == "double_atribute":
					init_atribute(DoubleAtributEdit.instance(), atribute, "double_atribute")
			else:
				init_atribute(AtributEdit.instance(), atribute)
			add_child(atributes[atributes.size() - 1]["scene"])
	Insp.reload_atributes = false

	for i in range(atributes.size()):
		if atributes[i]["type"] == "double_atribute":
			Insp.set_properties_by_id(atributes[i]["scene"].get_id(), [atributes[i]["scene"].get_node("Value1").text,atributes[i]["scene"].get_node("Value2").text])
		elif atributes[i]["type"] == "list":
			for atr in atributes[i]["scene"].get_list():
				Insp.set_properties_by_id(atr.get_id(), atr.get_node("Value").text)
		else:
			Insp.set_properties_by_id(atributes[i]["scene"].get_id(), atributes[i]["scene"].get_node("Value").text)