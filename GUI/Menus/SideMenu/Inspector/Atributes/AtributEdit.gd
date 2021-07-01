extends HBoxContainer

var _id : String
var _type : String
var _value : float

func init(id, type, value):
	_id = id
	get_node("AtributeName").text = type
	get_node("Value").text = String(value)

func get_id():
	return _id
