extends Control

var axis_center_position = Vector2.ZERO
var color = ColorN("black")
var clicked_position = null
var is_clicking = false
var distX = 0
var distY = 0
var label = Label.new()
var font = label.get_font("")

# Called when the node enters the scene tree for the first time.
func _ready():
	axis_center_position = Vector2(rect_size.x/2, rect_size.y/2)

func _process(delta):
	update()
	if (is_clicking == true and clicked_position != null):
		axis_center_position.x = get_global_mouse_position().x+distX
		axis_center_position.y = get_global_mouse_position().y+distY

func _input(event):
	if event is InputEventMouseButton:
		if (event.pressed == true):
			is_clicking = true
			clicked_position = event.position
			distX = axis_center_position.x - clicked_position.x
			distY = axis_center_position.y - clicked_position.y
		else:
			is_clicking = false
			clicked_position = null

func sub_axis(subdivision = 24):
	var sublines_color = ColorN("gray")
	var subdivision_distance = rect_size.x/subdivision
	
	var shiftX = axis_center_position.x
	while shiftX > rect_position.x:
		shiftX -= subdivision_distance
		if shiftX > rect_position.x and shiftX < rect_size.x:
			draw_line(Vector2(shiftX,rect_position.y), Vector2(shiftX,rect_size.y),sublines_color, 1.0, false)
			draw_string (font, Vector2(shiftX,axis_center_position.y+15),str("-",1), color, -1)
	
	shiftX = axis_center_position.x
	while shiftX < rect_size.x:
		shiftX += subdivision_distance
		if shiftX < rect_size.x and shiftX > rect_position.x:
			draw_line(Vector2(shiftX,rect_position.y), Vector2(shiftX,rect_size.y),sublines_color, 1.0, false)
			draw_string (font, Vector2(shiftX,axis_center_position.y+15),str(1), color, -1)

	var shiftY = axis_center_position.y
	while shiftY > rect_position.y:
		shiftY -= subdivision_distance
		if shiftY > rect_position.y and shiftY < rect_size.y:
			draw_line(Vector2(rect_position.x,shiftY), Vector2(rect_size.x,shiftY),sublines_color, 1.0, false)
			draw_string (font, Vector2(axis_center_position.x+5,shiftY),str("-",1), color, -1)

	shiftY = axis_center_position.y
	while shiftY < rect_size.y:
		shiftY += subdivision_distance
		if shiftY < rect_size.y and shiftY > rect_position.y:
			draw_line(Vector2(rect_position.x,shiftY), Vector2(rect_size.x,shiftY),sublines_color, 1.0, false)
			draw_string (font, Vector2(axis_center_position.x+5,shiftY),str("-",1), color, -1)

func create_axis_x():
	draw_line(Vector2(rect_position.x,axis_center_position.y), Vector2(rect_size.x,axis_center_position.y), color, 1.25, false)

func create_axis_y():
	draw_line(Vector2(axis_center_position.x,rect_position.y), Vector2(axis_center_position.x,rect_size.y), color, 1.25, false)
	
func cand_draw_y():
	if axis_center_position.x <= rect_size.x and axis_center_position.x >= rect_position.x:
		return true

func cand_draw_x():
	if axis_center_position.y <= rect_size.y and axis_center_position.y >= rect_position.y:
		return true

func _draw():
	if cand_draw_x():
		create_axis_x()
	if cand_draw_y():
		create_axis_y()
	sub_axis()
#   Talvez uma possivel forma de manter a resolução
#	print(get_viewport().size, get_viewport().get_final_transform ( ))
	
