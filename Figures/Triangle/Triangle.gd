extends "res://Figures/Figures.gd"


func _physics_process(_delta):
	var new_vertex = []
	# new_pivot = Vector2(float(l)/2, float(l)/2)
	new_vertex.append(CP.convert_catersian_to_dist(Vector2(0, 0) - new_pivot))
	new_vertex.append(CP.convert_catersian_to_dist(Vector2(edge/2, float((sqrt(3)*edge)/2)) - new_pivot))
	new_vertex.append(CP.convert_catersian_to_dist(Vector2(edge, 0) - new_pivot))
	vertex = new_vertex