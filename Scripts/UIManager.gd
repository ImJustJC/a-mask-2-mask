class_name UIManager
extends Control

func add_mask(where: StringName, color: Color):
	match(where):
		"action_up":
			$MaskPicker/Up.color = color;
		"action_down":
			$MaskPicker/Down.color = color;
		"action_left":
			$MaskPicker/Left.color = color;
		"action_right":
			$MaskPicker/Right.color = color;
		_:
			pass;
