extends MyShape

func volkswagen():
	midpointCircle2(510,270,150,150,Color(0.0, 0.3, 0.5))
	midpointCircle2(510,270,202,6,Color(0.7,0.7,0.7))
	midpointCircle2(510,270,170,20,Color(0.7,0.7,0.7))
	garisTebal(510,299,453,137,63,Color(0.7,0.7,0.7))
	garisTebal(510,299,567,137,63,Color(0.7,0.7,0.7))
	garisTebal(510,241,455,400,65,Color(0.7,0.7,0.7))
	garisTebal(510,241,565,400,65,Color(0.7,0.7,0.7))
	garisTebal(495,265,525,265,15,Color(0.0, 0.3, 0.5))
	garisTebal(465,450,375,200,65,Color(0.7,0.7,0.7))
	garisTebal(555,450,645,200,65,Color(0.7,0.7,0.7))
	midpointCircle2(510,270,195,25,Color(0.0, 0.3, 0.5))

func _on_home_pressed():
	get_tree().change_scene("res://menu.tscn")

func _draw():
	window_size(1010,590)
	volkswagen()
