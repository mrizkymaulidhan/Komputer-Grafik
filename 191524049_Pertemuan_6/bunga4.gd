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
	
	for j in 5:
		for i in 9:
			bunga4(trans1.x, trans1.y, trans2.x, trans2.y)
			trans1 = translasi(Vector2(trans1.x, trans1.y), Vector2(2*diff.x,0))
			trans2 = translasi(Vector2(trans2.x, trans2.y), Vector2(2*diff.x,0))
		trans1 = translasi(Vector2(x1, trans1.y), Vector2(0,2*diff.y))
		trans2 = translasi(Vector2(x2, trans2.y), Vector2(0,2*diff.y))

func _on_home_pressed():
	get_tree().change_scene("res://menu.tscn")

func _draw():
	window_size(1010,590)
	bunga4Generation(70,100,120,50)
	#flower4(505,270)
