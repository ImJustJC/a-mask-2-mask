class_name MainMenuControl
extends Control

func _ready() -> void:
	$LevelsPanel/TutorialLevel.grab_focus();

func play_tutorial():
	get_tree().change_scene_to_file("res://Scenes/Levels/TutorialLevel.tscn");

func play_level1():
	get_tree().change_scene_to_file("res://Scenes/Levels/Level1.tscn")
