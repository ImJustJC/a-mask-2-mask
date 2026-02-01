class_name GameStateHandler
extends Node

@export var UI_VIEWPORT: CanvasLayer;
@export var MAIN_CAMERA : Camera2D;
@export var GAME_UI : UIManager;

const PANEL_WIN = preload("res://Scenes/PopupWin.tscn");
const PANEL_LOSE = preload("res://Scenes/PopupLose.tscn");

const CameraPositionTweenDuration : float = 0.3;
const CameraZoomTweenDuration : float = 0.3;

func trigger_lose(bywho : Node2D):
	MAIN_CAMERA.reparent(bywho);
	GAME_UI.visible = false;
	
	UI_VIEWPORT.add_child(PANEL_LOSE.instantiate());
	
	var cameraTween : Tween = get_tree().create_tween();
	cameraTween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS);
	cameraTween.tween_property(MAIN_CAMERA, "position", Vector2.ZERO, CameraPositionTweenDuration);
	cameraTween.parallel().tween_property(MAIN_CAMERA, "zoom", Vector2(2, 2), CameraZoomTweenDuration);
	get_tree().paused = true;

func trigger_win():
	
	UI_VIEWPORT.add_child(PANEL_WIN.instantiate());
	
	GAME_UI.visible = false;
	var cameraTween : Tween = get_tree().create_tween();
	cameraTween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS);
	cameraTween.tween_property(MAIN_CAMERA, "zoom", Vector2(0.4, 0.4), 1.5);
	get_tree().paused = true;
