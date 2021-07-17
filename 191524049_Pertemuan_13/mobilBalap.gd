extends VehicleBody

const MAX_STEER_ANGLE = 0.35
const STEER_SPEED = 2

const MAX_ENGINE_FORCE = 175
const MAX_BRAKE_FORCE = 8
const MAX_SPEED = 100

var steer_target = 0.0
var steer_angle = 0.0

func _physics_process(delta):
	drive(delta)

func drive(delta):
	steering=apply_steering(delta)
	engine_force= apply_throttle()
	brake = apply_brake()

func apply_steering(delta):
	var steer_val=0
	var kiri = Input.get_action_strength("kiri")
	var kanan = Input.get_action_strength("kanan")
	
	if kiri :
		steer_val = kiri
	elif kanan :
		steer_val = -kanan
	
	steer_target = steer_val * MAX_STEER_ANGLE
	
	if steer_target < steer_angle :
		steer_angle -= STEER_SPEED * delta
	elif steer_target > steer_angle :
		steer_angle += STEER_SPEED * delta
	
	return steer_angle
	
func apply_throttle():
	var throttle_val = 0
	var maju = Input.get_action_strength("maju")
	var mundur = Input.get_action_strength("mundur")
	
	if mundur :
		throttle_val = -mundur
	elif maju :
		throttle_val = maju
	
	return (throttle_val * MAX_ENGINE_FORCE)

func apply_brake():
	var brake_val = 0
	var brake_strength = Input.get_action_strength("rem")
	
	if brake_strength :
		brake_val = brake_strength
	
	return brake_val * MAX_BRAKE_FORCE
