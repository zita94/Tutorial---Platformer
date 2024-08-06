extends State

class_name AttackState

@export var return_state : State
@export var return_animation_node : String = "move"
@export var attack_animation : String = "attack"
@export var attack_combo_animation : String = "attack"
@export var attack_combo_node : String = "attack_combo"

@onready var timer : Timer = $Timer

func state_input(event: InputEvent):
	if(event.is_action_pressed("attack")):
		timer.start()
		
func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == attack_animation):
		if(timer.is_stopped()):
			next_state = return_state
			playback.travel(return_animation_node)
		else:
			playback.travel(attack_combo_node)
	if(anim_name == attack_combo_animation):
		next_state = return_state
