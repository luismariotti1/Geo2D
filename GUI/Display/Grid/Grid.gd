extends Control

var display_limits = Vector2.ZERO
var middleX = 0
var middleY = 0
var color = Color(0,0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	display_limits =  get_rect().size
	middleX = display_limits.x/2
	middleY = display_limits.y/2

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	update()
	
func _draw():
	draw_line(Vector2(0,middleY), Vector2(display_limits.x,middleY), color, 1.25, false)
	draw_line(Vector2(middleX,0), Vector2(middleX,display_limits.y), color, 1.25, false)
