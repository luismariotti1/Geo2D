extends VBoxContainer

onready var Insp = get_node("/root/SetInspector")
var atributes = []
var AtributEdit = load("res://GUI/Menus/SideMenu/Inspector/Atributes/AtributEdit.tscn")
var DoubleAtributEdit = load("res://GUI/Menus/SideMenu/Inspector/Atributes/DoubleAtributEdit.tscn")
var CheckboxAtribute = load("res://GUI/Menus/SideMenu/Inspector/Atributes/AtributCheckBox.tscn")
var ListEdit = load("res://GUI/Menus/SideMenu/Inspector/List/ListEdit.tscn")
var length_x = rect_size.x

func init_atribute(scene, data, type = "atribute"):
	atributes.append({"type": type, "scene": scene})
	atributes[atributes.size() - 1]["scene"].init(data)


func _process(_delta):
	rect_position.x = 4
	if get_parent().get_v_scrollbar().visible:
		rect_min_size.x = length_x-16
		rect_size.x = length_x-16
	else:
		rect_size.x = length_x-5
	if Insp.reload_atributes:
		for n in get_children():
			remove_child(n)
		for atribute in Insp.get_properties():
			if atribute.has("type"):
				match atribute["type"]:
					"list":
						init_atribute(ListEdit.instance(), atribute, "list")
					"double_atribute":
						init_atribute(DoubleAtributEdit.instance(), atribute, "double_atribute")
					"checkbox":
						init_atribute(CheckboxAtribute.instance(), atribute, "checkbox")
			else:
				init_atribute(AtributEdit.instance(), atribute)
			add_child(atributes[atributes.size() - 1]["scene"])
	
	Insp.reload_atributes = false
