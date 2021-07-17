extends MyShape

func ketupatGeneration(loop):
	var y = rand_range(100,490)
	var xy1 = Vector2(rand_range(300,500), y)
	var xy2 = Vector2(rand_range(xy1.x,800), y)
	
	for i in loop:
		belahKetupat2(xy1.x, xy1.y, xy2.x, xy2.y, randomColor())
		xy1 += Vector2(5,0)
		xy2 -= Vector2(5,0)

func _process(delta):
	update()

func _on_home_pressed():
	get_tree().change_scene("res://menu.tscn")

func _on_random_pressed():
	set_process(true)

func _draw():
	window_size(1010,590)
	set_process(false)
	ketupatGeneration(20)
