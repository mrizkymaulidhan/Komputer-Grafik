extends MyTransform

class_name MyShape

#Override
func randomTitik():
	var titik = [rand_range(50,970), rand_range(50,540)]
	return titik

func persegi(x, y, s, px, c):
	garisPutus(x, y, x+s, y, 1, 1, c)
	garisPutus(x+s, y, x+s, y+s, 1, 1, c)
	garisPutus(x+s, y+s, x, y+s, 1, 1, c)
	garisPutus(x, y+s+1, x, y+1, 1, 1, c)
	
	if px > 1:
		px -= 1
		x += 1
		y += 1
		s -= 2
		persegi(x, y, s, px, c)

func persegiPanjang(x, y, p, l, px, c):
	garisPutus(x, y, x+p, y, px, 1, c)
	garisPutus(x+p, y, x+p, y+l, px, 1, c)
	garisPutus(x+p, y+l, x, y+l, px, 1, c)
	garisPutus(x, y+l+1, x, y+1, px, 1, c)

func segitigaSiku(x, y, a, t, px, c):
	garisPutus(x, y, x+a, y, px, 1, c)
	garisPutus(x+a, y, x, y-t, px, 1, c)
	garisPutus(x, y-t, x, y, px, 1, c)

func trapesiumSiku(x, y, sa, sb, t, px, c):
	garisPutus(x, y, x+sa, y, px, 1, c)
	garisPutus(x+sa, y, x+sb, y+t, px, 1, c)
	garisPutus(x+sb, y+t, x, y+t, px, 1, c)
	garisPutus(x, y+t, x, y, px, 1, c)

func jajarGenjang(x, y, p, t, px, c):
	garisPutus(x, y, x+p, y, px, 1, c)
	garisPutus(x+p, y, x+p+30, y+t, px, 1, c)
	garisPutus(x+p+30, y+t, x+30, y+t, px, 1, c)
	garisPutus(x+30, y+t, x, y, px, 1, c)

func belahKetupat(x, y, d, px, c):
	lineDDA(x, y, x+(d/2), y-(d/2), c)
	lineDDA(x+(d/2), y-(d/2), x+d, y, c)
	lineDDA(x+d, y, x+(d/2), y+(d/2), c)
	lineDDA(x+(d/2), y+(d/2), x, y, c)
	
	if px > 1:
		px -= 1
		x += 1
		d -= 2
		belahKetupat(x, y, d, px, c)

func midpointCircle(xC, yC, r, px):
	var x : int = r
	var y : int = 0
	var err : int = 0
	
	while x >= y:
		put_pixel(xC+x, yC+y, Color(0.5, 0.5, 0.5))
		put_pixel(xC+y, yC+x, Color(0.0, 1.0, 0.0))
		put_pixel(xC-y, yC+x, Color(0.0, 0.0, 1.0))
		put_pixel(xC-x, yC+y, Color(1.0, 1.0, 0.0))
		put_pixel(xC-x, yC-y, Color(1.0, 0.0, 1.0))
		put_pixel(xC-y, yC-x, Color(0.0, 1.0, 1.0))
		put_pixel(xC+y, yC-x, Color(1.0, 0.0, 0.0))
		put_pixel(xC+x, yC-y, Color(1.0, 1.0, 1.0))
		
		if err <= 0:
			y += 1
			err += 2*y + 1
		elif err > 0:
			x -= 1
			err -= 2*x + 1
	
	if px > 1:
		px -= 1
		r -= 1
		midpointCircle(xC, yC, r, px)

func midpointCircle2(xC, yC, r, px, c):
	var x : int = r
	var y : int = 0
	var err : int = 0
	
	while x >= y:
		put_pixel(xC+x, yC+y, c)
		put_pixel(xC+y, yC+x, c)
		put_pixel(xC-y, yC+x, c)
		put_pixel(xC-x, yC+y, c)
		put_pixel(xC-x, yC-y, c)
		put_pixel(xC-y, yC-x, c)
		put_pixel(xC+y, yC-x, c)
		put_pixel(xC+x, yC-y, c)
		
		if err <= 0:
			y += 1
			err += 2*y + 1
		elif err > 0:
			x -= 1
			err -= 2*x + 1
	
	if px > 1:
		px -= 1
		r -= 1
		midpointCircle2(xC, yC, r, px, c)

func midCircle(xC, yC, r, px):
	var x : int = r
	var y : int = 0
	var err : int = 0
	
	while x >= y:
		put_pixel(xC+y, yC+x, Color(0.0, 1.0, 0.0))
		put_pixel(xC-y, yC+x, Color(0.0, 0.0, 1.0))
		
		if err <= 0:
			y += 1
			err += 2*y + 1
		elif err > 0:
			x -= 1
			err -= 2*x + 1
	
	if px > 1:
		px -= 1
		r -= 1
		midpointCircle(xC, yC, r, px)

func midpointEllipse(xc, yc, rx, ry):
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
		put_pixel(x+xc, y+yc, Color(1,0,0))
		put_pixel(-x+xc, y+yc, Color(0,1,0))
		put_pixel(x+xc, -y+yc, Color(0,0,1))
		put_pixel(-x+xc, -y+yc, Color(1,1,0))
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
		put_pixel(x+xc, y+yc, Color(1,0,0))
		put_pixel(-x+xc, y+yc, Color(0,1,0))
		put_pixel(x+xc, -y+yc, Color(0,0,1))
		put_pixel(-x+xc, -y+yc, Color(1,1,0))
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

func segitigaSamaSisi(x1, y1, x2, y2, c):
	var tRot1: Vector2
	var tRot2: Vector2
	var deg = 60
	
	lineDDA(x1, y1, x2, y2, c)
	tRot1 = rotasi(Vector2(x2,y2), Vector2(x1,y1), deg)
	tRot2 = rotasi(Vector2(x1,y1), Vector2(tRot1.x, tRot1.y), deg)
	lineDDA(x1, y1, tRot1.x, tRot1.y, c)
	lineDDA(tRot1.x, tRot1.y, tRot2.x, tRot2.y, c)

func segitigaSamaSisi2(x1, y1, x2, y2, c):
	var tRot1: Vector2
	var tRot2: Vector2
	var deg = 60
	
	tRot1 = rotasi(Vector2(x2,y2), Vector2(x1,y1), deg)
	tRot2 = rotasi(Vector2(x1,y1), Vector2(tRot1.x, tRot1.y), deg)
	lineDDA(x1, y1, tRot1.x, tRot1.y, c)
	lineDDA(tRot1.x, tRot1.y, tRot2.x, tRot2.y, c)

func belahKetupat2(x1, y1, x2, y2, c):
	var tRot: Vector2
	var deg = 360
	
	segitigaSamaSisi2(x1, y1, x2, y2, c)
	tRot = rotasi(Vector2(x2,y2), Vector2(x1,y1), deg)
	segitigaSamaSisi2(x2, y2, tRot.x, tRot.y, c)
