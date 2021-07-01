extends VBoxContainer

onready var Insp = get_node("/root/SetInspector")
var atributes = []
var AtributEdit = load("res://GUI/Menus/SideMenu/Inspector/Atributes/AtributEdit.tscn")

func _ready():
	for atribute in Insp.get_properties():
		atributes.append(AtributEdit.instance())
		atributes[atributes.size()-1].init(atribute, Insp.get_properties()[atribute]) 
		add_child(atributes[atributes.size()-1])
	
func _process(delta):
	for i in range(atributes.size()):
#		print(atributes[i].get_node("AtributeName").text)
#		print(atributes[i].get_node("Value").text)
		Insp.set_properties(atributes[i].get_node("AtributeName").text, atributes[i].get_node("Value").text)
	pass
