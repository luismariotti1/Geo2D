extends HBoxContainer

var _id: String
var _value1
var _value2
var _type
var _insp_data = {}


func init(data):
	_id = data["id"]
	_type = data["type"]
	get_node("AtributeName").text = data["label"]
	get_node("Value1").text = String(data["value"][0])
	get_node("Value2").text = String(data["value"][1])
	_insp_data = data


func _physics_process(_delta):
	_insp_data["value"][0] = get_node("Value1").text
	_insp_data["value"][1] = get_node("Value2").text


func get_id():
	return _id
