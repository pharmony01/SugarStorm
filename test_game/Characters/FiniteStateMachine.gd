extends FiniteStateMachine

func _init() -> void:
	_add_state("idle")
	_add_state("move")
	
func _ready() -> void:
	set_state(states.idle)
	
func _state_logic(_delta: float) -> void:
	if state == states.idle or state == states.move:
		parent.get_input()
		parent.move()

func _get_transition() -> int:
	match state:
		states.idle:
			if parent.velocity.length() > 10:
				return states.move
		states.move:
			if parent.velocity.length() < 10:
				return states.idle
	return -1
