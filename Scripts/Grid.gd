extends GridMap

enum PlayerType{EMPTY = -1, PLAYER = 1}
var tile_grid
var x_max: int
var y_max: int
var z_max: int
var no_xmove: bool = false
var no_ymove: bool = false
var no_zmove: bool = false
var possible_pos: Array

func _ready():
	for child in get_children():
		set_cell_item(map_to_local(child.position), child.type)
	tile_grid = get_parent()
	var tile_arr = tile_grid.get_used_cells()
	var max_tile = tile_arr.max()
	x_max = max_tile.x
	y_max = max_tile.y
	z_max = max_tile.z
	if x_max == 0:
		no_xmove = true
	if y_max == 0:
		no_ymove = true
	if z_max == 0:
		no_zmove = true
	
func is_space(child, direction):
	possible_pos = tile_grid.get_used_cells()
	var target_pos = Vector3i(map_to_local(child.position) + direction)
	if possible_pos.has(target_pos):
		var target_type = get_cell_item(target_pos)
		match target_type:
				PlayerType.EMPTY:
					return update_child_pos(child, child.position, target_pos)

func update_child_pos(child, start, target):
	set_cell_item(target, child.type)
	set_cell_item(start, PlayerType.EMPTY)
	print(get_used_cells())
	return map_to_local(target)
