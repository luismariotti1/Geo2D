extends Node

var default_x_resolution = 1024 - 256
var divisions = 16
var cartesian_distance = default_x_resolution/divisions
var center_plan = Vector2.ZERO

func get_cartesian_distance():
	return cartesian_distance

func set_center_plane(center):
	center_plan = center

func get_center_plane():
	return center_plan

func convert_catersian_to_dist(coord):
	return Vector2(coord.x*cartesian_distance,coord.y*cartesian_distance)
