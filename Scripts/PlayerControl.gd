class_name PlayerControl
extends CharacterBody2D

@export var SPEED = 300.0
@export var NPC_CHECK_SHAPE : CircleShape2D;
@export_flags_2d_physics var NPC_CHECK_COLMASK : int;
@export var NPC_CHECK_MIN_COUNT : int = 3;
@export var MASK_COLLECTED : Dictionary[StringName, Color];

@export var UI_MANAGER : UIManager;
@export var NPCMatchs : NPCMatcher;

var CurrentMask : StringName = "";
var HiddenInBlob : bool = false;

func _input(event: InputEvent) -> void:
	for actionName in MASK_COLLECTED:
		if event.is_action_released(actionName):
			CurrentMask = actionName;
			self.modulate = MASK_COLLECTED[actionName];
			return;

func _physics_process(_delta: float) -> void:
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
	
	_check_npc_blob();
	
	move_and_slide()

func _check_npc_blob():
	var space2d : PhysicsDirectSpaceState2D = get_world_2d().direct_space_state;
	var query = PhysicsShapeQueryParameters2D.new();
	query.shape = NPC_CHECK_SHAPE;
	query.collision_mask = NPC_CHECK_COLMASK;
	query.transform = Transform2D(0, self.position);
	var result = space2d.intersect_shape(query);
	var sameTypeCount = 0;
	for c in result:
		if c.collider.get_parent() is MaskedNPC:
			if (c.collider.get_parent() as MaskedNPC).MASK_RELATIVE_ACTION == CurrentMask:
				sameTypeCount += 1;
	if sameTypeCount >= NPC_CHECK_MIN_COUNT:
		$PlayerShadow.visible = true;
		HiddenInBlob = true;
	else:
		$PlayerShadow.visible = false;
		HiddenInBlob = false;
	#print("Cast count: %d	Type count: %d" % [result.size(), sameTypeCount]);

func _process(delta: float) -> void:
	queue_redraw();

func _draw() -> void:
	draw_circle(Vector2.ZERO, NPC_CHECK_SHAPE.radius, Color.NAVY_BLUE, false, 1)

func mask_collided(mask_item : PickableMask):
	UI_MANAGER.add_mask(mask_item.RelatedActionName, mask_item.MaskColorModulate);
	MASK_COLLECTED[mask_item.RelatedActionName] = mask_item.MaskColorModulate;
	mask_item.queue_free();
