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
	
	rotX = (vcos * (x1 - x2)) - (vsin * (y1 - y2)) + x2
	rotY = (vsin * (x1 - x2)) + (vcos * (y1 - y2)) + y2
	
	return Vector2(rotX,rotY)

func scaling(coor1:Vector2,coor2:Vector2,fscale:float):
	var scalX
	var scalY
	
	var x1=coor1.x
	var y1=coor1.y
	var x2=coor2.x
	var y2=coor2.y
	
	scalX = (fscale * (x1 - x2)) + x2
	scalY = (fscale * (y1 - y2)) + y2
	
	return Vector2(scalX,scalY)
