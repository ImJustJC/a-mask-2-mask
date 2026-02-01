class_name GameStateHandler
extends Node

@export var MAIN_CAMERA : Camera2D;
@export var GAME_UI : UIManager;

const CameraPositionTweenDuration : float = 0.3;
const CameraZoomTweenDuration : float = 0.3;

func trigger_lose(bywho : Node2D):
	MAIN_CAMERA.reparent(bywho);
	GAME_UI.visible = false;
	
	var cameraTween : Tween = get_tree().create_tween();
	cameraTween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS);
	cameraTween.tween_property(MAIN_CAMERA, "position", Vector2.ZERO, CameraPositionTweenDuration);
	cameraTween.parallel().tween_property(MAIN_CAMERA, "zoom", Vector2(2, 2), CameraZoomTweenDuration);
	get_tree().paused = true;

func trigger_win():
	GAME_UI.visible = false;
	var cameraTween : Tween = get_tree().create_tween();
	cameraTween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS);
	cameraTween.tween_property(MAIN_CAMERA, "zoom", Vector2(0.02, 0.02), 1.5);
	get_tree().paused = true;
