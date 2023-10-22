extends CharacterBody3D
class_name PlayerWater

enum PlayerType{PLAYER = 1}

@onready var state_machine = $"State Machine"
@onready var player_moving: bool = false
@export var accel = 400
@export var jump_h = 1.0
@export var type = PlayerType.PLAYER

var grid
var target_velocity = Vector3.ZERO
var direction = Vector3.ZERO

const TOP = Vector3(0, 0, -1)
const DOWN = Vector3(0, 0, 1)
const RIGHT = Vector3(1, 0, 0)
const LEFT = Vector3(-1, 0, 0)

func _ready():
	grid = get_parent()
	
func _physics_process(delta):
	state_machine._physics_process(delta)
	move_and_slide()
	
func _unhandled_input(event):
	state_machine.process_input(event)
	
# call to return 3D array that is normalized based on the user input
func get_input_position():
	if player_moving:
		return Vector3.ZERO
	if Input.is_action_pressed:
		if Input.is_action_pressed("move_up"):
			direction = TOP
		elif Input.is_action_pressed("move_down"):
			direction = DOWN
		elif Input.is_action_pressed("move_right"):
			direction = RIGHT
		elif Input.is_action_pressed("move_left"):
			direction = LEFT
		return direction
