extends "res://Figures/Regular.gd"


func init(id):
	_id = id
	_figure_name = "triangle (" + String(_id) + ")"
	selection_button.init(_figure_name, self)
	create_dic_to_properties()
	info.insert(0, {"id": "edge", "label": "edge", "value": edge})
	set_properties_in_inspector()


func _physics_process(_delta):
	var new_vertex = []
	new_vertex.append(Vector2(0, 0) * mirror_vertex - new_pivot)
	new_vertex.append(Vector2(edge/2, float((sqrt(3)*edge)/2)) * mirror_vertex - new_pivot)
	new_vertex.append(Vector2(edge, 0) * mirror_vertex - new_pivot)
	vertex = new_vertex
