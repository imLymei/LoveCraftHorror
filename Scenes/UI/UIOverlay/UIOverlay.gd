class_name UIOverlay
extends CanvasLayer


@onready var inventory_UI: Control = %InventoryUI
@onready var dialog_ui: DialogUI = %DialogUI


var current_menu: Control = null


func _ready() -> void:
	for child in get_children():
		if child is CanvasItem:
			child.hide()
	
	dialog_ui.dialog_closed.connect(_on_dialog_closed)


func open_inventory() -> void:
	if current_menu:
		current_menu.visible = false
		if current_menu == inventory_UI:
			current_menu = null
			GameManager.player_can_walk = true
			return
	
	current_menu = inventory_UI
	current_menu.visible = true
	GameManager.player_can_walk = false


func show_dialog(title: String, text: String) -> void:
	GameManager.player_is_disabled = true
	dialog_ui.open_dialog(title, text)


func _on_dialog_closed() -> void:
	GameManager.player_is_disabled = false
