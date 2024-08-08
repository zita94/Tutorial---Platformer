extends State

class_name HitState

@export var damageable : Damageable
@export var character_state_machine : CharacterStateMachine
@export var dead_state : State
@export var return_state : State
@export var dead_animation_node : String = "die"
@export var damaged_animation_node : String = "take_damage"
@export var walk_animation_node : String = "walk"
@export var knockback_speed : float = 100

func _ready():
	damageable.connect("on_hit", on_damageable_hit)
	
	
func on_enter():
	playback.travel(damaged_animation_node)
	

func on_damageable_hit(node : Node, damage_amount : float, knockback_direction : Vector2):
	if(damageable.health > 0):
		character.velocity = knockback_speed * knockback_direction
		emit_signal("interrupt_state", self)
	else:
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation_node)
		
func on_exit():
	character.velocity = Vector2.ZERO


func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == damaged_animation_node && damageable.health > 0 ):
		playback.travel(walk_animation_node)
		next_state = return_state
