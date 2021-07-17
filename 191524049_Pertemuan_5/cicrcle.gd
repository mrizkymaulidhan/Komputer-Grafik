extends MyShape

func circleGeneration(loop):
	for i in loop:
		midpointCircle(rand_range(20,1000), rand_range(20,570), rand_range(10,150),rand_range(1,15))

func _process(delta):
	update()

func _on_home_pressed():
	get_tree().change_scene("res://menu.tscn")

func _on_random_pressed():
	set_process(true)

func _draw():
	set_process(false)
	circleGeneration(7)
