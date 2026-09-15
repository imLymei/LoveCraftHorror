class_name DialogUI
extends Control


signal dialog_closed


@onready var title_label: Label = %TitleLabel
@onready var dialog_label: Label = %DialogLabel


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		cloose_dialog()



func open_dialog(title: String, text: String) -> void:
	show()
	set_title(title)
	set_text(text)
	set_process_unhandled_input(true)


func cloose_dialog() -> void:
	set_process_unhandled_input(false)
	hide()
	dialog_closed.emit()


func set_title(text: String) -> void:
	if text.is_empty():
		title_label.hide()
	else:
		title_label.show()
		title_label.text = text


func set_text(text: String) -> void:
	dialog_label.text = text
