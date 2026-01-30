class_name PlayerControl
extends CharacterBody2D

@export var SPEED = 300.0
@export var COLOR_MAP : Dictionary[StringName, Color];

func _input(event: InputEvent) -> void:
	for actionName in COLOR_MAP:
		if event.is_action_released(actionName):
			self.modulate = COLOR_MAP[actionName];
			return;

func _physics_process(delta: float) -> void:
	var direction_horizontal := Input.get_axis("left", "right")
	var direction_vertical := Input.get_axis("up", "down")
	if direction_horizontal:
		velocity.x = direction_horizontal * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction_vertical:
		velocity.y = direction_vertical * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func mask_collided():
	pass;
