extends Node
class_name PlayerState

@export var animation_name: String
@export var Player: CharacterBody3D
var grav: float = ProjectSettings.get_setting("physics/3d/default_gravity")
var tile_width  = 10


signal Transitioned


func enter():
	pass
	
func exit():
	pass
	
func update(_delta: float):
	pass
	
func process_input(event: InputEvent):
	return null
	
func physics_Update(_delta: float): 
	pass
	
