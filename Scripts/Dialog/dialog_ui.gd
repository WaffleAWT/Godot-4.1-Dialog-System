extends MarginContainer

@export var dialog : Dialog
@export var text_speed : float = 0.05

@onready var timer : Timer = $Box/Timer
@onready var dialog_text : RichTextLabel = $Box/Text

func _ready():
	timer.wait_time = text_speed
	dialog_text.visible_characters = 0
	timer.start()

func _on_timer_timeout():
	if dialog_text.visible_characters < len(dialog_text.text):
		dialog_text.visible_characters += 1
		timer.start()
