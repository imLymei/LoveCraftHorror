extends Node


signal player_is_disabled_changed(new_value: bool)


var world: Node :
	get():
		if not world:
			world = get_tree().get_first_node_in_group("World")
			assert(world, "Requested World without it being loaded")
		
		return world

var player_can_walk := true
var player_is_disabled := false :
	set(new_value):
		if player_is_disabled == new_value:
			return
		
		player_is_disabled = new_value
		player_is_disabled_changed.emit(player_is_disabled)

var UI_Overlay: UIOverlay :
	get():
		if not UI_Overlay:
			UI_Overlay = get_tree().get_first_node_in_group("UIOverlay")
		
		return UI_Overlay


func load_world_scene(scene_path: String) -> void:
	for child in world.get_children():
		child.queue_free()
	
	var scene: PackedScene = load(scene_path)
	if not scene:
		return
	
	world.add_child(scene.instantiate())
