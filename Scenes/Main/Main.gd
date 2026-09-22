extends Control

@onready var sub_viewport: SubViewport = %SubViewport
@onready var game_window: TextureRect = %GameWindow

func _ready() -> void:
	GameManager.load_world_scene("res://Scenes/Dev/Dev.tscn")

func _input(event: InputEvent) -> void:
	if event is InputEventMouse:
		var scale: float = min(game_window.size.x / sub_viewport.size.x, game_window.size.y / sub_viewport.size.y)
		var pos: Vector2 = (event.position - game_window.global_position - (game_window.size - Vector2(sub_viewport.size) * scale) * 0.5) / scale
		event.position = pos
		event.global_position = pos
		event.position -= position
		
		if size.x != sub_viewport.size.x:
			var game_current_width := size.y * sub_viewport.size.x / sub_viewport.size.y
			var screen_padding_x := (size.x - game_current_width) / 2
			
			event.position.x -= screen_padding_x
		if size.y != sub_viewport.size.y:
			var game_current_height := size.x * sub_viewport.size.y / sub_viewport.size.x
			var screen_padding_y := (size.y - game_current_height) / 2
			
			event.position.y -= screen_padding_y
	
	sub_viewport.push_input(event, true)
