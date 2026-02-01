extends Control

func return_to_menu():
	get_tree().paused = false;
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn");

func retry_level():
	get_tree().paused = false;
	get_tree().reload_current_scene()
