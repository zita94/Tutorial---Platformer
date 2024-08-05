extends State

class_name GroundState
@export var jump_velocity : float = -800.0
@export var air_state: State
@export var jump_animation : String = "jump"

var jump_start_playing : bool = false

func state_process(delta):
	if(!character.is_on_floor()):
		next_state = air_state

func state_input(event : InputEvent):
	if(event.is_action_pressed("jump")):
		jump()
		

func jump():
	next_state = air_state
	playback.travel(jump_animation)
	character.velocity.y = jump_velocity
	
