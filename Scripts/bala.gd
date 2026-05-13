extends Area2D

var velocidade = 500
var direcao = Vector2.ZERO


func _physics_process(delta: float) ->  void:
	position += velocidade * direcao * delta
	
	
