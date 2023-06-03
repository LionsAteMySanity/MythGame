extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var invList = []
var is_paused = false


func add_inv(item):
	invList.append(item)

func _input(event):
	if event.is_action_pressed("ui_accept") && not is_paused:
		print(is_paused)
		var bodies = get_node("IntRad").get_overlapping_bodies()
		for body in bodies:
			if (body.get_meta("Interactable")):
				body.interact()
				
				break

func _physics_process(_delta):
	var horizontal = Input.get_axis("ui_left", "ui_right")
	var vertical = Input.get_axis("ui_up", "ui_down")
	if horizontal:
		velocity.x = horizontal * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if vertical:
		velocity.y = vertical * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
