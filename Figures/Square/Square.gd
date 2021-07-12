extends "res://Figures/Figures.gd"

# new_pivot = Vector2(float(l)/2, float(l)/2)

func init(id):
	_id = id
	create_dic_to_properties()
	info.insert(0, {"id": "edge", "label": "edge", "value": edge})
	var list_of_vertices_insp = {
		"listLabel": "vertex",
		"type": "list",
		"infos":[{"type": "double_atribute", "id": "vertice", "label": "vertices", 
		"value": [inital_pos.x, inital_pos.y]},
		{"type": "double_atribute", "id": "vertice", "label": "vertices", 
		"value": [inital_pos.x, inital_pos.y+edge]},
		{"type": "double_atribute", "id": "vertice", "label": "vertices", 
		"value": [inital_pos.x+edge, inital_pos.y+edge]},
		{"type": "double_atribute", "id": "vertice", "label": "vertices", 
		"value": [inital_pos.x+edge, inital_pos.y]}]
	}
	info.append(list_of_vertices_insp)	
	set_properties_in_inspector()
	ready = true


func _physics_process(_delta):
	if !ready:
		var new_vertex = []
		new_vertex.append(Vector2(0, 0) - new_pivot)
		new_vertex.append(Vector2(0, edge) - new_pivot)
		new_vertex.append(Vector2(edge, edge) - new_pivot)
		new_vertex.append(Vector2(edge, 0) - new_pivot)
		vertex = new_vertex
