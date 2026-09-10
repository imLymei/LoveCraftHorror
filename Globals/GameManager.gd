extends Node


var world: Node :
	get():
		if not world:
			world = get_tree().get_first_node_in_group("World")
			assert(world, "Requested World without it being loaded")
		
		return world


func load_world_scene(scene_path: String) -> void:
	for child in world.get_children():
		child.queue_free()
	
	var scene: PackedScene = load(scene_path)
	if not scene:
		return
	
	world.add_child(scene.instantiate())
