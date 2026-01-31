class_name SecurityGuy
extends StaticBody2D

@export var VIEW_RANGE : float = 300;

var ParentManager : EnemyManager;
var PlayerPosition : Vector2;

func _ready() -> void:
	assert(get_parent() is EnemyManager);
	ParentManager = get_parent() as EnemyManager;

func _physics_process(_delta: float) -> void:
	PlayerPosition = ParentManager.get_player_position();
	var distance = PlayerPosition.distance_to(self.position);
	if distance <= VIEW_RANGE:
		var space2d : PhysicsDirectSpaceState2D = get_world_2d().direct_space_state;
		var query = PhysicsRayQueryParameters2D.create(self.position, PlayerPosition, 1);
		var result = space2d.intersect_ray(query);
		var playerVisible = result.collider is PlayerControl and not ParentManager.get_player_hidden();
		ParentManager.trigger_player_detected(self, playerVisible, result.position)
	else:
		ParentManager.trigger_player_detected(self, false, Vector2.ZERO);
