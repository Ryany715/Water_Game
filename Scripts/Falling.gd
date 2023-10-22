extends PlayerState
class_name Falling

var y_pos : float
var y_peak : float

func enter():
	y_pos = Player.velocity.y
	y_peak = Player.max_h

func physics_Update(delta:float):
	if y_pos !=  y_peak:
		Player.velocity.y -= grav * delta
	elif y_pos >= y_peak:
		Player.velocity.y = 0
