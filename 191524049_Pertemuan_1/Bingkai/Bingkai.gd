extends Node2D

func window_size(x, y):
	OS.set_window_size(Vector2(x, y))

func put_pixel(x, y, color):
	var point = PoolVector2Array([Vector2(x,y)])
	var colors = PoolColorArray([color])

	draw_primitive(point, colors, point, null, 1.0, null)
	
func _draw():
	var x = 200
	var y = 200
	var margin = 10
	var color = Color(1.0, 1.0, 1.0)
	
	window_size(620, 620)
	
	for i in 300:
		put_pixel(100+i, 100, color)
		put_pixel(500, 200+i, color)
		
	for i in 600:
		put_pixel(margin+i, margin, color)
		put_pixel(margin, margin+i, color)
		put_pixel(margin+600, margin+i, color)
		put_pixel(margin+i, margin+600, color)
	
	for i in 10:
		for j in 65:
			put_pixel(i+10*j, i, color)
			put_pixel(i, i+10*j, color)
			put_pixel(i+610, i+10*j, color)
			put_pixel(i+10*j, i+610, color)
			put_pixel(-i+10*j, i, color)
			put_pixel(i, -i+10*j, color)
			put_pixel(-i+10*j, i+610, color)
			put_pixel(i+610, -i+10*j, color)
