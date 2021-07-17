extends MyShape

func ellipseGeneration(loop):
	for i in loop:
		midpointEllipse(rand_range(20,1000), rand_range(20,570), rand_range(10,150),rand_range(10,150))

func _process(delta):
	update()

func _on_home_pressed():
	get_tree().change_scene("res://menu.tscn")

func _on_random_pressed():
	set_process(true)

func _draw():
	window_size(1010,590)
	set_process(false)
	ellipseGeneration(10)
