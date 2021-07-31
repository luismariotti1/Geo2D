extends "res://Figures/Regular.gd"

# new_pivot = Vector2(float(l)/2, float(l)/2)


func init(id):
	print(edge)
	_id = id
	_figure_name = "square (" + String(_id) + ")"
	selection_button.init(_figure_name, self)
	create_dic_to_properties()
	info.insert(0, {"id": "edge", "label": "Edge", "value": edge})
	set_properties_in_inspector()


func _physics_process(_delta):
	var new_vertex = []
	new_vertex.append(Vector2(0, 0) * mirror_vertex - new_pivot)
	new_vertex.append(Vector2(0, edge) * mirror_vertex - new_pivot)
	new_vertex.append(Vector2(edge, edge) * mirror_vertex - new_pivot)
	new_vertex.append(Vector2(edge, 0) * mirror_vertex - new_pivot)
	vertex = new_vertex
