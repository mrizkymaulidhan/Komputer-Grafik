extends Stroke

func lineGeneration(loop):
	for i in loop:
		garisPutus(randomTitik()[0], randomTitik()[1], randomTitik()[2], randomTitik()[3], rand_range(1,10), rand_range(0,20), randomColor())

func _process(delta):
	update()

func _on_home_pressed():
	get_tree().change_scene("res://menu.tscn")

var random = false

func _on_random_pressed():
	random = true
	set_process(true)

func _draw():
	window_size(1010, 590)
	set_process(false)
	if random: lineGeneration(10)
	else:
		garisPutus(10,10,500,10,1,1,randomColor())
		garisPutus(10,30,500,30,1,10,randomColor())
		garisPutus(10,50,500,50,5,1,randomColor())
		garisPutus(10,70,500,70,5,10,randomColor())
