extends Control

var _id: String
var _type
var _value


func init(data):
	_id = data["id"]
	get_node("AtributeName").text = String(data["label"])
	get_node("Value").text = String(data["value"])


func get_id():
	return _id
