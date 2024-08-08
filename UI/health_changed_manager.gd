extends Control

@export var health_changed_label : PackedScene
@export var damage_colour : Color = Color.CRIMSON
@export var heal_colour : Color = Color.CHARTREUSE

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.connect("on_health_changed", on_signal_health_changed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_signal_health_changed(node : Node, amount_changed : float):
	var label_instance : Label = health_changed_label.instantiate()
	node.add_child(label_instance)
	label_instance.text = str(amount_changed)
	
	if(amount_changed >= 0):
		label_instance.modulate = heal_colour
	else:
		label_instance.modulate = damage_colour
