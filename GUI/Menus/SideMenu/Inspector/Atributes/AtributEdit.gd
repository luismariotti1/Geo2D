extends Control

var _id: String
var _type: String
var _value: float


func init(infos):
	_id = infos["id"]
	# get_node("AtributeName").text = String(infos["label"])
	# get_node("Value").text = String(infos["value"])


func get_id():
	return _id
