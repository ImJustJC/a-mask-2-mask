class_name PlayerControl
extends CharacterBody2D

@export var SPEED = 300.0
@export var MASK_COLLECTED : Dictionary[StringName, Color];

@export var UI_MANAGER : UIManager;

func _input(event: InputEvent) -> void:
	for actionName in MASK_COLLECTED:
		if event.is_action_released(actionName):
			self.modulate = MASK_COLLECTED[actionName];
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

func mask_collided(mask_item : PickableMask):
	UI_MANAGER.add_mask(mask_item.RelatedActionName, mask_item.MaskColorModulate);
	MASK_COLLECTED[mask_item.RelatedActionName] = mask_item.MaskColorModulate;
	mask_item.queue_free();
