extends Stroke

func _on_back_pressed():
	get_tree().change_scene("res://menu.tscn")

func _draw():
	window_size(1010,590)
