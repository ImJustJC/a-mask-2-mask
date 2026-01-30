@tool
class_name ViewRange
extends Node2D

@export var CONE_RANGE : float = 400;
@export_range(0, 360) var CONE_ANGLE : float = 40:
	set(value):
		CONE_ANGLE = value;
		HalfAngleRad = deg_to_rad(value * 0.5);

var HalfAngleRad : float;

func _process(_delta: float) -> void:
	queue_redraw();

func _draw() -> void:
	var pointA : Vector2 = self.position + CONE_RANGE * Vector2(
		cos(HalfAngleRad), sin(HalfAngleRad)).normalized();
	var pointC : Vector2 = self.position + CONE_RANGE * Vector2(
		cos(HalfAngleRad), -sin(HalfAngleRad)).normalized();
	var pointArray : PackedVector2Array;
	pointArray.append_array([pointA, self.position, pointC]);
	#print(pointA)
	draw_polygon(pointArray, [Color(0, 1, 0, 0.3)]);
