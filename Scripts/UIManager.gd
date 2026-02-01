class_name UIManager
extends Control

func _select_from_name(acName: StringName) -> Control:
	match(acName):
		"action_up":
			return $Up;
		"action_down":
			return $Down;
		"action_left":
			return $Left;
		"action_right":
			return $Right;
		_:
			return null;

func add_mask(where: StringName):
	var targetPicker : Control = _select_from_name(where);
	var tweener : Tween = get_tree().create_tween();
	tweener.set_trans(Tween.TRANS_ELASTIC).tween_property(targetPicker, "scale", Vector2.ONE, 0.4);

func select_mask(where: StringName):
	var targetPicker : Control = _select_from_name(where);
	$Up/MaskUI.modulate.a = 0.25;
	$Down/MaskUI.modulate.a = 0.25;
	$Left/MaskUI.modulate.a = 0.25;
	$Right/MaskUI.modulate.a = 0.25;
	targetPicker.get_child(1).modulate.a = 1;
