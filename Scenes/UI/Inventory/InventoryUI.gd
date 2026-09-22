extends Control

@export var player_inventory: Inventory

@onready var inventory_slots: Array = $NinePatchRect/GridContainer.get_children()


func _ready() -> void:
	for i in inventory_slots.size():
		var slot = inventory_slots[i]
		slot.slot_index = i
		slot.inventory = player_inventory
	player_inventory.changed.connect(refresh)
	refresh()


func refresh() -> void:
	player_inventory.update_slots(inventory_slots)
