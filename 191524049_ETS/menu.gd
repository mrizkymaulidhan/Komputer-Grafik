extends Stroke

func _on_button1_pressed():
	get_tree().change_scene("res://pattern1.tscn")

func _on_button2_pressed():
	get_tree().change_scene("res://pattern2.tscn")

func _on_button3_pressed():
	get_tree().change_scene("res://animation.tscn")

func _on_button4_pressed():
	get_tree().change_scene("res://about.tscn")

func _draw():
	window_size(1010,590)
