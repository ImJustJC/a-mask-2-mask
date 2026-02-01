class_name UIManager
extends Control

func add_mask(where: StringName):
	match(where):
		"action_up":
			$MaskPicker/Up/MaskUI.visible = true;
			$MaskPicker/Up/Shade.visible = true;
		"action_down":
			$MaskPicker/Down/MaskUI.visible = true;
			$MaskPicker/Down/Shade.visible = true;
		"action_left":
			$MaskPicker/Left/MaskUI.visible = true;
			$MaskPicker/Left/Shade.visible = true;
		"action_right":
			$MaskPicker/Right/MaskUI.visible = true;
			$MaskPicker/Right/Shade.visible = true;
		_:
			pass;

func select_mask(where: StringName):
	$MaskPicker/Up/MaskUI.modulate.a = 0.25;
	$MaskPicker/Down/MaskUI.modulate.a = 0.25;
	$MaskPicker/Left/MaskUI.modulate.a = 0.25;
	$MaskPicker/Right/MaskUI.modulate.a = 0.25;
	match(where):
		"action_up":
			$MaskPicker/Up/MaskUI.modulate.a = 1;
		"action_down":
			$MaskPicker/Down/MaskUI.modulate.a = 1;
		"action_left":
			$MaskPicker/Left/MaskUI.modulate.a = 1;
		"action_right":
			$MaskPicker/Right/MaskUI.modulate.a = 1;
		_:
			pass;
