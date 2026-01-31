@tool
class_name ViewRange
extends Node2D

@export var RANGE : float = 200;

func _process(_delta: float) -> void:
	queue_redraw();

func _draw() -> void:
	draw_circle(self.position, RANGE, Color.INDIAN_RED, 0, 2);
