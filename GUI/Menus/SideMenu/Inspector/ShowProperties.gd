extends VBoxContainer

onready var Insp = get_node("/root/SetInspector")
var atribute

func _ready():
	atribute = load("res://GUI/Menus/SideMenu/Inspector/Atributes/AtributEdit.tscn").instance()
	atribute.init("ScaleX:", Insp.get_scaleX())
	add_child(atribute)
	
func _process(delta):
	Insp.set_scaleX(atribute.get_node("Value").text)
	pass
