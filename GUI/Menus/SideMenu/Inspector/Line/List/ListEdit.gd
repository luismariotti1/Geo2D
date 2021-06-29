extends HBoxContainer

onready var items = get_node("items")
var list = []
# Called when the node enters the scene tree for the first time.
func _ready():
	list.append("Square")
	list.append("Triangle")
	list.append("Hexagon")
	print(list)
