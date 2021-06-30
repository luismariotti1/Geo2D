extends VBoxContainer

func _init():
	var atribute1 = load("res://GUI/Menus/SideMenu/Inspector/Atributes/AtributEdit.tscn").instance()
	var atribute2 = load("res://GUI/Menus/SideMenu/Inspector/Atributes/AtributEdit.tscn").instance()
	atribute1.init("Name:", "square1")
	atribute2.init("Type:", "regular")
	self.add_child(atribute1)
	self.add_child(atribute2)
