extends Node


@onready var sub_viewport: SubViewport = %SubViewport


func _ready() -> void:
	GameManager.load_world_scene("res://Scenes/Dev/Dev.tscn")


func _unhandled_input(event: InputEvent) -> void:
	sub_viewport.push_input(event)
