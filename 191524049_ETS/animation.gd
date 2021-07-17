extends MyShape

# Variabel Global
var glob_rot = 0
var glob_radius = 0
var glob_width = 1
var status = "Pattern 1"
var speed = 0
var rotate = "None"
var direct = "None"

# Challenge
var c1 = Color(1,0.8,0.8)
var c2 = Color(0,0.6,0.6)
var c3 = Color(0,0.3,0.3)
var c4 = Color(1,0.6,0.2)

# Object-1
func object1(xc, yc, rad):
	#Lingkaran Dalam
	midpointCircle2(xc, yc, 45-rad, glob_width, c1)
	
	# Lingkaran Luar
	midpointCircle2(xc, yc, 50-rad, glob_width, c2)
	
	# Garis-Garis Tengah
	var rot1 = rotasi(Vector2(xc,yc-35), Vector2(xc,yc), glob_rot)
	var rot2 = rotasi(Vector2(xc,yc+35), Vector2(xc,yc), glob_rot)
	garisTebal(rot1.x, rot1.y, rot2.x, rot2.y, 1, c3)
	
	# Rotasi Garis 45
	rot1 = rotasi(Vector2(xc,yc-35), Vector2(xc,yc), glob_rot+45)
	rot2 = rotasi(Vector2(xc,yc+35), Vector2(xc,yc), glob_rot+45)
	garisTebal(rot1.x, rot1.y, rot2.x, rot2.y, 1, c3)
	
	# Rotasi Garis 90
	rot1 = rotasi(Vector2(xc,yc-35), Vector2(xc,yc), glob_rot+90)
	rot2 = rotasi(Vector2(xc,yc+35), Vector2(xc,yc), glob_rot+90)
	garisTebal(rot1.x, rot1.y, rot2.x, rot2.y, 1, c3)
	
	# Rotasi Garis 135
	rot1 = rotasi(Vector2(xc,yc-35), Vector2(xc,yc), glob_rot+135)
	rot2 = rotasi(Vector2(xc,yc+35), Vector2(xc,yc), glob_rot+135)
	garisTebal(rot1.x, rot1.y, rot2.x, rot2.y, 1, c3)

# Object-1 Generation
func obj1Generation(x, y, m, n, r):
	var trans = Vector2(x,y)

	# m * n
	for j in m:
		for i in n:
			object1(trans.x, trans.y, r)
			trans = translasi(Vector2(trans.x,trans.y), Vector2(140,0))
		trans = translasi(Vector2(x,trans.y), Vector2(0,140))

# Object-2
func object2(x, y):
	
	#Segitiga
	Segitiga(x, y-57, 50, 25, glob_width, c2, glob_rot+0)
	Segitiga(x+57, y, 50, 25, glob_width, c2, glob_rot+90)
	Segitiga(x, y+57, 50, 25, glob_width, c2, glob_rot+180)
	Segitiga(x-57, y, 50, 25, glob_width, c2, glob_rot+270)
	
	# Bunga4
	put_pixel(x, y, Color(0,0.3,0.3))
	midCircle(x, y+20, 20, glob_width, c4, glob_rot+0)
	midCircle(x-20, y, 20, glob_width,c4, glob_rot+90)
	midCircle(x, y-20, 20, glob_width, c4, glob_rot+180)
	midCircle(x+20, y, 20, glob_width, c4, glob_rot+270)
	midpointCircle2(x, y, glob_width, 2, c3)

# Object-2 Generation
func obj2Generation(x, y, m, n):
	var trans = Vector2(x,y)
	
	# m * n
	for j in m:
		for i in n:
			object2(trans.x, trans.y)
			trans = translasi(Vector2(trans.x,trans.y), Vector2(140,0))
		trans = translasi(Vector2(x,trans.y), Vector2(0,140))

# Bingkai
func bingkai(x, y):
	var tScal
	var plScal
	
	persegiPanjang(x, y, 540, 400, 1, Color(1,0.6,0.2))
	tScal = scaling(Vector2(x,y), Vector2(x+(540/2),y+(440/2)), 1.05)
	plScal = scaling(Vector2(x+540,y+400), Vector2(x+(540/2),y+(440/2)), 1.05)
	persegiPanjang(tScal.x, tScal.y, plScal.x-tScal.x, plScal.y+2-tScal.y, 1, Color(0,0.6,0.6))

var maks_rad = false

func _process(delta):
	if !maks_rad : 
		glob_radius += 5 * speed * delta
		if glob_radius >= 30 : maks_rad = true
	else : 
		glob_radius -= 5 * speed * delta
		if glob_radius <= 0 : maks_rad = false
		
	if rotate == "Right" : glob_rot += 10 * speed * delta
	elif rotate == "Left" : glob_rot -= 10 * speed * delta
	
	# Challenge
	if direct == "Right" : 
		if pos.x >= 295 && pos.x < 715 && pos.y == 155 :
			pos = translasi(pos,Vector2(35,0))
		elif pos.x == 715 && pos.y >= 155 && pos.y < 435  :
			pos = translasi(pos,Vector2(0,35))
		elif pos.x <= 715 && pos.x > 295 && pos.y == 435 :
			pos = translasi(pos,Vector2(-35,0))
		elif pos.x == 295 && pos.y <= 435 && pos.y > 155 :
			pos = translasi(pos,Vector2(0,-35))
	elif direct == "Left" : 
		if pos.x > 295 && pos.x <= 715 && pos.y == 155 :
			pos = translasi(pos,Vector2(-35,0))
		elif pos.x == 295 && pos.y >= 155 && pos.y < 435  :
			pos = translasi(pos,Vector2(0,35))
		elif pos.x < 715 && pos.x >= 295 && pos.y == 435 :
			pos = translasi(pos,Vector2(35,0))
		elif pos.x == 715 && pos.y <= 435 && pos.y > 155 :
			pos = translasi(pos,Vector2(0,-35))
	
	# Challenge
	if rand_color :
		c1 = randomColor()
		c2 = randomColor()
		c3 = randomColor()
		c4 = randomColor()
	
	update()

func _on_pattern1_pressed():
	status = "Pattern 1"
	glob_rot = 0
	glob_radius = 0
	speed = 0
	rotate = "None"
	direct = "None"
	rad = 0
	pos = Vector2(295,155)
	update()

func _on_pattern2_pressed():
	status = "Pattern 2"
	glob_rot = 180
	glob_radius = 30
	speed = 0
	rotate = "None"
	direct = "None"
	rad = 30
	pos = Vector2(295,155)
	update()

var play = false

func _on_play_pressed():
	status = "Animation (Playing)"
	play = true
	speed = 10
	rotate = "Right"
	direct = "Right"
	rad = 30
	set_process(true)

func _on_stop_pressed():
	status = "Animation (Stopped)"
	play = false
	speed = 0
	rotate = "None"
	direct = "None"
	update()
	set_process(false)

func _on_speedUp_pressed():
	if speed < 20 : speed += 1

func _on_speedDown_pressed():
	if speed > 1 : speed -= 1

func _on_chgRotate_pressed():
	if rotate == "Right" :
		rotate = "Left"
	else :
		rotate = "Right"

func _on_howTo_pressed():
	get_tree().change_scene("res://howTo.tscn")

func _on_home_pressed():
	get_tree().change_scene("res://menu.tscn")

# Challenge
var rand_color = false

# Challenge
func _on_chgColor_pressed():
	rand_color = false
	c1 = randomColor()
	c2 = randomColor()
	c3 = randomColor()
	c4 = randomColor()
	update()

# Challenge
func _on_randColor_pressed():
	rand_color = true

# Challenge
func _on_defColor_pressed():
	rand_color = false
	c1 = Color(1,0.8,0.8)
	c2 = Color(0,0.6,0.6)
	c3 = Color(0,0.3,0.3)
	c4 = Color(1,0.6,0.2)
	update()

# Challenge
func _on_chgDirect_pressed():
	if direct == "Right" :
		direct = "Left"
	else :
		direct = "Right"

# Challenge
var pos = Vector2(295,155)
var rad = 0

func _draw():
	window_size(1010,590)
	
	if !play : set_process(false)
	
	bingkai(235, 95)
	
	obj2Generation(365,225, 2, 3)
	obj1Generation(435,295, 1, 2, glob_radius)
	obj1Generation(pos.x,pos.y, 1, 1,rad)
	obj1Generation(295,155, 3, 4, glob_radius)
	
	if speed == 20 : $speedLabel.text = "Speed: " + str(speed) + " (max)" + '\n' + "Rotate: " + rotate + '\n' + "Direct: " + direct
	elif speed == 1 : $speedLabel.text = "Speed: " + str(speed) + " (min)" + '\n' + "Rotate: " + rotate + '\n' + "Direct: " + direct
	else : $speedLabel.text = "Speed: " + str(speed) + '\n' + "Rotate: " + rotate + '\n' + "Direct: " + direct
	
	$patternLabel.text = status
