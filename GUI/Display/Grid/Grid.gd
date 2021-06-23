extends Control

var display_limits = Vector2.ZERO
var display_init = Vector2.ZERO
var middleX = 0
var middleY = 0
var color = Color(0,0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	display_limits =  get_rect().size
	display_init = get_rect().position
	middleX = display_limits.x/2
	middleY = display_limits.y/2

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	update()

func create_axis():
	draw_line(Vector2(0,middleY), Vector2(display_limits.x,middleY), color, 1.25, false)
	draw_line(Vector2(middleX,0), Vector2(middleX,display_limits.y), color, 1.25, false)
	
func sub_axis(subdivision = 24):
	var sublines_color = ColorN("gray")
	var subdivision_distance = display_limits.x/subdivision
	
	var shiftX = middleX
	while shiftX > display_init.y:
		shiftX -= subdivision_distance
		if shiftX > display_init.y:
			draw_line(Vector2(shiftX,0), Vector2(shiftX,display_limits.y),sublines_color, 1.0, false)
	
	shiftX = middleX
	while shiftX < display_limits.x:
		shiftX += subdivision_distance
		if shiftX < display_limits.x:
			draw_line(Vector2(shiftX,0), Vector2(shiftX,display_limits.y),sublines_color, 1.0, false)
	
	var shiftY = middleY
	while shiftY > 0:
		shiftY -= subdivision_distance
		if shiftY > 0:
			draw_line(Vector2(0,shiftY), Vector2(display_limits.x,shiftY),sublines_color, 1.0, false)
			
	shiftY = middleY
	while shiftY < display_limits.y:
		shiftY += subdivision_distance
		if shiftY < display_limits.y:
			draw_line(Vector2(0,shiftY), Vector2(display_limits.x,shiftY),sublines_color, 1.0, false)

func _draw():
	create_axis()
	sub_axis()
	
