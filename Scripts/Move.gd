extends PlayerState
class_name Move

@export var fall_state: PlayerState
@export var idle_state: PlayerState
@export var jump_state: PlayerState

var target_pos: Vector3
var targer_direciton: Vector3

func vectors_approx_equal(v1 : Vector3, v2 : Vector3, epsilon : float) -> bool:
	var difference = v1 - v2
	return (difference.x < epsilon) and (difference.y < epsilon) and (difference.z < epsilon)
	

func enter():
	super()
	
func process_input(event: InputEvent):
	if event.is_action_pressed('jump'):
		print('jump')
		Transitioned.emit(self, "Jump")

func physics_Update(delta:float):
	var target_dir = Player.get_input_position()
	var target_pos = target_dir + Player.position
	if target_dir != Vector3.ZERO:
		Player.player_moving = true
		#Player.velocity = (Player.accel * delta) * target_pos))
		var going = Player.grid.is_space(Player, target_dir)
		print(going)
		if going != null:
			print("moving !")
			Player.position = going
			Transitioned.emit(self, "Idle")
		else:
			Transitioned.emit(self, "Idle")
	else:
		Transitioned.emit(self, "Idle")
	

