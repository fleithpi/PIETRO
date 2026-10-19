extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	# Verifica se quem entrou na área é o jogador (CharacterBody2D)
	if body is CharacterBody2D:
		print("O jogador morreu!")
		
		# Opcional: reduz a velocidade do jogo levemente para dar efeito de impacto
		Engine.time_scale = 0.5
		
		# Desativa a colisão do jogador para ele não continuar colidindo enquanto cai
		var collision = body.get_node_or_null("CollisionShape2D")
		if collision:
			collision.queue_free()
			
		# Inicia o temporizador antes de reiniciar
		timer.start()


func _on_timer_timeout() -> void:
	# Restaura a velocidade normal do tempo do jogo
	Engine.time_scale = 1.0
	
	# Recarrega a fase atual automaticamente
	get_tree().reload_current_scene()
