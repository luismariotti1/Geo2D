extends HBoxContainer

var _id: int
var _name : String

func init(label):
	get_node("AtributeName").text = label
	_name = label

func _on_CheckBox_toggled(button_pressed):
	get_parent().change_value(_name, button_pressed)
