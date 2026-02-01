extends Node2D

@export var ROTATION_AMOUNTS : Array[Array];
@export var MOVEMENT_AMOUNTS : Array[Array];

func _init():
	assert(get_parent() is PhysicsBody2D);
