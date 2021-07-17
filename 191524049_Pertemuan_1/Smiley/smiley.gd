extends Node2D

func draw_circle_arc(center, radius, angle_from, angle_to, color):
	var nb_points = 32
	var points_arc = PoolVector2Array()

	for i in range(nb_points + 1):
		var angle_point = deg2rad(angle_from + i * (angle_to-angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)

	for index_point in range(nb_points):
		draw_line(points_arc[index_point], points_arc[index_point + 1], color)

func draw_circle_arc_poly(center, radius, angle_from, angle_to, color):
	var nb_points = 32
	var points_arc = PoolVector2Array()
	points_arc.push_back(center)
	var colors = PoolColorArray([color])

	for i in range(nb_points + 1):
		var angle_point = deg2rad(angle_from + i * (angle_to - angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	draw_polygon(points_arc, colors)

func _draw():
	var vHead = Vector2(530, 300)
	var vEyeLeft = Vector2(480, 250)
	var vPupilLeft = Vector2(490, 240)
	var vEyeRight= Vector2(590, 250)
	var vPupilRight = Vector2(600, 240)
	var vMouth = Vector2(535, 390)
	var white = Color(1.0, 1.0, 1.0)
	var yellow = Color(1.0, 1.0, 0.0)
	var black = Color(0.0, 0.0, 0.0)
	
	draw_circle_arc_poly(vHead, 152, 0, 360, black)
	draw_circle_arc_poly(vHead, 150, 0, 360, yellow)
	draw_circle_arc_poly(vEyeLeft, 32, 0, 360, black)
	draw_circle_arc_poly(vEyeLeft, 30, 0, 360, white)
	draw_circle_arc_poly(vPupilLeft, 15, 0, 360, black)
	draw_circle_arc_poly(vEyeRight, 32, 0, 360, black)
	draw_circle_arc_poly(vEyeRight, 30, 0, 360, white)
	draw_circle_arc_poly(vPupilRight, 15, 0, 360, black)
	draw_circle_arc(vMouth, 50, 290, 430, black)
	draw_circle_arc(vMouth, 49, 290, 430, black)
