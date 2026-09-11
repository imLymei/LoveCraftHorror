class_name InteractionDetector2D
extends Area2D


var _closest_interaction_area: InteractionArea2D :
	set(new_value):
		if _closest_interaction_area == new_value:
			return
		
		if _closest_interaction_area:
			_closest_interaction_area.hover_off()
		
		_closest_interaction_area = new_value
		print("CLOSEST IS %s" % [new_value])
		
		if _closest_interaction_area:
			_closest_interaction_area.hover_on()


func _ready() -> void:
	collision_layer = 0
	collision_mask = 0
	monitorable = false
	
	set_collision_mask_value(Constants.INTERACTION_PHYSICS_LAYER, true)


func _unhandled_input(event: InputEvent) -> void:
	if not _closest_interaction_area:
		return
	
	if event.is_action_pressed("interact"):
		_closest_interaction_area.interact()


func _physics_process(_delta: float) -> void:
	var areas := get_overlapping_areas()
	
	if areas.size() == 1 and areas[0] is InteractionArea2D:
		_closest_interaction_area = areas[0]
		return
	
	var closest_area: InteractionArea2D = null
	var closest_area_distance: float = 0
	
	for area in areas:
		if not area is InteractionArea2D:
			continue
		
		var area_distance := global_position.distance_squared_to(area.global_position)
		if not closest_area or area_distance < closest_area_distance:
			closest_area = area
			area_distance = closest_area_distance
	
	_closest_interaction_area = closest_area


func enable() -> void:
	monitoring = true


func disable() -> void:
	monitoring = false
