extends Stroke

func lineGeneration(loop):
	for i in loop:
		lineDDA(randomTitik()[0], randomTitik()[1], randomTitik()[2], randomTitik()[3], randomColor())

func _process(delta):
	update()

func _on_home_pressed():
	get_tree().change_scene("res://menu.tscn")

func _on_random_pressed():
	set_process(true)

func _draw():
	window_size(1010, 590)
	set_process(false)
	lineGeneration(20)
