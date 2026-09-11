extends CanvasLayer

class_name UIOverlay

@onready var inventory_UI: Control = %InventoryUi

var current_menu: Control = null


func _ready() -> void:
	pass


func open_inventory() -> void:
	print("open")
	if current_menu == inventory_UI:
		current_menu.visible = false
		current_menu = null
		return
	
	if current_menu:
		current_menu.visible = false
	
	current_menu = inventory_UI
	current_menu.visible = true
