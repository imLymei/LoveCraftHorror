class_name InteractionHover
extends Node2D


@export var interaction_area_2d: InteractionArea2D


func _ready() -> void:
	interaction_area_2d.interaction_hovered_on.connect(_on_hovered_on)
	interaction_area_2d.interaction_hovered_off.connect(_on_hovered_off)
	
	hide()


func _on_hovered_on() -> void:
	show()


func _on_hovered_off() -> void:
	hide()
