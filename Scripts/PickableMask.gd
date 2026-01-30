class_name PickableMask
extends Node2D

@export var RelatedActionName : StringName;
@export var MaskColorModulate : Color;

func player_collided(player_body : Node2D):
	if player_body is not PlayerControl:
		return;
	(player_body as PlayerControl).mask_collided(self);
