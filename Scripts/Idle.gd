extends PlayerState
class_name Idle

@export var fall_state: PlayerState
@export var move_state: PlayerState



func enter():
	Player.player_moving = false
	super()

func process_input(event: InputEvent):
	if event.is_action_pressed("move_down") or event.is_action_pressed("move_up") or event.is_action_pressed("move_left") or event.is_action_pressed("move_right"):
		Transitioned.emit(self, "Move")
	
func physics_Update(delta:float):
	if Player:
		Player.velocity.x = 0
		Player.velocity.z = 0
