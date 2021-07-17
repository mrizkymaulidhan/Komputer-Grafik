extends MyShape

# Object-1
func object1(xc, yc):
	# Lingkaran Dalam
	midpointCircle2(xc, yc, 15, 15, Color(1,0.8,0.8))
	
	#Lingkaran Luar
	midpointCircle2(xc, yc, 20, 5, Color(0,0.6,0.6))
	
	# Garis-Garis Tengah
	garisTebal(xc-1.5, yc-35, xc-1.5, yc+35, 3, Color(0,0.3,0.3))
	
	# Rotasi garis 45
	var rot1 = rotasi(Vector2(xc,yc-35), Vector2(xc,yc), 45)
	var rot2 = rotasi(Vector2(xc,yc+35), Vector2(xc,yc), 45)
	garisTebal(rot1.x, rot1.y, rot2.x, rot2.y, 4, Color(0,0.3,0.3))
	
	# Rotasi garis 90
	rot1 = rotasi(Vector2(xc,yc-35), Vector2(xc,yc), 90)
	rot2 = rotasi(Vector2(xc,yc+35), Vector2(xc,yc), 90)
	garisTebal(rot1.x, rot1.y, rot2.x, rot2.y, 3, Color(0,0.3,0.3))
	
	# Rotasi garis 135
	rot1 = rotasi(Vector2(xc,yc-35), Vector2(xc,yc), -45)
	rot2 = rotasi(Vector2(xc,yc+35), Vector2(xc,yc), -45)
	garisTebal(rot1.x, rot1.y, rot2.x, rot2.y, 4, Color(0,0.3,0.3))

# Object-1 Generation
func obj1Generation(x, y, m, n):
	var trans = Vector2(x,y)
	
	# m * n
	for j in m:
		for i in n:
			object1(trans.x, trans.y)
			trans = translasi(Vector2(trans.x,trans.y), Vector2(140,0))
		trans = translasi(Vector2(x,trans.y), Vector2(0,140))

# Object-2
func object2(x, y):
	var xc = x - 10
	var yc = y - 10
	
	#Segitiga
	Segitiga(x, y-57, 50, 25, 25, Color(0,0.6,0.6), 180)
	Segitiga(x+57, y, 50, 25, 25, Color(0,0.6,0.6), 270)
	Segitiga(x, y+57, 50, 25, 25, Color(0,0.6,0.6), 360)
	Segitiga(x-57, y, 50, 25, 25, Color(0,0.6,0.6), 90)
	
	# Bunga4
	midpointCircle2(x, y, 5, 5, Color(0,0.3,0.3))
	put_pixel(x,y,Color(0,0.3,0.3))
	put_pixel(x,y,Color(0,0.3,0.3))
	midCircle(x, y+20, 20, 6, Color(1,0.6,0.2), 180)
	midCircle(x-20, y, 20, 6, Color(1,0.6,0.2), 270)
	midCircle(x, y-20, 20, 6, Color(1,0.6,0.2), 360)
	midCircle(x+20, y, 20, 6, Color(1,0.6,0.2), 90)

# Object-2 Generation
func obj2Generation(x, y, m, n):
	var trans = Vector2(x,y)
	
	# m * n
	for j in m:
		for i in n:
			object2(trans.x, trans.y)
			trans = translasi(Vector2(trans.x,trans.y), Vector2(140,0))
		trans = translasi(Vector2(x,trans.y), Vector2(0,140))

func _on_home_pressed():
	get_tree().change_scene("res://menu.tscn")

func _draw():
	window_size(1010,590)
	set_process(false)
	obj2Generation(0,0,5,8)
	obj1Generation(70,70,5,8)
