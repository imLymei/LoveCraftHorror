extends Resource
class_name Inventory

@export var items: Array[InventoryItem]

func swap_items(a: int, b: int) -> void:
	if not _valid(a) or not _valid(b):
		return
	var temp = items[a]
	items[a] = items[b]
	items[b] = temp
	emit_changed()

func add_item(item: InventoryItem) -> bool:
	for i in items.size():
		if items[i] == null:
			items[i] = item
			emit_changed()
			return true
	return false

func remove_item(index: int) -> void:
	if not _valid(index):
		return
	items[index] = null
	emit_changed()

func use_item(index: int) -> void:
	if not _valid(index) or items[index] == null:
		return
	items[index].use()
	emit_changed()

func destroy_item(index: int) -> void:
	if not _valid(index):
		return
	items[index] = null
	emit_changed()

func update_slots(slots: Array) -> void:
	for i in slots.size():
		var item = items[i] if i < items.size() else null
		slots[i].update(item)

func _valid(index: int) -> bool:
	return index >= 0 and index < items.size()
	
