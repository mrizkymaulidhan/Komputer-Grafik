extends Node2D

class_name Stroke

func window_size(x, y):
	OS.set_window_size(Vector2(x, y))

func put_pixel(x, y, color):
	var point = PoolVector2Array([Vector2(x,y)])
	var colors = PoolColorArray([color])
	
	draw_primitive(point, colors, point, null, 1.0, null)

func lineDDA(xa, ya, xb, yb, c):
	var dx:float = xb - xa
	var dy:float = yb - ya
	var steps
	var xIncrement
	var yIncrement
	var x = xa
	var y = ya
	
	if abs(dx) > abs(dy): steps = abs(dx)
	else: steps = abs(dy)
	
	xIncrement = dx / steps
	yIncrement = dy / steps
	
	put_pixel(round(x), round(y), c)
	for k in steps:
		x += xIncrement
		y += yIncrement
		put_pixel(round(x), round(y), c)

func randomColor():
	var r = rand_range(0.0, 1.0)
	var g = rand_range(0.0, 1.0)
	var b =  rand_range(0.0, 1.0)
	return Color(r, g ,b)

func randomTitik():
	var titik = [rand_range(10.0,1010.0), rand_range(10.0,590.0), rand_range(10.0,1010.0), rand_range(10.0,590.0)]
	return titik

func garisTebal(xa, ya, xb, yb, px, c):	
	if ya == yb:
		for y in px:
			lineDDA(xa, ya+y, xb, yb+y, c)
	elif xa == xb:
		for x in px:
			lineDDA(xa+x, ya, xb+x, yb, c)
	elif ya < yb:
		for y in px:
			lineDDA(xa, ya+y, xb, yb+y, c)
	elif ya > yb:
		for y in px:
			lineDDA(xa, ya-y, xb, yb-y, c)

func garisPutus(xa, ya, xb, yb, px, gap, c):
	var p = (Vector2(xb,yb) - Vector2(xa,ya)).length()
	var norm = (Vector2(xb,yb) - Vector2(xa,ya)).normalized()
	var step = norm * gap
	
	if p < gap:
		garisTebal(xa, ya, xb, yb, px, c)
	else:
		var draw_flag = true
		var start = Vector2(xa,ya)
		var steps = p/gap
		for i in range(0, steps + 1):
			var end = start + step
			if draw_flag:
				garisTebal(start.x, start.y, end.x, end.y, px, c)
			start = end
			draw_flag = !draw_flag
