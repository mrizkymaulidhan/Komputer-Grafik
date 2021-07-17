extends MyShape

func bunga2(x1, y1, x2, y2):
	var mid = Vector2(x2,y2) - Vector2(x1,y1)
	mid = Vector2(mid) / 2
	mid = Vector2(abs(mid.x), abs(mid.y))
	
	if(x2 >= x1):
		midpointEllipse(x1+mid.x, y1, mid.x, mid.y/3)
		if(y2 <= y1):
			midpointEllipse(x2, y2+mid.y, mid.x/3, mid.y)
		else:
			midpointEllipse(x2, y2-mid.y, mid.x/3, mid.y)
	elif(x2 <= x1):
		midpointEllipse(x1-mid.x, y1, mid.x, mid.y/3)
		if(y2 >= y1):
			midpointEllipse(x2, y2-mid.y, mid.x/3, mid.y)
		else:
			midpointEllipse(x2, y2+mid.y, mid.x/3, mid.y)

func bunga4(x1, y1, x2, y2):
	var hRot: Vector2
	var vRot: Vector2
	var deg = 180
	
	bunga2(x1, y1, x2, y2)
	hRot = rotasi(Vector2(x2,y1), Vector2(x1,y1), deg)
	vRot = rotasi(Vector2(x2,y1), Vector2(x2,y2), deg)
	bunga2(hRot.x, hRot.y, vRot.x, vRot.y)

func bunga4Generation(x1, y1, x2, y2):
	var trans1 = Vector2(x1,y1)
	var trans2 = Vector2(x2,y2)
	var diff = trans2 - trans1
	diff = Vector2(abs(diff.x), abs(diff.y))
	
	for j in 6:
		for i in 9:
			bunga4(trans1.x, trans1.y, trans2.x, trans2.y)
			trans1 = translasi(Vector2(trans1.x, trans1.y), Vector2(2.4*diff.x,0))
			trans2 = translasi(Vector2(trans2.x, trans2.y), Vector2(2.4*diff.x,0))
		trans1 = translasi(Vector2(x1, trans1.y), Vector2(0,2.4*diff.y))
		trans2 = translasi(Vector2(x2, trans2.y), Vector2(0,2.4*diff.y))

func midEllipseH(xc, yc, rx, ry):
	var dx: float
	var dy: float
	var d1: float
	var d2: float
	var x: float = 0
	var y: float = ry
	
	d1 = (ry*ry) - (rx*rx*ry) + (0.25*rx*rx)
	dx = 2*ry*ry*x
	dy = 2*rx*rx*y
	
	while dx < dy:
		put_pixel(x+xc+rx, y+yc, Color(1,0,0))
		put_pixel(-x+xc-rx, y+yc, Color(0,1,0))
		put_pixel(x+xc+rx, -y+yc, Color(0,0,1))
		put_pixel(-x+xc-rx, -y+yc, Color(1,1,0))
		if d1 < 0:
			x+=1
			dx = dx + (2*ry*ry)
			d1 = d1 + dx + (ry*ry)
		else:
			x+=1
			y-=1
			dx = dx + (2*ry*ry)
			dy = dy - (2*rx*rx)
			d1 = d1 + dx - dy + (ry*ry)
	
	d2 = ((ry*ry) * ((x+0.5) * (x+0.5))) + ((rx*rx) * ((y-1)  * (y-1))) - (rx*rx*ry*ry)
	
	while y >= 0:
		put_pixel(x+xc+rx, y+yc, Color(1,0,0))
		put_pixel(-x+xc-rx, y+yc, Color(0,1,0))
		put_pixel(x+xc+rx, -y+yc, Color(0,0,1))
		put_pixel(-x+xc-rx, -y+yc, Color(1,1,0))
		if d2 > 0:
			y -= 1
			dy = dy - (2*rx*rx)
			d2 = d2 + (rx*rx) - dy
		else:
			y-=1
			x+=1
			dx = dx + (2*ry*ry)
			dy = dy - (2*rx*rx)
			d2 = d2 + dx - dy + (rx*rx)

func midEllipseV(xc, yc, rx, ry):
	var dx: float
	var dy: float
	var d1: float
	var d2: float
	var x: float = 0
	var y: float = ry
	
	d1 = (ry*ry) - (rx*rx*ry) + (0.25*rx*rx)
	dx = 2*ry*ry*x
	dy = 2*rx*rx*y
	
	while dx < dy:
		put_pixel(x+xc, y+yc+ry, Color(1,0,0))
		put_pixel(-x+xc, y+yc+ry, Color(0,1,0))
		put_pixel(x+xc, -y+yc-ry, Color(0,0,1))
		put_pixel(-x+xc, -y+yc-ry, Color(1,1,0))
		if d1 < 0:
			x+=1
			dx = dx + (2*ry*ry)
			d1 = d1 + dx + (ry*ry)
		else:
			x+=1
			y-=1
			dx = dx + (2*ry*ry)
			dy = dy - (2*rx*rx)
			d1 = d1 + dx - dy + (ry*ry)
	
	d2 = ((ry*ry) * ((x+0.5) * (x+0.5))) + ((rx*rx) * ((y-1)  * (y-1))) - (rx*rx*ry*ry)
	
	while y >= 0:
		put_pixel(x+xc, y+yc+ry, Color(1,0,0))
		put_pixel(-x+xc, y+yc+ry, Color(0,1,0))
		put_pixel(x+xc, -y+yc-ry, Color(0,0,1))
		put_pixel(-x+xc, -y+yc-ry, Color(1,1,0))
		if d2 > 0:
			y -= 1
			dy = dy - (2*rx*rx)
			d2 = d2 + (rx*rx) - dy
		else:
			y-=1
			x+=1
			dx = dx + (2*ry*ry)
			dy = dy - (2*rx*rx)
			d2 = d2 + dx - dy + (rx*rx)

func midEllipseVH(xc, yc, rx, ry, deg):
	var dx: float
	var dy: float
	var d1: float
	var d2: float
	var x: float = 0
	var y: float = ry
	var rot1
	var rot2
	var rot3
	var rot4
	
	d1 = (ry*ry) - (rx*rx*ry) + (0.25*rx*rx)
	dx = 2*ry*ry*x
	dy = 2*rx*rx*y
	
	while dx < dy:
		rot1 = rotasi(Vector2(x+xc+(rx*1.2),y+yc), Vector2(xc,yc), deg)
		rot2 = rotasi(Vector2(-x+xc-(rx*1.2),y+yc), Vector2(xc,yc), deg)
		rot3 = rotasi(Vector2(x+xc+(rx*1.2),-y+yc), Vector2(xc,yc), deg)
		rot4 = rotasi(Vector2(-x+xc-(rx*1.2), -y+yc), Vector2(xc,yc), deg)
		put_pixel(rot1.x, rot1.y, Color(1,0,0))
		put_pixel(rot2.x, rot2.y, Color(0,1,0))
		put_pixel(rot3.x, rot3.y, Color(0,0,1))
		put_pixel(rot4.x, rot4.y, Color(1,1,0))
		if d1 < 0:
			x+=1
			dx = dx + (2*ry*ry)
			d1 = d1 + dx + (ry*ry)
		else:
			x+=1
			y-=1
			dx = dx + (2*ry*ry)
			dy = dy - (2*rx*rx)
			d1 = d1 + dx - dy + (ry*ry)
	
	d2 = ((ry*ry) * ((x+0.5) * (x+0.5))) + ((rx*rx) * ((y-1)  * (y-1))) - (rx*rx*ry*ry)
	
	while y >= 0:
		rot1 = rotasi(Vector2(x+xc+(rx*1.2),y+yc), Vector2(xc,yc), deg)
		rot2 = rotasi(Vector2(-x+xc-(rx*1.2),y+yc), Vector2(xc,yc), deg)
		rot3 = rotasi(Vector2(x+xc+(rx*1.2),-y+yc), Vector2(xc,yc), deg)
		rot4 = rotasi(Vector2(-x+xc-(rx*1.2), -y+yc), Vector2(xc,yc), deg)
		put_pixel(rot1.x, rot1.y, Color(1,0,0))
		put_pixel(rot2.x, rot2.y, Color(0,1,0))
		put_pixel(rot3.x, rot3.y, Color(0,0,1))
		put_pixel(rot4.x, rot4.y, Color(1,1,0))
		if d2 > 0:
			y -= 1
			dy = dy - (2*rx*rx)
			d2 = d2 + (rx*rx) - dy
		else:
			y-=1
			x+=1
			dx = dx + (2*ry*ry)
			dy = dy - (2*rx*rx)
			d2 = d2 + dx - dy + (rx*rx)

func bunga8(xc, yc, rx, ry):
	midEllipseVH(xc, yc, (rx*0.62), (ry*0.62), 90)
	midEllipseVH(xc, yc, (rx*0.62), (ry*0.62), 270)
	midEllipseH(xc, yc, rx, ry)
	midEllipseV(xc, yc, ry, rx)

func bunga8Generation(x1, y1, rx, ry):
	var trans1 = Vector2(x1,y1)
	
	for j in 5:
		for i in 9:
			bunga8(trans1.x, trans1.y, rx, ry)
			trans1 = translasi(Vector2(trans1.x, trans1.y), Vector2(rx*4,0))
		trans1 = translasi(Vector2(x1, trans1.y), Vector2(0,rx*4))

func _on_home_pressed():
	get_tree().change_scene("res://menu.tscn")

func _draw():
	window_size(1010,590)
	bunga4Generation(10,60,60,110)
	bunga4Generation(-50,0,0,50)
	bunga8Generation(60,60,30,15)
	set_process(false)
