extends CharacterBody2D


const SPEED = 300.0
var direcao = Vector2.ZERO

func _physics_process(delta: float) -> void:
	mover()
	rotacionar_corpo()

	move_and_slide()
	
func mover():
	
	direcao = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direcao * SPEED
	
func rotacionar_corpo():
	look_at(get_global_mouse_position())
	
	
	
