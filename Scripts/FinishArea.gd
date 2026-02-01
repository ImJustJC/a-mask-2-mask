extends Area2D

signal PLAYER_WON;

@export var RequiredMasks : int;

func player_entered(body: Node2D):
	if body is not PlayerControl:
		return;
	var maskCount = (body as PlayerControl).MASK_COLLECTED.size();
	if maskCount >= RequiredMasks:
		PLAYER_WON.emit();

func update_label(maskCount: int):
	if maskCount < RequiredMasks:
		$MaskCount.text = "%d / %d" % [maskCount, RequiredMasks];
	else:
		$MaskCount.text = "[wave]Leave![/wave]"
