class_name SecurityGuy
extends StaticBody2D

const DETECTION_TIME_SEC : float = 0.5;
@export var EXCLAMATION_SPRITE : CompressedTexture2D;

var ParentManager : EnemyManager;
var PlayerPosition : Vector2;
var PlayerInsideView : bool;
var PlayerVisible : bool;

func _ready() -> void:
	assert(get_parent() is EnemyManager);
	ParentManager = get_parent() as EnemyManager;

func player_entered_view(playerBody: Node2D):
	if playerBody is not PlayerControl:
		return;
	PlayerInsideView = true;

func player_exited_view(playerBody: Node2D):
	if playerBody is not PlayerControl:
		return;
	PlayerInsideView = false;
	PlayerVisible = false;
	ParentManager.trigger_player_detected(self, false, self.position);

func _physics_process(_delta: float) -> void:
	if PlayerInsideView:
		PlayerPosition = ParentManager.get_player_position();
		var space2d : PhysicsDirectSpaceState2D = get_world_2d().direct_space_state;
		var query = PhysicsRayQueryParameters2D.create(self.position, PlayerPosition, 1);
		var result = space2d.intersect_ray(query);
		PlayerVisible = result.collider is PlayerControl and not ParentManager.get_player_hidden();
		ParentManager.trigger_player_detected(self, PlayerVisible, result.position)

func _process(delta):
	if PlayerVisible:
		$DetectionMarker.visible = true;
		$DetectionMarker.value += delta / DETECTION_TIME_SEC;
		if $DetectionMarker.value >= 1.0:
			$DetectionMarker.texture_under = EXCLAMATION_SPRITE;
			$DetectionMarker.texture_progress = EXCLAMATION_SPRITE;
			ParentManager.trigger_player_caught(self);
	elif $DetectionMarker.value > 0:
		$DetectionMarker.value -= delta / DETECTION_TIME_SEC;
		if $DetectionMarker.value <= 0:
			$DetectionMarker.visible = false;
