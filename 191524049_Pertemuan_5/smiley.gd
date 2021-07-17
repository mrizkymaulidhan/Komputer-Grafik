extends MyShape

func smiley(xc, yc, r):
	midpointCircle(xc, yc, r, 1)
	midpointCircle(xc-(r/3), yc-(r/2), r/4, 1)
	midpointCircle(xc+(r/3), yc-(r/2), r/4, 1)
	midCircle(xc, yc, r/1.5, 1)
	garisPutus(xc-(r/2.15), yc+(r/2.15), xc+(r/2.15), yc+(r/2.15), 2, 5, randomColor())
	garisPutus(xc, yc-(r/3), xc, yc+(r/3), r/20, 5, randomColor())

func smileyGeneration(loop):
	for i in loop:
		smiley(rand_range(20,1000), rand_range(20,570), rand_range(10,200))

func _process(delta):
	update()

func _on_home_pressed():
	get_tree().change_scene("res://menu.tscn")

func _on_random_pressed():
	set_process(true)

func _draw():
	window_size(1010, 590)
	set_process(false)
	smileyGeneration(5)
