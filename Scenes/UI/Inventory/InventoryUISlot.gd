extends TextureRect

var slot_index: int = -1
var inventory: Inventory
var current_item: InventoryItem

@onready var item_visual: TextureRect = $ItemDisplay
@onready var item_quantity: Label = $ItemQuantity
@onready var context_menu: PopupMenu = $ContextMenu
@onready var open_menu_button: Button = $OpenMenuButton

func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_STOP
	context_menu.add_item("Usar", 0)
	context_menu.add_item("Dropar", 1)
	context_menu.id_pressed.connect(_on_context_menu_pressed)
	open_menu_button.pressed.connect(_on_open_menu_pressed)

func update(item: InventoryItem) -> void:
	current_item = item
	item_visual.visible = item != null
	open_menu_button.visible = item != null
	if item:
		item_visual.texture = item.texture
		item_quantity.visible = item.quantity > 1
		item_quantity.text = "x%d" % item.quantity
	else:
		item_quantity.visible = false

func _on_open_menu_pressed() -> void:
	var rect := Rect2(Vector2.ZERO, open_menu_button.size)
	context_menu.popup_on_parent(open_menu_button.get_global_rect())

func _on_context_menu_pressed(id: int) -> void:
	match id:
		0: inventory.use_item(slot_index)
		1: inventory.destroy_item(slot_index)
