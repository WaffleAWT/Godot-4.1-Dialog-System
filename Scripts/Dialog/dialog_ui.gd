extends MarginContainer

@export var text_speed : float = 0.05
@export var dialogs : Array [Dialog]
@export var character_name : String

@onready var timer : Timer = $Box/Timer
@onready var dialog_text : RichTextLabel = $Box/Text
@onready var name_text : RichTextLabel = $Box/Name

var counter : int = 0

func _ready():
	name_text.text = character_name
	update_texts()
	timer.wait_time = text_speed

func _on_timer_timeout():
	if dialog_text.visible_characters < len(dialog_text.text):
		dialog_text.visible_characters += 1
		timer.start()

func _process(_delta):
	if timer.is_stopped() and visible and dialog_text.visible_characters < len(dialog_text.text):
		timer.start()
	
	if Input.is_action_just_pressed("ui_accept") and visible:
		if dialog_text.visible_characters < len(dialog_text.text):
			timer.stop()
			dialog_text.visible_characters = len(dialog_text.text)
		else:
			update_texts()

func update_texts():
	if counter < dialogs.size():
		counter += 1
		dialog_text.text = dialogs[counter - 1].text
		dialog_text.visible_characters = 0
		timer.start()
	else:
		queue_free()
