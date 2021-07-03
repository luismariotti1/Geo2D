extends "res://Figures/Figures.gd"

# var vertex = PoolVector2Array()


# func _ready():
# 	vertex.append(CP.convert_catersian_to_dist(Vector2(0, 0)))
# 	vertex.append(CP.convert_catersian_to_dist(Vector2(1, 1)))
# 	vertex.append(CP.convert_catersian_to_dist(Vector2(2, 0)))
# vertex.append(CP.convert_catersian_to_dist(Vector2(0, 0)))

 
func _draw():
	draw_set_transform_matrix(t)
	draw_rect(Rect2(pivot, CP.convert_catersian_to_dist(Vector2(l, l))), color, false, 2.0, false)
	# draw_polyline(vertex, color, 2.0)
