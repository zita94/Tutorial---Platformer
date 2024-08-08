extends State

class_name GroundState
@export var jump_velocity : float = -800.0
@export var air_state: State
@export var jump_animation : String = "jump"
@export var attack_animation : String = "attack"
@export var attack_state : State

@onready var buffer_timer : Timer = $BufferTimer
func state_process(delta):
	if(!character.is_on_floor() && buffer_timer.is_stopped()):
		next_state = air_state

func state_input(event : InputEvent):
	if(event.is_action_pressed("jump")):
		jump()
	if(event.is_action_pressed("attack")):
		attack()

func jump():
	next_state = air_state
	playback.travel(jump_animation)
	character.velocity.y = jump_velocity
	
func attack():
	next_state = attack_state
	playback.travel(attack_animation)
