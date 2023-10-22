extends Node

@export var initial_state : PlayerState
var states : Dictionary = {}
var current_state: PlayerState
var event : InputEvent

func _ready():
	for child in get_children(): 
		if child is PlayerState:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transitioned)
	if initial_state:
		initial_state.enter()
		current_state = initial_state
			
func process_input(event: InputEvent):
	var new_state = current_state.process_input(event)
	#on_child_transitioned(current_state, new_state)
		
func _physics_process(delta):
	if current_state:
		current_state.physics_Update(delta)

func on_child_transitioned(state, new_state_name):
	if state != current_state:
		return
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	if current_state:
		current_state.exit()
	new_state.enter()
	current_state = new_state
	
	
