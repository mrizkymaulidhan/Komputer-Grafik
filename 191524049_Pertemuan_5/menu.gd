extends Stroke

func _on_button1_pressed():
	get_tree().change_scene("res://linegeneration1.tscn")

func _on_button2_pressed():
	get_tree().change_scene("res://linegeneration2.tscn")

func _on_button3_pressed():
	get_tree().change_scene("res://shape.tscn")

func _on_button4_pressed():
	get_tree().change_scene("res://circle.tscn")

func _on_button5_pressed():
	get_tree().change_scene("res://smiley.tscn")

func _on_button6_pressed():
	get_tree().change_scene("res://logo.tscn")

func _draw():
	window_size(1010, 590)
