extends CharacterBody2D


const SPEED = 300.0
var direcao = Vector2.ZERO
@onready var ponta_arma = $PontaDaArma
@export var bala_cena: PackedScene
@onready var som_tiro = $somdetiro

func _physics_process(delta: float) -> void:
	mover()
	rotacionar_corpo()
	
	move_and_slide()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("atirar"):
		disparar()
		
		
func disparar():
	var nova_bala = bala_cena.instantiate()
	nova_bala.global_position = ponta_arma.global_position
	nova_bala.direcao = (ponta_arma.global_position - global_position). normalized()
	nova_bala.rotation = (rotation)
	get_tree().current_scene.add_child(nova_bala)
	som_tiro.play(0.4)
	await get_tree().create_timer(0.7).timeout
	som_tiro.stop()
	
func mover():
	
	direcao = Input.get_vector("andar_esquerda", "andar_direita", "andar_cima", "andar_baixo")
	velocity = direcao * SPEED
	
func rotacionar_corpo():
	look_at(get_global_mouse_position())
	
	
	
