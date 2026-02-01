class_name EnemyManager
extends Node2D

signal PLAYER_CAUGHT(bywho : Node2D);

@export var WALL_TILE_LAYER : TileMapLayer;
@export var MAIN_PLAYER : PlayerControl;

var EnemyCollection : Dictionary[SecurityGuy, Array];

func _ready() -> void:
	for c in get_children():
		if c is SecurityGuy:
			EnemyCollection[c as SecurityGuy] = [false, Vector2.ZERO];

func _process(_delta: float) -> void:
	queue_redraw();

func trigger_player_detected(bywho: SecurityGuy, detected: bool, intersectPoint : Vector2):
	EnemyCollection[bywho] = [detected, intersectPoint];

func trigger_player_caught(bywho: SecurityGuy):
	PLAYER_CAUGHT.emit(bywho);

func get_player_position() -> Vector2:
	return MAIN_PLAYER.position;
func get_player_global_position() -> Vector2:
	return MAIN_PLAYER.global_position;
func get_player_hidden() -> bool:
	return MAIN_PLAYER.HiddenInBlob;

#func _draw() -> void:
	#for sg in EnemyCollection:
		#draw_line(sg.position,
		 #EnemyCollection[sg][1],
		 #Color.RED if EnemyCollection[sg][0] else Color.GREEN,
		 #2);
