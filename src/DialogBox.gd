extends CanvasLayer

@export_file("*.json") var scene_text_file

var scene_text = {}
var selected_text = []
var in_progress = false

@onready var background = $Background
@onready var text_label = $TextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	print(scene_text_file)
	background.visible = false
	scene_text = load_scene_text()


func show_text():
	text_label.text = selected_text.pop_front()
	
func load_scene_text():
	var file = FileAccess.open("res://json/test.json", FileAccess.READ)
	var text = JSON.parse_string(file.get_as_text())
	return text
		
func next_line():
	if selected_text.size() > 0:
		show_text()
	else:
		finish()

func finish():
	await get_tree().create_timer(0.01).timeout
	text_label.text = ""
	background.visible = false
	in_progress = false
	get_tree().paused = false
	get_node("../Player").is_paused = false
	print("Done")

func start_dialogue(text_key):
	if in_progress:
		next_line()
	else:	
		get_tree().paused = true
		get_node("../Player").is_paused = true
		background.visible = true
		in_progress = true
		selected_text = scene_text[text_key].duplicate()
		show_text()
	
func _input(event):
	if event.is_action_pressed("ui_accept") and in_progress == true:
		next_line()
