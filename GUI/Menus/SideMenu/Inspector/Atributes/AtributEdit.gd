extends Control

var _id: String
var _value
var _type = "atribute"
var _insp_data = {}


func init(data):
	_id = data["id"]
	get_node("AtributeName").text = String(data["label"])
	get_node("Value").text = String(data["value"])
	_insp_data = data


func _physics_process(_delta):
	_insp_data["value"] = get_node("Value").text


func get_id():
	return _id
