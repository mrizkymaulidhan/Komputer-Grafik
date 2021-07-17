extends Stroke

class_name MyTransform

func translasi(coor1:Vector2,coor2:Vector2):
	var x1=coor1.x
	var y1=coor1.y
	var x2=coor2.x
	var y2=coor2.y
	var transXY: Vector2
	
	transXY = coor1 + coor2
	return transXY

func rotasi(coor1:Vector2,coor2:Vector2,degree):
	var rotX
	var rotY
	
	var vcos = cos(deg2rad(degree))
	var vsin = sin(deg2rad(degree))
	var x1=coor1.x
	var y1=coor1.y
	var x2=coor2.x
	var y2=coor2.y
	
	rotX = (vcos * (x2 - x1)) + (-vsin * (y2 - y1)) + x1
	rotY = (vsin * (x2 - x1)) + (vcos * (y2 - y1)) + y1
	
	return Vector2(rotX,rotY)

func scaling(coor1:Vector2,fscale:float):
	var x1=coor1.x
	var y1=coor1.y
	var scalXY: Vector2
	
	scalXY = coor1 * fscale
	return scalXY
