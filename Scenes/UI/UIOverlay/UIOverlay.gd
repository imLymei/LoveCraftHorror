class_name UIOverlay
extends CanvasLayer


@onready var inventory_ui: Control = %InventoryUI


var current_menu: Control = null


func _ready() -> void:
	pass


func open_inventory() -> void:
	print("open")
	if current_menu:
		current_menu.visible = false
		if current_menu == inventory_ui:
			current_menu = null
			GameManager.player_can_walk = true
			return
	
	current_menu = inventory_ui
	current_menu.visible = true
	GameManager.player_can_walk = false
