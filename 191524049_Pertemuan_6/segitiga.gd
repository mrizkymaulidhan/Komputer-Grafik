extends MyShape

func segitigaGeneration(loop):
	var y = rand_range(100,490)
	var xy1 = Vector2(rand_range(100,500), y)
	var xy2 = Vector2(rand_range(xy1.x,900), y)
	
	for i in loop:
		segitigaSamaSisi(xy1.x, xy1.y, xy2.x, xy2.y, randomColor())
		xy1 += Vector2(10,-5)
		xy2 -= Vector2(10,5)

func _process(delta):
	update()

func _on_home_pressed():
	get_tree().change_scene("res://menu.tscn")

func _on_random_pressed():
	set_process(true)

func _draw():
	window_size(1010,590)
	set_process(false)
	segitigaGeneration(30)
