extends HBoxContainer

var _type : String
var _value : float

func init(type, value):
	get_node("AtributeName").text = type
	get_node("Value").text = String(value)
