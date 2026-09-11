extends CharacterBody2D


const MOVE_SPEED: float = 64

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("open_inventory"):
		print("clicked")
		GameManager.UI_Overlay.open_inventory()

func _physics_process(_delta: float) -> void:
	var input_direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * MOVE_SPEED
	
	move_and_slide()
