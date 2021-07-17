extends MyShape

func famcrest():
	var trans
	persegi(305, 95, 400, 200, Color(1,1,1))
	midpointCircle2(505, 295, 190, 20, Color(0,0,0))
	#midpointCircle2(505, 295, 170, 170, Color(1,1,1))
	belahKetupat(345, 295, 150, 60, Color(0,0,0))
	trans = translasi(Vector2(345,295), Vector2(170,0)) 
	belahKetupat(trans.x, trans.y, 150, 60, Color(0,0,0))
	trans = translasi(Vector2(345,295), Vector2(85,-85)) 
	belahKetupat(trans.x, trans.y, 150, 60, Color(0,0,0))
	trans = translasi(Vector2(345,295), Vector2(85,85)) 
	belahKetupat(trans.x, trans.y, 150, 60, Color(0,0,0))

func _on_home_pressed():
	get_tree().change_scene("res://menu.tscn")

func _draw():
	window_size(1010,590)
	famcrest()
