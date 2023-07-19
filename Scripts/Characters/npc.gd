extends Area2D

var can_see_body : bool = false

@onready var dialog_ui = $CanvasLayer/DialogUI

func _on_body_entered(_body):
	can_see_body = true

func _on_body_exited(_body):
	can_see_body = false

func _process(_delta):
	if Input.is_action_just_pressed("interact") and can_see_body and dialog_ui != null:
		dialog_ui.visible = true
		dialog_ui.dialog_text.visible_characters = 0
