extends "res://Figures/Figures.gd"

func _ready():
	vertex.append(CP.convert_catersian_to_dist(Vector2(0, 0)))
	vertex.append(CP.convert_catersian_to_dist(Vector2(0, 1)))
	vertex.append(CP.convert_catersian_to_dist(Vector2(1, 1)))
	vertex.append(CP.convert_catersian_to_dist(Vector2(1, 0)))


func _draw():
	draw_set_transform_matrix(t)
	if ! filled:
		custom_draw_polygon(vertex, color, self.line_width)
	else:
		custom_draw_polygon_filled(vertex, color)
