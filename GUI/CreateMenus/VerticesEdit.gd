extends HBoxContainer

var _name

func init(name):
	_name = name
	get_node("AtributeName").text = _name
