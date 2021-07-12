extends "res://Figures/Figures.gd"

# new_pivot = Vector2(float(l)/2, float(l)/2)

func init(id):
	_id = id
	create_dic_to_properties()
	info.insert(0, {"id": "edge", "label": "edge", "value": edge})
	var list_of_vertices_insp = {
		"listLabel": "vertex",
		"type": "list",
		"infos":[]
	}
	for vex in vertex:
		list_of_vertices_insp["infos"].append({"type": "double_atribute", "id": "vertice", "label": "vertices", 
		"value": [vex.x, vex.y]})
	info.append(list_of_vertices_insp)	
	set_properties_in_inspector()
	ready = true


func _physics_process(_delta):
	if !ready:
		var new_vertex = []
		new_vertex.append(Vector2(0, 0) * mirror_vertex - new_pivot)
		new_vertex.append(Vector2(0, edge) * mirror_vertex - new_pivot)
		new_vertex.append(Vector2(edge, edge) * mirror_vertex - new_pivot)
		new_vertex.append(Vector2(edge, 0) * mirror_vertex - new_pivot)
		vertex = new_vertex
