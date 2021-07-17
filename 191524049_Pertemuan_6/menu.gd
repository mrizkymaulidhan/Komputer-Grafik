extends Stroke

func _on_button1_pressed():
	get_tree().change_scene("res://circle.tscn")

func _on_button2_pressed():
	get_tree().change_scene("res://smiley.tscn")

func _on_button3_pressed():
	get_tree().change_scene("res://logo.tscn")

func _on_button4_pressed():
	get_tree().change_scene("res://ellipse.tscn")

func _on_button5_pressed():
	get_tree().change_scene("res://segitiga.tscn")

func _on_button6_pressed():
	get_tree().change_scene("res://belahketupat.tscn")

func _on_button7_pressed():
	get_tree().change_scene("res://bunga4.tscn")

func _on_button8_pressed():
	get_tree().change_scene("res://bunga8.tscn")

func _on_button9_pressed():
	get_tree().change_scene("res://batik.tscn")

func _on_button10_pressed():
	get_tree().change_scene("res://famcrest.tscn")

func _draw():
	window_size(1010,590)
