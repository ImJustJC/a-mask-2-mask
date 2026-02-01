class_name NPCMatcher
extends Node2D

@export var MASK_TYPES : Dictionary[StringName, Color];
var NPC_COLLECTION : Dictionary[StringName, Array];

func _ready() -> void:
	for c in get_children():
		if c is not MaskedNPC:
			continue;
		var childNPC : MaskedNPC = c as MaskedNPC;
		if NPC_COLLECTION.has(childNPC.MASK_RELATIVE_ACTION):
			NPC_COLLECTION[childNPC.MASK_RELATIVE_ACTION].append(childNPC);
		else:
			NPC_COLLECTION[childNPC.MASK_RELATIVE_ACTION] = [childNPC];

func get_npcs_of_type(maskType: StringName) -> Array:
	return NPC_COLLECTION[maskType];

#func _process(_delta: float) -> void:
	#queue_redraw();

#func _draw() -> void:
	#for maskType in NPC_COLLECTION:
		#var arrayNPC : Array = NPC_COLLECTION[maskType];
		#var linePoints : PackedVector2Array;
		#for p in arrayNPC:
			#linePoints.append((p as MaskedNPC).position);
		#draw_polyline(linePoints, MASK_TYPES[maskType], 1.5);
