class_name InteractionArea2D
extends Area2D


signal interaction_hovered_on
signal interaction_hovered_off
signal interacted


func _ready() -> void:
	collision_layer = 0
	collision_mask = 0
	monitoring = false
	
	set_collision_layer_value(Constants.INTERACTION_PHYSICS_LAYER, true)


func enable() -> void:
	monitorable = true


func disable() -> void:
	monitorable = false


func hover_off() -> void:
	interaction_hovered_off.emit()


func hover_on() -> void:
	interaction_hovered_on.emit()


func interact() -> void:
	print("INTERACTED %s" % [name])
	interacted.emit()
