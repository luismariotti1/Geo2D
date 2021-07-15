extends HBoxContainer

var _id: String
var checkbox_labels = []
var checkbox = load("res://GUI/Menus/SideMenu/Inspector/Atributes/CheckBox.tscn")
var buttons = []
var _insp_data = {}


func init(data):
	_insp_data = data
	_id = data["id"]
	get_node("AtributeName").text = data["label"]
	checkbox_labels = data["value"].keys()
	create_checkbox()


func change_value(label, boolean):
	_insp_data['value'][label] = boolean


func create_checkbox():
	for lab in checkbox_labels:
		buttons.append(checkbox.instance())
		buttons[buttons.size() - 1].init(lab)
		add_child(buttons[buttons.size() - 1])


func get_id():
	return _id
