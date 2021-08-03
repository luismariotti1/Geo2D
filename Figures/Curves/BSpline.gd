extends Control

var transform = Transform2D.IDENTITY
var points = PoolVector2Array()
var controllers
var degree = 1
var knots = []
var num_knots
var sub_division = 100
var num_controls_min = 0
var num_controls = 4


func create_knots():
	var knot_remaining = num_knots
	for i in range(degree+1):
		knots.append(0)
	knot_remaining -= degree+1
	var medium_knots = knot_remaining-(degree+1)
	for i in range(knot_remaining-(degree+1)):
		knots.append(float(i+1)/(medium_knots+1))
	for i in range(degree+1):
		knots.append(1)

func _ready():
	num_controls_min = degree + 1
	num_knots = num_controls + degree + 1
	print(num_knots)
	create_knots()
	controllers = [Vector2(-4, -4), Vector2(-2, 4), Vector2(2, -4), Vector2(4, 4)]
	points = PoolVector2Array()
	var u = 0
	for i in range(0, sub_division+1):
		points.push_back(bspline(u, knots, controllers, degree)*50)
		u += float(1)/sub_division
		if u >= 1:
			u = 0.999


func bias(x, k, i, t):
	if k == 0:
		return 1.0 if t[i] <= x and x < t[i + 1] else 0.0
	var c1
	if t[i + k] == t[i]:
		c1 = 0.0
	else:
		c1 = (x - t[i]) / (t[i + k] - t[i]) * bias(x, k - 1, i, t)
	var c2
	if t[i + k + 1] == t[i + 1]:
		c2 = 0.0
	else:
		c2 = (t[i + k + 1] - x) / (t[i + k + 1] - t[i + 1]) * bias(x, k - 1, i + 1, t)
	return c1 + c2


func bspline(x, t, controle, k):
	var n = len(t) - k - 1
	if (n >= k + 1) and (len(controle) >= n):
		var sum = Vector2(0,0)
		for i in range(n):
			var b = bias(x, k, i, t)
			sum += controle[i] * b
		return sum


func _physics_process(delta):
	transform = Transform2D.IDENTITY
	transform = transform.translated(Vector2(500, 250))


func _draw():
	draw_set_transform_matrix(transform)
	draw_polyline(points, ColorN("red"), 4.0)
	for control in controllers:
		draw_circle(control*50, 5, ColorN("black"))

