extends MyShape

func shapeGeneration(loop):
	for i in loop:
		persegi(randomTitik()[0], randomTitik()[1], rand_range(50,200),1, randomColor())
		persegiPanjang(randomTitik()[0], randomTitik()[1], rand_range(50,200), rand_range(50,200),1, randomColor())
		segitigaSiku(randomTitik()[0], randomTitik()[1], rand_range(50,200), rand_range(50,200),1, randomColor())
		trapesiumSiku(randomTitik()[0], randomTitik()[1], rand_range(50,200), rand_range(50,200), rand_range(50,200),1, randomColor())
		jajarGenjang(randomTitik()[0], randomTitik()[1], rand_range(50,200), rand_range(50,200),1, randomColor())
		belahKetupat(randomTitik()[0], randomTitik()[1], rand_range(50,200),1, randomColor())

func _process(delta):
	update()

func _on_home_pressed():
	get_tree().change_scene("res://menu.tscn")

func _on_random_pressed():
	set_process(true)

func _draw():
	window_size(1010, 590)
	set_process(false)
	shapeGeneration(2)
