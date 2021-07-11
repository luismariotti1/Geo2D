extends HBoxContainer

var _id: String
var _type: String
var _value1: float
var _value2: float


func init(data):
	_id = infos["id"]
	get_node("AtributeName").text = String(data["label"])
	get_node("Value1").text = "test1"
	get_node("Value2").text = "test2"


func get_id():
	return _id
