extends CharacterBody2D


const MOVE_SPEED: float = 64


func _physics_process(_delta: float) -> void:
	var input_direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * MOVE_SPEED
	
	move_and_slide()
