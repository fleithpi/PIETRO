extends Area2D

@onready var som: AudioStreamPlayer = $AudioStreamPlayer
var coletada := false

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if coletada:
		return
	if body.has_method("die"):
		coletada = true
		Global.moedas += 1
		som.play()
		hide()
		$CollisionShape2D.set_deferred("disabled", true)
		await som.finished
		queue_free()
