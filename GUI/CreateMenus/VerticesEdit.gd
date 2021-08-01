extends HBoxContainer

var _name

func init(name, default):
	_name = name
	get_node("AtributeName").text = _name
	get_node("Value1").text = String(default[0])
	get_node("Value2").text = String(default[1])
