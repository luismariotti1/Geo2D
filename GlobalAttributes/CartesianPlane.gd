extends Node

var default_x_resolution = 1024 - 256
var divisions = 14
var cartesian_distance = default_x_resolution / divisions
var center_plan = Vector2.ZERO


func get_cartesian_distance():
	return cartesian_distance


func set_center_plane(center):
	center_plan = center


func get_center_plane():
	return center_plan


func mouse_position_to_cartesian(mouse_position):
	return ((mouse_position - center_plan) / cartesian_distance) * Vector2(1, -1)


func convert_cartesian_to_pos(coord):
	return Vector2(
		center_plan.x + coord.x * cartesian_distance,
		center_plan.y + -1 * coord.y * cartesian_distance
	)


func convert_catersian_to_dist(coord):
	return Vector2(coord.x * cartesian_distance, -1 * coord.y * cartesian_distance)


func convert_array_of_coord_to_distance(array_coord):
	var new_array = []
	for coord in array_coord:
		new_array.append(convert_catersian_to_dist(coord))
	return new_array
