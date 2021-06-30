extends VBoxContainer

func _init():
	var atribute = load("res://GUI/Menus/SideMenu/Inspector/Atributes/AtributEdit.tscn").instance()
	self.add_child(atribute)
	print(atribute)
