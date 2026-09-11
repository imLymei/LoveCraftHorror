extends CharacterBody2D


const MOVE_SPEED: float = 64


@export var inventory : Inventory


@onready var sprite_2d: Sprite2D = %Sprite2D
@onready var interaction_anchor: Node2D = %InteractionAnchor


var input_direction: Vector2
var _last_input_direction: Vector2


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("open_inventory"):
		GameManager.UI_Overlay.open_inventory()


func _physics_process(_delta: float) -> void:
	if GameManager.player_can_walk:
		input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	else:
		input_direction = Vector2.ZERO
	
	velocity = input_direction * MOVE_SPEED
	
	move_and_slide()
	
	_handle_rotation()
	
	_last_input_direction = input_direction


func _handle_rotation() -> void:
	if input_direction.is_zero_approx():
		return
	
	sprite_2d.flip_h = false
	
	if input_direction.y > 0:
		sprite_2d.frame = 0
		interaction_anchor.rotation = Vector2.DOWN.angle()
	elif input_direction.y < 0:
		sprite_2d.frame = 2
		interaction_anchor.rotation = Vector2.UP.angle()
	elif input_direction.x < 0:
		sprite_2d.frame = 1
		interaction_anchor.rotation = Vector2.LEFT.angle()
	elif input_direction.x > 0:
		sprite_2d.flip_h = true
		sprite_2d.frame = 1
		interaction_anchor.rotation = Vector2.RIGHT.angle()
