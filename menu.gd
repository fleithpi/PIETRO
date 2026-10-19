extends Control

func _ready() -> void:
	$Jogar.pressed.connect(_on_jogar_pressed)
	$Sair.pressed.connect(_on_sair_pressed)

func _on_jogar_pressed() -> void:
	get_tree().change_scene_to_file("res://player2.tscn")

func _on_sair_pressed() -> void:
	get_tree().quit()
