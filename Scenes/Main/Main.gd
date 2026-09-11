extends Control


@onready var sub_viewport: SubViewport = %SubViewport


func _ready() -> void:
	GameManager.load_world_scene("res://Scenes/Dev/Dev.tscn")


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouse:
		event.position -= position
		event.position *= Vector2(Vector2(sub_viewport.size) / size)
	
	sub_viewport.push_input(event)
