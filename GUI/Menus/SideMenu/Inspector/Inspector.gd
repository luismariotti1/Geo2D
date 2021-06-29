extends Control

#onready var vertex_tree = get_node("VBoxContainer/PanelContainer2/ScrollContainer/VBoxContainer/ListEdit/items")
#onready var center_tree = get_node("VBoxContainer/PanelContainer2/ScrollContainer/VBoxContainer/ListEdit/items")
#
#var vertex_list = {}
#
## Called when the node enters the scene tree for the first time.
#func _ready():
#	exemple_vertex()
#	show_vertex(vertex_list)
#
#	var coord = Vector2(390, 30)
#
#	var root = center_tree.create_item()
#	center_tree.set_hide_root(true)
#
#	for i in range(coord.length()):
#		print(coord[i])
#		var coordinates = center_tree.create_item()
#		coordinates.set_text(0, String(coord[i]))
#
#
#func show_vertex(data):
#	var root = vertex_tree.create_item()
#	vertex_tree.set_hide_root(true)
#
#
#	for section in vertex_list:	
#		var section_item = vertex_tree.create_item(root)
#		section_item.set_text(0,section)
#
#		for vertex_id in range(vertex_list[section].size()):
#			var vertex_item = vertex_tree.create_item(section_item)
#			vertex_item.set_text(0,vertex_list[section][vertex_id])	
#			var vertex_x = vertex_tree.create_item(vertex_item)
#			vertex_x.set_text(0,"x")
#			vertex_x.set_editable(0,true)
#			vertex_x.set_tooltip(0, "Coordenada X")
#
#			var vertex_y = vertex_tree.create_item(vertex_item)
#			vertex_y.set_text(0,"y")
#			vertex_y.set_editable(0,true)
#			vertex_y.set_tooltip(0, "Coordenada Y")
#
#
#
#func exemple_vertex():
#	vertex_list["Square"] = []
#	vertex_list["Triangle"] = []
#	vertex_list["Hexagon"] = []
#
#	vertex_list["Square"].append("Vertex 1")
#	vertex_list["Square"].append("Vertex 2")
#	vertex_list["Square"].append("Vertex 3")
#	vertex_list["Square"].append("Vertex 4")
#
#	vertex_list["Triangle"].append("Vertex 1")
#	vertex_list["Triangle"].append("Vertex 2")
#	vertex_list["Triangle"].append("Vertex 3")
#
#	vertex_list["Hexagon"].append("Vertex 1")
#	vertex_list["Hexagon"].append("Vertex 2")
#	vertex_list["Hexagon"].append("Vertex 3")
#	vertex_list["Hexagon"].append("Vertex 4")
#	vertex_list["Hexagon"].append("Vertex 5")
#	vertex_list["Hexagon"].append("Vertex 6")


