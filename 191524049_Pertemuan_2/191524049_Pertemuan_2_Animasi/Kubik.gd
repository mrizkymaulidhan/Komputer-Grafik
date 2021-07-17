extends Node2D

func window_size(x, y):
	OS.set_window_size(Vector2(x, y))
	
func put_pixel(x, y, color):
	var point = PoolVector2Array([Vector2(x,y)])
	var colors = PoolColorArray([color])
	
	draw_primitive(point, colors, point, null, 1.0, null)

func lineDDA(xa, ya, xb, yb):
	var dx = xb - xa
	var dy = yb - ya
	var steps
	var xIncrement
	var yIncrement
	var x = xa
	var y = ya
	
	if abs(dx) > abs(dy): steps = abs(dx)
	else: steps = abs(dy)
	
	xIncrement = dx / steps
	yIncrement = dy / steps
	
	put_pixel(round(x), round(y), Color(1.0, 1.0, 1.0))
	for k in steps:
		x += xIncrement
		y += yIncrement
		put_pixel(round(x), round(y), Color(1.0, 1.0, 1.0))

func lineBres(xa, ya, xb, yb):
	var dx = xb - xa
	var dy = yb - ya
	var p = 2 * dy - dx
	var twoDy = 2 * dy
	var twoDyDx = 2 * (dy-dx)
	var x
	var y
	var xEnd
	
	if xa > xb:
		x = xb
		y = yb
		xEnd = xa
	else: 
		x = xa
		y = ya
		xEnd = xb
	
	put_pixel(x, y, Color(1.0, 1.0, 1.0))
	while x < xEnd:
		x += 1
		if p < 0:
			p += twoDy
		else:
			y += 1
			p += twoDyDx
		put_pixel(x, y, Color(1.0, 1.0, 1.0))

func midpointLine(xa, ya, xb, yb):
	var dx = xb - xa
	var dy = yb - ya
	var x = xa
	var y = ya
	var d
	
	if dy <= dx:
		d = dy - (dx/2)
		put_pixel(x, y, Color(1.0, 1.0, 1.0))
		while x < xb:
			x += 1
			if d < 0:
				d += dy
			else:
				d += (dy-dx)
				y += 1
			put_pixel(x, y, Color(1.0, 1.0, 1.0))
	else:
		d = dx - (dy/2)
		put_pixel(x, y, Color(1.0, 1.0, 1.0))
		while y < yb:
			y += 1
			if d < 0:
				d += dx
			else:
				d += (dx-dy)
				x += 1
			put_pixel(x, y, Color(1.0, 1.0, 1.0))

var size = 50
var re = 1.0
var gr = 1.0
var bl = 0.0

func persKubik(a, b, c, d):
	var y
	var x = -6.62
	while x < 6.61:
		x += 0.001
		y = (a*x*x*x) + (b*x*x) + (c*x) + d
		put_pixel((size*x)+450, 300-(y*size), Color(re, gr, bl))

func _process(delta):
	size += 10
	re = rand_range(0.0,1.0)
	gr = rand_range(0.0,1.0)
	bl = rand_range(0.0,1.0)
	if size <= 540:
		update()

func _draw():
	var margin = 10
	
	#Perbandingan(p:l=60:40)
	window_size(900,600)
	
	# Bingkai
	lineDDA(margin,margin,margin,600-margin)
	lineDDA(900-margin,margin,900-margin,600-margin)
	lineBres(margin,margin,900-margin,margin)
	lineBres(margin,600-margin,900-margin,600-margin)
	
	# Garis Kartesian	
	midpointLine(450,margin,450,600-margin)
	midpointLine(margin,300, 900-margin,300)
	
	# Grafik Persamaan Kubik
	persKubik(1,0,0,0)


func _on_buttonKubik_pressed():
	get_tree().change_scene("res://Sinus.tscn")

func _on_buttonKubik2_pressed():
	get_tree().change_scene("res://Kuadrat.tscn")
