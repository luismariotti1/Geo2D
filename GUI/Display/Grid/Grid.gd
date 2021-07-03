extends Control

var axis_center_position = Vector2.ZERO
var color = ColorN("black")
var clicked_position = null
var is_clicking = false
var distX = 0
var distY = 0
var label = Label.new()
var font = label.get_font("")
var limitX = 0
var limitY = 0
var keep_center_x = 0
var keep_center_y = 0
onready var CP = get_node("/root/CartesianPlane")
onready var Res = get_node("/root/MenusResolutions")
var Hold_cursor = load("res://assets/Icons/Mouse/Hold/Hold.png")
var Arrow_cursor = load("res://arrow.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	limitX = get_parent().get_rect().size.x
	keep_center_x = get_parent().get_rect().size.x
	keep_center_y = get_parent().get_rect().size.y
	limitY = get_parent().get_rect().size.y
	axis_center_position = Vector2(limitX / 2, limitY / 2)


func _process(delta):
	update()
	if is_clicking == true and clicked_position != null:
		axis_center_position.x = get_global_mouse_position().x + distX
		axis_center_position.y = get_global_mouse_position().y + distY
	limitX = get_parent().get_rect().size.x
	limitY = get_parent().get_rect().size.y
	keep_center_distance()
	CP.set_center_plane(axis_center_position)


func keep_center_distance():
	if limitX != keep_center_x:
		axis_center_position.x += (limitX - keep_center_x) / 2
		keep_center_x = limitX
	if limitY != keep_center_y:
		axis_center_position.y += (limitY - keep_center_y) / 2
		keep_center_y = limitY


func _input(event):
	if event.is_action_pressed("drag_plan"):
		if (
			event.position.x < limitX
			and (event.position.y > Res._menu_bar_res.size.y and event.position.y < limitY)
		):
			is_clicking = true
			clicked_position = event.position
			distX = axis_center_position.x - clicked_position.x
			distY = axis_center_position.y - clicked_position.y
			Input.set_custom_mouse_cursor(Hold_cursor)
	if event.is_action_released("drag_plan"):
		is_clicking = false
		clicked_position = null
		Input.set_custom_mouse_cursor(Arrow_cursor)


func sub_axis():
	var sublines_color = ColorN("gray")
	var subdivision_distance = CP.get_cartesian_distance()

	if cand_draw_y() and cand_draw_x():
		draw_string(
			font, Vector2(axis_center_position.x - 11, axis_center_position.y + 15), "0", color, -1
		)

	var shiftX = axis_center_position.x
	while shiftX > rect_position.x:
		shiftX -= subdivision_distance
		if shiftX > rect_position.x and shiftX < limitX:
			draw_line(
				Vector2(shiftX, rect_position.y),
				Vector2(shiftX, limitY),
				sublines_color,
				1.0,
				false
			)
			if cand_draw_x():
				draw_string(
					font,
					Vector2(shiftX, axis_center_position.y + 15),
					str((shiftX - axis_center_position.x) / subdivision_distance),
					color,
					-1
				)

	shiftX = axis_center_position.x
	while shiftX < limitX:
		shiftX += subdivision_distance
		if shiftX < limitX and shiftX > rect_position.x:
			draw_line(
				Vector2(shiftX, rect_position.y),
				Vector2(shiftX, limitY),
				sublines_color,
				1.0,
				false
			)
			if cand_draw_x():
				draw_string(
					font,
					Vector2(shiftX, axis_center_position.y + 15),
					str((shiftX - axis_center_position.x) / subdivision_distance),
					color,
					-1
				)

	var shiftY = axis_center_position.y
	while shiftY > rect_position.y:
		shiftY -= subdivision_distance
		if shiftY > rect_position.y and shiftY < limitY:
			draw_line(
				Vector2(rect_position.x, shiftY),
				Vector2(limitX, shiftY),
				sublines_color,
				1.0,
				false
			)
			if cand_draw_y():
				draw_string(
					font,
					Vector2(axis_center_position.x + 5, shiftY),
					str(-1 * (shiftY - axis_center_position.y) / subdivision_distance),
					color,
					-1
				)

	shiftY = axis_center_position.y
	while shiftY < limitY:
		shiftY += subdivision_distance
		if shiftY < limitY and shiftY > rect_position.y:
			draw_line(
				Vector2(rect_position.x, shiftY),
				Vector2(limitX, shiftY),
				sublines_color,
				1.0,
				false
			)
			if cand_draw_y():
				draw_string(
					font,
					Vector2(axis_center_position.x + 5, shiftY),
					str(-1 * (shiftY - axis_center_position.y) / subdivision_distance),
					color,
					-1
				)


func create_axis_x():
	draw_line(
		Vector2(rect_position.x, axis_center_position.y),
		Vector2(limitX, axis_center_position.y),
		color,
		1.25,
		false
	)


func create_axis_y():
	draw_line(
		Vector2(axis_center_position.x, rect_position.y),
		Vector2(axis_center_position.x, limitY),
		color,
		1.25,
		false
	)


func cand_draw_y():
	if axis_center_position.x <= limitX and axis_center_position.x >= rect_position.x:
		return true


func cand_draw_x():
	if axis_center_position.y <= limitY and axis_center_position.y >= rect_position.y:
		return true


func _draw():
	if cand_draw_x():
		create_axis_x()
	if cand_draw_y():
		create_axis_y()
	sub_axis()
